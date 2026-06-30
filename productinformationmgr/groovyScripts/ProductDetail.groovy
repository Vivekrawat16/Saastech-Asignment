import org.apache.ofbiz.entity.util.EntityQuery

productId = parameters.productId
if (productId) {
    product = EntityQuery.use(delegator).from("PimProduct").where("productId", productId).queryOne()
    context.product = product
    
    if (product) {
        // Fetch prices
        productPrices = EntityQuery.use(delegator).from("PimProductPrice").where("productId", productId).queryList()
        context.productPrices = productPrices
        
        // Fetch contents
        productContents = EntityQuery.use(delegator).from("PimProductContent").where("productId", productId).queryList()
        context.productContents = productContents
        
        // Fetch dimensions
        productDimensions = EntityQuery.use(delegator).from("PimProductDimension").where("productId", productId).queryList()
        context.productDimensions = productDimensions
        
        // Fetch associations (where this product is source)
        productAssocs = EntityQuery.use(delegator).from("PimProductAssoc").where("productId", productId).queryList()
        context.productAssocs = productAssocs
        
        // Fetch associations (where this product is target)
        productAssocsTo = EntityQuery.use(delegator).from("PimProductAssoc").where("toProductId", productId).queryList()
        context.productAssocsTo = productAssocsTo
        
        // Fetch category memberships
        categoryMembers = EntityQuery.use(delegator).from("PimProductCategoryMember").where("productId", productId).queryList()
        context.categoryMembers = categoryMembers
        
        // Fetch applied features
        featureAppls = EntityQuery.use(delegator).from("PimProductFeatureAppl").where("productId", productId).queryList()
        context.featureAppls = featureAppls
    }
}
