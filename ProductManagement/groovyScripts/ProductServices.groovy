import org.apache.ofbiz.entity.util.EntityQuery
import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityOperator
import org.apache.ofbiz.entity.condition.EntityFieldValue
import org.apache.ofbiz.entity.condition.EntityFunction
import org.apache.ofbiz.entity.GenericValue
import java.sql.Timestamp

/**
 * findProduct service logic
 */
def findProduct() {
    List<EntityCondition> condList = []
    
    if (parameters.productId) {
        condList.add(EntityCondition.makeCondition(EntityFunction.upper(EntityFieldValue.makeFieldValue("productId")), EntityOperator.LIKE, "%" + parameters.productId.toUpperCase() + "%"))
    }
    if (parameters.productName) {
        condList.add(EntityCondition.makeCondition(EntityFunction.upper(EntityFieldValue.makeFieldValue("productName")), EntityOperator.LIKE, "%" + parameters.productName.toUpperCase() + "%"))
    }
    if (parameters.productCategoryId) {
        condList.add(EntityCondition.makeCondition("productCategoryId", EntityOperator.EQUALS, parameters.productCategoryId))
    }
    if (parameters.productFeatureId) {
        condList.add(EntityCondition.makeCondition("productFeatureId", EntityOperator.EQUALS, parameters.productFeatureId))
    }
    if (parameters.minPrice) {
        condList.add(EntityCondition.makeCondition("price", EntityOperator.GREATER_THAN_EQUAL_TO, parameters.minPrice))
    }
    if (parameters.maxPrice) {
        condList.add(EntityCondition.makeCondition("price", EntityOperator.LESS_THAN_EQUAL_TO, parameters.maxPrice))
    }
    
    // Only search for LIST_PRICE to match core list pricing requirements
    condList.add(EntityCondition.makeCondition("productPriceTypeId", EntityOperator.EQUALS, "LIST_PRICE"))
    
    EntityCondition cond = EntityCondition.makeCondition(condList, EntityOperator.AND)
    List products = EntityQuery.use(delegator).from("FindProductView").where(cond).queryList()
    
    return [productList: products, responseMessage: "success"]
}

/**
 * createProduct service logic
 */
def createProduct() {
    // 1. Check if name is unique (exact case-insensitive match check)
    def findRes = runService("findProduct", [productName: parameters.productName])
    if (findRes && findRes.productList) {
        boolean nameExists = findRes.productList.any { parameters.productName.equalsIgnoreCase(it.productName) || parameters.productName.equalsIgnoreCase(it.internalName) }
        if (nameExists) {
            return error("Product with name '" + parameters.productName + "' already exists. Name must be unique.")
        }
    }
    
    Timestamp nowTimestamp = new Timestamp(System.currentTimeMillis())
    String productId = parameters.productId ?: delegator.getNextSeqId("Product")
    
    // 2. Create base Product
    GenericValue product = delegator.makeValue("Product", [
        productId: productId,
        productName: parameters.productName,
        internalName: parameters.productName,
        productTypeId: "FINISHED_GOOD",
        isVirtual: parameters.isVirtual ?: "N",
        isVariant: parameters.isVariant ?: "N"
    ])
    delegator.create(product)
    
    // 3. Create List Price
    GenericValue productPrice = delegator.makeValue("ProductPrice", [
        productId: productId,
        productPriceTypeId: "LIST_PRICE",
        productPricePurposeId: "PURCHASE",
        productStoreGroupId: "_NA_",
        currencyUomId: "USD",
        fromDate: nowTimestamp,
        price: parameters.price
    ])
    delegator.create(productPrice)
    
    // 4. Assign Category
    GenericValue pcm = delegator.makeValue("ProductCategoryMember", [
        productId: productId,
        productCategoryId: parameters.productCategoryId,
        fromDate: nowTimestamp
    ])
    delegator.create(pcm)
    
    return [productIdResult: productId, responseMessage: "success"]
}

/**
 * updateProduct service logic
 */
def updateProduct() {
    GenericValue product = delegator.findOne("Product", [productId: parameters.productId], true)
    if (!product) {
        return error("Product with ID '" + parameters.productId + "' does not exist.")
    }
    
    Timestamp nowTimestamp = new Timestamp(System.currentTimeMillis())
    
    // Update price if provided
    if (parameters.price) {
        List prices = EntityQuery.use(delegator).from("ProductPrice")
            .where("productId", parameters.productId, "productPriceTypeId", "LIST_PRICE")
            .queryList()
        if (prices) {
            for (GenericValue prc : prices) {
                prc.price = parameters.price
                delegator.store(prc)
            }
        } else {
            GenericValue productPrice = delegator.makeValue("ProductPrice", [
                productId: parameters.productId,
                productPriceTypeId: "LIST_PRICE",
                productPricePurposeId: "PURCHASE",
                productStoreGroupId: "_NA_",
                currencyUomId: "USD",
                fromDate: nowTimestamp,
                price: parameters.price
            ])
            delegator.create(productPrice)
        }
    }
    
    // Apply feature if provided
    if (parameters.productFeatureId) {
        GenericValue featureAppl = delegator.makeValue("ProductFeatureAppl", [
            productId: parameters.productId,
            productFeatureId: parameters.productFeatureId,
            productFeatureApplTypeId: "STANDARD_FEATURE",
            fromDate: nowTimestamp
        ])
        delegator.createOrStore(featureAppl)
    }
    
    return [responseMessage: "success"]
}

/**
 * assocProductToVirtual service logic
 */
def assocProductToVirtual() {
    GenericValue variantProduct = delegator.findOne("Product", [productId: parameters.productId], true)
    GenericValue virtualProduct = delegator.findOne("Product", [productId: parameters.virtualProductId], true)
    if (!variantProduct) {
        return error("Variant Product with ID '" + parameters.productId + "' does not exist.")
    }
    if (!virtualProduct) {
        return error("Virtual Product with ID '" + parameters.virtualProductId + "' does not exist.")
    }
    
    Timestamp nowTimestamp = new Timestamp(System.currentTimeMillis())
    
    GenericValue assoc = delegator.makeValue("ProductAssoc", [
        productId: parameters.virtualProductId,
        productIdTo: parameters.productId,
        productAssocTypeId: "PRODUCT_VARIANT",
        fromDate: nowTimestamp
    ])
    delegator.create(assoc)
    
    return [responseMessage: "success"]
}

/**
 * updateProductVariant service logic
 */
def updateProductVariant() {
    GenericValue assoc = EntityQuery.use(delegator).from("ProductAssoc")
        .where("productId", parameters.virtualProductId, "productIdTo", parameters.productId, "productAssocTypeId", "PRODUCT_VARIANT")
        .filterByDate()
        .queryFirst()
    if (!assoc) {
        return error("No active variant association found between virtual '" + parameters.virtualProductId + "' and variant '" + parameters.productId + "'.")
    }
    
    if (parameters.thruDate) {
        assoc.thruDate = parameters.thruDate
        delegator.store(assoc)
    }
    
    return [responseMessage: "success"]
}
