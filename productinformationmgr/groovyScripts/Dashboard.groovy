import org.apache.ofbiz.entity.util.EntityQuery

totalProducts = EntityQuery.use(delegator).from("PimProduct").queryCount()
virtualProducts = EntityQuery.use(delegator).from("PimProduct").where("isVirtual", "Y").queryCount()
variantProducts = EntityQuery.use(delegator).from("PimProduct").where("isVariant", "Y").queryCount()
totalCategories = EntityQuery.use(delegator).from("PimProductCategory").queryCount()
totalFeatures = EntityQuery.use(delegator).from("PimProductFeature").queryCount()

context.totalProducts = totalProducts
context.virtualProducts = virtualProducts
context.variantProducts = variantProducts
context.totalCategories = totalCategories
context.totalFeatures = totalFeatures

// Latest 5 products
latestProducts = EntityQuery.use(delegator).from("PimProduct").orderBy("fromDate DESC").maxRows(5).queryList()
context.latestProducts = latestProducts
