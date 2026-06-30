package org.apache.ofbiz.customermanagement

import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityFieldValue
import org.apache.ofbiz.entity.condition.EntityFunction
import org.apache.ofbiz.entity.condition.EntityOperator
import org.apache.ofbiz.service.ServiceUtil
import java.sql.Timestamp

/**
 * Find Customer Service
 */
def findCustomer() {
    Map<String, Object> result = ServiceUtil.returnSuccess()
    List<EntityCondition> conds = []

    if (parameters.partyId) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("partyId")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.partyId + "%"))
        ))
    }
    if (parameters.emailAddress) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("emailAddress")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.emailAddress + "%"))
        ))
    }
    if (parameters.firstName) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("firstName")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.firstName + "%"))
        ))
    }
    if (parameters.lastName) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("lastName")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.lastName + "%"))
        ))
    }
    if (parameters.contactNumber) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("contactNumber")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.contactNumber + "%"))
        ))
    }
    if (parameters.address1) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("address1")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.address1 + "%"))
        ))
    }
    if (parameters.city) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("city")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.city + "%"))
        ))
    }
    if (parameters.stateProvinceGeoId) {
        conds.add(EntityCondition.makeCondition("stateProvinceGeoId", EntityOperator.EQUALS, parameters.stateProvinceGeoId))
    }
    if (parameters.postalCode) {
        conds.add(EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("postalCode")),
            EntityOperator.LIKE,
            EntityFunction.upper(EntityFieldValue.makeFieldValue("%" + parameters.postalCode + "%"))
        ))
    }
    if (parameters.countryGeoId) {
        conds.add(EntityCondition.makeCondition("countryGeoId", EntityOperator.EQUALS, parameters.countryGeoId))
    }

    EntityCondition searchCond = null
    if (conds) {
        searchCond = EntityCondition.makeCondition(conds, EntityOperator.AND)
    }

    List<GenericValue> customerList = delegator.findList("FindCustomerView", searchCond, null, null, null, false)
    result.put("customerList", customerList)
    return result
}

/**
 * Create Customer Service
 */
def createCustomer() {
    // 1. Check if email already exists (case-insensitive exact match)
    List<EntityCondition> dupConds = [
        EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("emailAddress")),
            EntityOperator.EQUALS,
            EntityFunction.upper(parameters.emailAddress)
        )
    ]
    List<GenericValue> dupCheckList = delegator.findList("FindCustomerView", EntityCondition.makeCondition(dupConds, EntityOperator.AND), null, null, null, false)
    if (dupCheckList) {
        return ServiceUtil.returnError("Customer with email address '" + parameters.emailAddress + "' already exists.")
    }

    // 2. Create the Person (and Party) record using core service
    Map<String, Object> createPersonCtx = dispatcher.getDispatchContext().makeValidContext("createPerson", "IN", parameters)
    Map<String, Object> createPersonResult = dispatcher.runSync("createPerson", createPersonCtx)
    if (!ServiceUtil.isSuccess(createPersonResult)) {
        return createPersonResult
    }
    String partyId = createPersonResult.get("partyId")

    // Ensure the customer is in the _NA_ role
    dispatcher.runSync("ensureNaPartyRole", [partyId: partyId])

    // 3. Create Email Contact Mech with purpose EmailPrimary
    Map<String, Object> createEmailResult = dispatcher.runSync("createPartyEmailAddress", [
        partyId: partyId,
        emailAddress: parameters.emailAddress,
        contactMechPurposeTypeId: "EmailPrimary"
    ])
    if (!ServiceUtil.isSuccess(createEmailResult)) {
        return createEmailResult
    }

    // 4. Create Phone Number Contact Mech with purpose PhonePrimary (if contactNumber provided)
    if (parameters.contactNumber) {
        Map<String, Object> createPhoneResult = dispatcher.runSync("createPartyTelecomNumber", [
            partyId: partyId,
            contactNumber: parameters.contactNumber,
            contactMechPurposeTypeId: "PhonePrimary"
        ])
        if (!ServiceUtil.isSuccess(createPhoneResult)) {
            return createPhoneResult
        }
    }

    // 5. Create Postal Address Contact Mech with purpose PostalPrimary (if address1 provided)
    if (parameters.address1) {
        Map<String, Object> postalCtx = [
            partyId: partyId,
            address1: parameters.address1,
            address2: parameters.address2 ?: "",
            city: parameters.city ?: "N/A",
            stateProvinceGeoId: parameters.stateProvinceGeoId ?: "_NA_",
            postalCode: parameters.postalCode ?: "00000",
            countryGeoId: parameters.countryGeoId ?: "USA",
            contactMechPurposeTypeId: "PostalPrimary"
        ]
        Map<String, Object> createPostalResult = dispatcher.runSync("createPartyPostalAddress", postalCtx)
        if (!ServiceUtil.isSuccess(createPostalResult)) {
            return createPostalResult
        }
    }

    Map<String, Object> result = ServiceUtil.returnSuccess("Customer created successfully with Party ID " + partyId)
    result.put("partyIdResult", partyId)
    return result
}

/**
 * Update Customer Service
 */
