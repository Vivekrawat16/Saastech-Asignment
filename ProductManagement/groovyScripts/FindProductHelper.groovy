import org.apache.ofbiz.entity.util.EntityQuery

// 1. Gather filters from parameters
Map serviceIn = [:]
if (parameters.productId) serviceIn.productId = parameters.productId
if (parameters.productName) serviceIn.productName = parameters.productName
if (parameters.productCategoryId) serviceIn.productCategoryId = parameters.productCategoryId
if (parameters.productFeatureId) serviceIn.productFeatureId = parameters.productFeatureId

if (parameters.minPrice) {
    try {
        serviceIn.minPrice = new BigDecimal(parameters.minPrice)
    } catch (NumberFormatException e) {
        // ignore
    }
}
if (parameters.maxPrice) {
    try {
        serviceIn.maxPrice = new BigDecimal(parameters.maxPrice)
    } catch (NumberFormatException e) {
        // ignore
    }
}

// 2. Call findProduct service
Map findRes = runService("findProduct", serviceIn)
if (findRes && findRes.productList) {
    context.productList = findRes.productList
} else {
    context.productList = []
}

// 3. Load all categories and features for UI dropdown inputs
context.categories = EntityQuery.use(delegator).from("ProductCategory").queryList()
context.features = EntityQuery.use(delegator).from("ProductFeature").queryList()
context.products = EntityQuery.use(delegator).from("Product").where("isVirtual", "Y").queryList()
