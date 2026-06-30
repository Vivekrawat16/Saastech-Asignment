import org.apache.ofbiz.entity.util.EntityQuery

totalOrders = EntityQuery.use(delegator).from("OmsOrderHeader").queryCount()
salesOrders = EntityQuery.use(delegator).from("OmsOrderHeader").where("orderTypeId", "SALES_ORDER").queryCount()
purchaseOrders = EntityQuery.use(delegator).from("OmsOrderHeader").where("orderTypeId", "PURCHASE_ORDER").queryCount()

context.totalOrders = totalOrders
context.salesOrders = salesOrders
context.purchaseOrders = purchaseOrders

// Fetch latest 5 orders
latestOrders = EntityQuery.use(delegator).from("OmsOrderHeader").orderBy("orderDate DESC").maxRows(5).queryList()
context.latestOrders = latestOrders
