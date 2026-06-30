package org.apache.ofbiz.productmanagement.test;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.ServiceUtil;
import org.apache.ofbiz.service.testtools.OFBizTestCase;

public class ProductManagementTests extends OFBizTestCase {

    public ProductManagementTests(String name) {
        super(name);
    }

    public void testProductManagementFlow() throws Exception {
        GenericValue userLogin = getUserLogin("system");
        
        // 1. Create a category for testing
        getDelegator().create("ProductCategory", "productCategoryId", "TEST_CAT", "productCategoryTypeId", "CATALOG_CATEGORY", "categoryName", "Test Category");
        
        // 2. Create a feature for testing
        getDelegator().create("ProductFeature", "productFeatureId", "TEST_FEAT_RED", "productFeatureTypeId", "COLOR", "description", "Red Test Feature");

        // 3. Test createProduct service (success)
        Map<String, Object> createCtx = new HashMap<>();
        createCtx.put("userLogin", userLogin);
        createCtx.put("productId", "TEST_PROD_01");
        createCtx.put("productName", "Test Product Unique Name");
        createCtx.put("productCategoryId", "TEST_CAT");
        createCtx.put("price", new BigDecimal("100.00"));
        createCtx.put("isVirtual", "Y");
        
        Map<String, Object> createResult = getDispatcher().runSync("createProduct", createCtx);
        assertTrue(ServiceUtil.isSuccess(createResult));
        assertEquals("TEST_PROD_01", createResult.get("productIdResult"));

        // 4. Test createProduct service uniqueness violation (should fail)
        Map<String, Object> createDupCtx = new HashMap<>();
        createDupCtx.put("userLogin", userLogin);
        createDupCtx.put("productId", "TEST_PROD_02");
        createDupCtx.put("productName", "TEST PRODUCT UNIQUE NAME"); // case-insensitive duplicate name
        createDupCtx.put("productCategoryId", "TEST_CAT");
        createDupCtx.put("price", new BigDecimal("150.00"));
        
        Map<String, Object> createDupResult = getDispatcher().runSync("createProduct", createDupCtx);
        assertTrue(ServiceUtil.isError(createDupResult));
        
        // 5. Test findProduct service (by name, case-insensitive, partial)
        Map<String, Object> findCtx = new HashMap<>();
        findCtx.put("userLogin", userLogin);
        findCtx.put("productName", "unique name");
        
        Map<String, Object> findResult = getDispatcher().runSync("findProduct", findCtx);
        assertTrue(ServiceUtil.isSuccess(findResult));
        List<GenericValue> productList = (List<GenericValue>) findResult.get("productList");
        assertNotNull(productList);
        assertTrue(productList.size() > 0);
        assertEquals("TEST_PROD_01", productList.get(0).get("productId"));

        // 6. Test updateProduct service (updating price and adding feature)
        Map<String, Object> updateCtx = new HashMap<>();
        updateCtx.put("userLogin", userLogin);
        updateCtx.put("productId", "TEST_PROD_01");
        updateCtx.put("price", new BigDecimal("120.00"));
        updateCtx.put("productFeatureId", "TEST_FEAT_RED");
        
        Map<String, Object> updateResult = getDispatcher().runSync("updateProduct", updateCtx);
        assertTrue(ServiceUtil.isSuccess(updateResult));

        // 7. Test variant creation and assocProductToVirtual
        // Create variant product first
        getDelegator().create("Product", "productId", "TEST_PROD_VAR", "productTypeId", "FINISHED_GOOD", "productName", "Test Product Variant", "isVirtual", "N", "isVariant", "Y");
        
        Map<String, Object> assocCtx = new HashMap<>();
        assocCtx.put("userLogin", userLogin);
        assocCtx.put("productId", "TEST_PROD_VAR");
        assocCtx.put("virtualProductId", "TEST_PROD_01");
        
        Map<String, Object> assocResult = getDispatcher().runSync("assocProductToVirtual", assocCtx);
        assertTrue(ServiceUtil.isSuccess(assocResult));

        // 8. Test updateProductVariant service
        Map<String, Object> updateVarCtx = new HashMap<>();
        updateVarCtx.put("userLogin", userLogin);
        updateVarCtx.put("productId", "TEST_PROD_VAR");
        updateVarCtx.put("virtualProductId", "TEST_PROD_01");
        updateVarCtx.put("thruDate", new Timestamp(System.currentTimeMillis() + 86400000)); // 1 day from now
        
        Map<String, Object> updateVarResult = getDispatcher().runSync("updateProductVariant", updateVarCtx);
        assertTrue(ServiceUtil.isSuccess(updateVarResult));
    }
}
