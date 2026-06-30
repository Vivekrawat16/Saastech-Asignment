import org.apache.ofbiz.entity.util.EntityQuery
import java.util.Calendar

orderId = parameters.orderId
if (orderId) {
    orderHeader = EntityQuery.use(delegator).from("OmsOrderHeader").where("orderId", orderId).queryOne()
    context.orderHeader = orderHeader
    
    if (orderHeader) {
        // Fetch parts
        orderParts = EntityQuery.use(delegator).from("OmsOrderPart").where("orderId", orderId).queryList()
        context.orderParts = orderParts
        
        // Fetch items
        orderItems = EntityQuery.use(delegator).from("OmsOrderItem").where("orderId", orderId).queryList()
        context.orderItems = orderItems
        
        // Fetch contact mechs
        orderContactMechs = EntityQuery.use(delegator).from("OmsOrderContactMech").where("orderId", orderId).queryList()
        context.orderContactMechs = orderContactMechs
        
        // Fetch statuses
        orderStatuses = EntityQuery.use(delegator).from("OmsOrderStatus").where("orderId", orderId).orderBy("statusDatetime DESC").queryList()
        context.orderStatuses = orderStatuses
        
        // Fetch adjustments
        orderAdjustments = EntityQuery.use(delegator).from("OmsOrderAdjustment").where("orderId", orderId).queryList()
        context.orderAdjustments = orderAdjustments
        
        // Fetch payments
        orderPayments = EntityQuery.use(delegator).from("OmsOrderPayment").where("orderId", orderId).queryList()
        context.orderPayments = orderPayments

        // 1. Expected Delivery Time
        expectedDelivery = "Not estimated"
        if (orderHeader.orderDate) {
            Calendar cal = Calendar.getInstance()
            cal.setTime(orderHeader.orderDate)
            cal.add(Calendar.DATE, 5)
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd")
            expectedDelivery = sdf.format(cal.getTime())
        }
        context.expectedDelivery = expectedDelivery
        
        // 2. Who is responsible for paying
        payer = "Unknown"
        if (orderHeader.orderTypeId == "SALES_ORDER") {
            if (orderParts) {
                payerPart = orderParts.find { it.customerPartyId != null }
                if (payerPart) {
                    partyGroup = EntityQuery.use(delegator).from("PartyGroup").where("partyId", payerPart.customerPartyId).queryOne()
                    person = EntityQuery.use(delegator).from("Person").where("partyId", payerPart.customerPartyId).queryOne()
                    if (person) {
                        payer = person.firstName + " " + person.lastName + " (" + payerPart.customerPartyId + ")"
                    } else if (partyGroup) {
                        payer = partyGroup.groupName + " (" + payerPart.customerPartyId + ")"
                    } else {
                        payer = payerPart.customerPartyId
                    }
                }
            }
        } else if (orderHeader.orderTypeId == "PURCHASE_ORDER") {
            payer = "Default Company (COMPANY)"
        }
        context.payer = payer
        
        // 4. Involved People & Organizations
        involvedParties = []
        if (orderParts) {
            orderParts.each { part ->
                if (part.customerPartyId) {
                    person = EntityQuery.use(delegator).from("Person").where("partyId", part.customerPartyId).queryOne()
                    if (person) {
                        involvedParties << [partyId: part.customerPartyId, name: person.firstName + " " + person.lastName, role: "Customer (Person)"]
                    } else {
                        involvedParties << [partyId: part.customerPartyId, name: part.customerPartyId, role: "Customer"]
                    }
                }
                if (part.vendorPartyId) {
                    partyGroup = EntityQuery.use(delegator).from("PartyGroup").where("partyId", part.vendorPartyId).queryOne()
                    if (partyGroup) {
                        involvedParties << [partyId: part.vendorPartyId, name: partyGroup.groupName, role: "Vendor (Organization)"]
                    } else {
                        involvedParties << [partyId: part.vendorPartyId, name: part.vendorPartyId, role: "Vendor"]
                    }
                }
            }
        }
        context.involvedParties = involvedParties.unique { it.partyId }
        
        // 5. Who placed & shipping destination
        placingCustomer = "Unknown"
        shippingDestination = "No address specified"
        
        if (orderHeader.orderTypeId == "SALES_ORDER") {
            if (orderParts) {
                part = orderParts.first()
                if (part.customerPartyId) {
                    person = EntityQuery.use(delegator).from("Person").where("partyId", part.customerPartyId).queryOne()
                    if (person) {
                        placingCustomer = person.firstName + " " + person.lastName + " (" + part.customerPartyId + ")"
                    }
                }
                if (part.postalContactMechId) {
                    pa = EntityQuery.use(delegator).from("PostalAddress").where("contactMechId", part.postalContactMechId).queryOne()
                    if (pa) {
                        shippingDestination = (pa.toName ?: "") + ", " + pa.address1 + ", " + pa.city + ", " + (pa.stateProvinceGeoId ?: "") + " " + pa.postalCode
                    }
                }
            }
        } else if (orderHeader.orderTypeId == "PURCHASE_ORDER") {
            placingCustomer = "Default Company (COMPANY)"
            if (orderParts) {
                part = orderParts.first()
                if (part.postalContactMechId) {
                    pa = EntityQuery.use(delegator).from("PostalAddress").where("contactMechId", part.postalContactMechId).queryOne()
                    if (pa) {
                        shippingDestination = (pa.toName ?: "") + ", " + pa.address1 + ", " + pa.city + ", " + (pa.stateProvinceGeoId ?: "") + " " + pa.postalCode
                    }
                }
            }
        }
        context.placingCustomer = placingCustomer
        context.shippingDestination = shippingDestination
    }
}