def updateCustomer() {
    // 1. Verify customer exists by email address (case-insensitive exact match)
    List<EntityCondition> findConds = [
        EntityCondition.makeCondition(
            EntityFunction.upper(EntityFieldValue.makeFieldValue("emailAddress")),
            EntityOperator.EQUALS,
            EntityFunction.upper(parameters.emailAddress)
        )
    ]
    List<GenericValue> customers = delegator.findList("FindCustomerView", EntityCondition.makeCondition(findConds, EntityOperator.AND), null, null, null, false)
    if (!customers) {
        return ServiceUtil.returnError("No customer found with email address '" + parameters.emailAddress + "'.")
    }

    String partyId = customers.get(0).get("partyId")

    // 2. Update Phone Number Contact Mech (with purpose PhonePrimary)
    if (parameters.contactNumber) {
        // Check if PhonePrimary exists
        List<GenericValue> phonePurposes = delegator.findList("PartyContactMechPurpose", 
            EntityCondition.makeCondition([
                EntityCondition.makeCondition("partyId", EntityOperator.EQUALS, partyId),
                EntityCondition.makeCondition("contactMechPurposeTypeId", EntityOperator.EQUALS, "PhonePrimary"),
                EntityCondition.makeCondition("thruDate", EntityOperator.EQUALS, null)
            ], EntityOperator.AND), null, null, null, false)
        
        if (phonePurposes) {
            String contactMechId = phonePurposes.get(0).get("contactMechId")
            Map<String, Object> updatePhoneResult = dispatcher.runSync("updatePartyTelecomNumber", [
                partyId: partyId,
                contactMechId: contactMechId,
                contactNumber: parameters.contactNumber
            ])
            if (!ServiceUtil.isSuccess(updatePhoneResult)) {
                return updatePhoneResult
            }
        } else {
            // Create brand new PhonePrimary
            Map<String, Object> createPhoneResult = dispatcher.runSync("createPartyTelecomNumber", [
                partyId: partyId,
                contactNumber: parameters.contactNumber,
                contactMechPurposeTypeId: "PhonePrimary"
            ])
            if (!ServiceUtil.isSuccess(createPhoneResult)) {
                return createPhoneResult
            }
        }
    }

    // 3. Update Postal Address Contact Mech (with purpose PostalPrimary)
    if (parameters.address1) {
        // Check if PostalPrimary exists
        List<GenericValue> postalPurposes = delegator.findList("PartyContactMechPurpose", 
            EntityCondition.makeCondition([
                EntityCondition.makeCondition("partyId", EntityOperator.EQUALS, partyId),
                EntityCondition.makeCondition("contactMechPurposeTypeId", EntityOperator.EQUALS, "PostalPrimary"),
                EntityCondition.makeCondition("thruDate", EntityOperator.EQUALS, null)
            ], EntityOperator.AND), null, null, null, false)

        Map<String, Object> postalCtx = [
            partyId: partyId,
            address1: parameters.address1,
            address2: parameters.address2 ?: "",
            city: parameters.city ?: "N/A",
            stateProvinceGeoId: parameters.stateProvinceGeoId ?: "_NA_",
            postalCode: parameters.postalCode ?: "00000",
            countryGeoId: parameters.countryGeoId ?: "USA"
        ]

        if (postalPurposes) {
            String contactMechId = postalPurposes.get(0).get("contactMechId")
            postalCtx.put("contactMechId", contactMechId)
            Map<String, Object> updatePostalResult = dispatcher.runSync("updatePartyPostalAddress", postalCtx)
            if (!ServiceUtil.isSuccess(updatePostalResult)) {
                return updatePostalResult
            }
        } else {
            // Create brand new PostalPrimary
            postalCtx.put("contactMechPurposeTypeId", "PostalPrimary")
            Map<String, Object> createPostalResult = dispatcher.runSync("createPartyPostalAddress", postalCtx)
            if (!ServiceUtil.isSuccess(createPostalResult)) {
                return createPostalResult
            }
        }
    }

    return ServiceUtil.returnSuccess("Customer details updated successfully.")
}

/**
 * Create Customer Relationship
 */
def createCustomerRelationship() {
    // 1. Ensure roles exist
    dispatcher.runSync("ensurePartyRole", [partyId: parameters.partyIdFrom, roleTypeId: parameters.roleTypeIdFrom])
    dispatcher.runSync("ensurePartyRole", [partyId: parameters.partyIdTo, roleTypeId: parameters.roleTypeIdTo])

    // 2. Create the relationship
    Map<String, Object> createRelCtx = [
        partyIdFrom: parameters.partyIdFrom,
        partyIdTo: parameters.partyIdTo,
        roleTypeIdFrom: parameters.roleTypeIdFrom,
        roleTypeIdTo: parameters.roleTypeIdTo,
        partyRelationshipTypeId: parameters.partyRelationshipTypeId,
        statusId: parameters.statusId ?: "PARTYREL_CREATED",
        fromDate: new Timestamp(System.currentTimeMillis())
    ]
    Map<String, Object> createRelResult = dispatcher.runSync("createPartyRelationship", createRelCtx)
    return createRelResult
}

/**
 * Update Customer Relationship
 */
def updateCustomerRelationship() {
    Map<String, Object> updateRelCtx = [
        partyIdFrom: parameters.partyIdFrom,
        partyIdTo: parameters.partyIdTo,
        roleTypeIdFrom: parameters.roleTypeIdFrom,
        roleTypeIdTo: parameters.roleTypeIdTo,
        partyRelationshipTypeId: parameters.partyRelationshipTypeId,
        fromDate: parameters.fromDate,
        thruDate: parameters.thruDate,
        statusId: parameters.statusId
    ]
    Map<String, Object> updateRelResult = dispatcher.runSync("updatePartyRelationship", updateRelCtx)
    return updateRelResult
}
