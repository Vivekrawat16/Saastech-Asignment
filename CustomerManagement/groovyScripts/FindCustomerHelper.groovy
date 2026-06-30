package org.apache.ofbiz.customermanagement

import org.apache.ofbiz.service.ServiceUtil

Map findCtx = [:]
findCtx.partyId = parameters.partyId
findCtx.emailAddress = parameters.emailAddress
findCtx.firstName = parameters.firstName
findCtx.lastName = parameters.lastName
findCtx.contactNumber = parameters.contactNumber
findCtx.address1 = parameters.address1
findCtx.city = parameters.city
findCtx.stateProvinceGeoId = parameters.stateProvinceGeoId
findCtx.postalCode = parameters.postalCode
findCtx.countryGeoId = parameters.countryGeoId

Map result = dispatcher.runSync("findCustomer", findCtx)
if (ServiceUtil.isSuccess(result)) {
    context.customerList = result.customerList
} else {
    context.customerList = []
}
