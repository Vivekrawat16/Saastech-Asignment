<style>
  :root {
    --bg-gradient-start: #0f172a;
    --bg-gradient-end: #1e293b;
    --card-bg: rgba(30, 41, 59, 0.7);
    --card-hover: rgba(30, 41, 59, 0.95);
    --border-color: rgba(255, 255, 255, 0.08);
    --text-primary: #f8fafc;
    --text-secondary: #94a3b8;
    --accent-blue: #38bdf8;
    --accent-purple: #c084fc;
    --accent-green: #4ade80;
    --accent-orange: #fb923c;
    --accent-pink: #f472b6;
    --accent-red: #ef4444;
  }

  .pim-detail-container {
    background: linear-gradient(135deg, var(--bg-gradient-start), var(--bg-gradient-end));
    color: var(--text-primary);
    font-family: 'Inter', system-ui, sans-serif;
    padding: 2.5rem;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    margin-bottom: 2rem;
  }

  .detail-header {
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 1.5rem;
    margin-bottom: 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .product-title h1 {
    font-size: 2rem;
    font-weight: 800;
    color: var(--text-primary);
    margin: 0;
  }

  .product-title p {
    color: var(--accent-blue);
    font-weight: 600;
    margin-top: 0.25rem;
    font-size: 1rem;
  }

  .detail-grid {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 2rem;
  }

  @media (max-width: 1024px) {
    .detail-grid {
      grid-template-columns: 1fr;
    }
  }

  .detail-card {
    background: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 12px;
    padding: 1.75rem;
    margin-bottom: 1.5rem;
    backdrop-filter: blur(10px);
  }

  .card-title {
    font-size: 1.15rem;
    font-weight: 700;
    margin-bottom: 1.25rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: var(--text-primary);
    border-left: 3px solid var(--accent-blue);
    padding-left: 0.75rem;
  }

  .q-badge {
    background-color: var(--accent-purple);
    color: white;
    font-size: 0.75rem;
    font-weight: 700;
    padding: 0.2rem 0.5rem;
    border-radius: 4px;
    text-transform: uppercase;
  }

  .info-table {
    width: 100%;
    border-collapse: collapse;
  }

  .info-table th {
    text-align: left;
    padding: 0.75rem;
    color: var(--text-secondary);
    font-weight: 500;
    font-size: 0.85rem;
    text-transform: uppercase;
    border-bottom: 2px solid var(--border-color);
  }

  .info-table td {
    padding: 0.75rem;
    border-bottom: 1px solid var(--border-color);
    font-size: 0.95rem;
  }

  .profile-list {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
  }

  .profile-item {
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 0.5rem;
  }

  .profile-label {
    font-size: 0.8rem;
    color: var(--text-secondary);
    text-transform: uppercase;
  }

  .profile-value {
    font-size: 1rem;
    font-weight: 600;
    margin-top: 0.25rem;
  }

  /* Business Question Explanation styling */
  .q-explanation {
    background-color: rgba(56, 189, 248, 0.05);
    border: 1px dashed rgba(56, 189, 248, 0.2);
    border-radius: 8px;
    padding: 1rem;
    margin-top: 1rem;
    font-size: 0.875rem;
    color: var(--text-secondary);
  }

  .q-explanation strong {
    color: var(--accent-blue);
  }

  .badge-price {
    background-color: rgba(74, 222, 128, 0.15);
    color: var(--accent-green);
    border: 1px solid rgba(74, 222, 128, 0.3);
  }

  .badge-promo {
    background-color: rgba(251, 146, 60, 0.15);
    color: var(--accent-orange);
    border: 1px solid rgba(251, 146, 60, 0.3);
  }

  .badge-virtual {
    background-color: rgba(56, 189, 248, 0.15);
    color: var(--accent-blue);
    border: 1px solid rgba(56, 189, 248, 0.3);
  }

  .badge-variant {
    background-color: rgba(192, 132, 252, 0.15);
    color: var(--accent-purple);
    border: 1px solid rgba(192, 132, 252, 0.3);
  }

  .badge {
    display: inline-block;
    padding: 0.25rem 0.6rem;
    font-size: 0.75rem;
    font-weight: 700;
    border-radius: 9999px;
  }

  .btn-back {
    background: transparent;
    color: var(--text-secondary);
    border: 1px solid var(--border-color);
    padding: 0.5rem 1rem;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 600;
  }

  .btn-back:hover {
    color: var(--text-primary);
    border-color: var(--text-secondary);
  }
</style>

<div class="pim-detail-container">
  <div class="detail-header">
    <div class="product-title">
      <h1>${product.productName!}</h1>
      <p>Product ID: ${product.productId}</p>
    </div>
    <a href="<@ofbizUrl>main</@ofbizUrl>" class="btn-back">&larr; Back to Dashboard</a>
  </div>

  <div class="detail-grid">
    <!-- Main Left Column -->
    <div class="column-left">
      
      <!-- 1. Product Profile -->
      <div class="detail-card">
        <div class="card-title">
          <span>Product Profile</span>
          <span class="q-badge">Modeling 1 &amp; 2</span>
        </div>
        <div class="profile-list">
          <div class="profile-item">
            <div class="profile-label">Product ID</div>
            <div class="profile-value">${product.productId}</div>
          </div>
          <div class="profile-item">
            <div class="profile-label">Product Name</div>
            <div class="profile-value">${product.productName!}</div>
          </div>
          <div class="profile-item">
            <div class="profile-label">Product Type</div>
            <div class="profile-value"><span class="badge badge-virtual">${product.productTypeEnumId!}</span></div>
          </div>
          <div class="profile-item">
            <div class="profile-label">Virtual / Variant Status</div>
            <div class="profile-value">
              <#if product.isVirtual == 'Y'><span class="badge badge-virtual">Virtual</span></#if>
              <#if product.isVariant == 'Y'><span class="badge badge-variant">Variant</span></#if>
              <#if product.isVirtual != 'Y' && product.isVariant != 'Y'><span class="badge badge-price">Standard</span></#if>
            </div>
          </div>
          <div class="profile-item">
            <div class="profile-label">Created Date</div>
            <div class="profile-value">${product.fromDate!}</div>
          </div>
        </div>
        <div class="q-explanation">
          <strong>Product Definition &amp; Types Pattern:</strong> Models base attributes and flag markers (`isVirtual`, `isVariant`) indicating if this represents a generic base catalog product or a concrete physical variation.
        </div>
      </div>

      <!-- 2. Product Prices -->
      <div class="detail-card">
        <div class="card-title">
          <span>Product Prices</span>
          <span class="q-badge">Modeling 6</span>
        </div>
        <table class="info-table">
          <thead>
            <tr>
              <th>Price ID</th>
              <th>Price Type</th>
              <th>Price</th>
            </tr>
          </thead>
          <tbody>
            <#if productPrices?has_content>
              <#list productPrices as prc>
                <tr>
                  <td>${prc.productPriceId}</td>
                  <td>
                    <#if prc.priceTypeEnumId == 'PROMOTIONAL_PRICE'>
                      <span class="badge badge-promo">Promotional Price</span>
                    <#else>
                      <span class="badge badge-price">${prc.priceTypeEnumId!}</span>
                    </#if>
                  </td>
                  <td><strong>$${prc.price?string(",##0.00")}</strong></td>
                </tr>
              </#list>
            <#else>
              <tr>
                <td colspan="3" style="text-align: center; color: var(--text-secondary);">No prices assigned.</td>
              </tr>
            </#if>
          </tbody>
        </table>
        <div class="q-explanation">
          <strong>Product Pricing Pattern:</strong> Mapped to the product via `PimProductPrice`, separating list prices, promotional rates, or vendor-specific rates by `priceTypeEnumId`.
        </div>
      </div>

      <!-- 3. Product Taxonomy (Categories) -->
      <div class="detail-card">
        <div class="card-title">
          <span>Product Category Taxonomy</span>
          <span class="q-badge">Modeling 3, 6, &amp; 8</span>
        </div>
        <table class="info-table">
          <thead>
            <tr>
              <th>Category ID</th>
              <th>Category Name</th>
              <th>Category Type</th>
              <th>From Date</th>
              <th>Sequence</th>
            </tr>
          </thead>
          <tbody>
            <#if categoryMembers?has_content>
              <#list categoryMembers as mem>
                <#assign cat = delegator.findOne("PimProductCategory", {"productCategoryId" : mem.productCategoryId}, true)!/>
                <tr>
                  <td><strong>${mem.productCategoryId}</strong></td>
                  <td>${(cat.categoryName)!}</td>
                  <td><span class="badge badge-virtual">${(cat.productCategoryTypeId)!'N/A'}</span></td>
                  <td>${mem.fromDate!}</td>
                  <td>${mem.sequenceNum!1}</td>
                </tr>
              </#list>
            <#else>
              <tr>
                <td colspan="5" style="text-align: center; color: var(--text-secondary);">No categories assigned.</td>
              </tr>
            </#if>
          </tbody>
        </table>
        <div class="q-explanation">
          <strong>Taxonomy &amp; Association Entities Pattern:</strong> Categorization utilizes the <em>Association Entities Pattern</em> (`PimProductCategoryMember`) linking a product to a category with parameters (`fromDate`, `sequenceNum`). Hierarchies are maintained via `PimProductCategoryRollup` (e.g. subcategories rolled up into catalogs).
        </div>
      </div>

      <!-- 4. Product Features -->
      <div class="detail-card">
        <div class="card-title">
          <span>Product Features</span>
          <span class="q-badge">Modeling 4 &amp; 5</span>
        </div>
        <table class="info-table">
          <thead>
            <tr>
              <th>Feature ID</th>
              <th>Feature Description</th>
              <th>Feature Type</th>
              <th>Application Type</th>
            </tr>
          </thead>
          <tbody>
            <#if featureAppls?has_content>
              <#list featureAppls as ftr>
                <#assign fObj = delegator.findOne("PimProductFeature", {"productFeatureId" : ftr.productFeatureId}, true)!/>
                <tr>
                  <td><strong>${ftr.productFeatureId}</strong></td>
                  <td>${(fObj.description)!}</td>
                  <td><span class="badge badge-variant">${(fObj.productFeatureTypeId)!'N/A'}</span></td>
                  <td><span class="badge badge-standard">${ftr.productFeatureApplTypeId!}</span></td>
                </tr>
              </#list>
            <#else>
              <tr>
                <td colspan="4" style="text-align: center; color: var(--text-secondary);">No features applied.</td>
              </tr>
            </#if>
          </tbody>
        </table>
        <div class="q-explanation">
          <strong>Product Feature &amp; Non-Mutually Exclusive Subtypes Pattern:</strong> Models attributes like color, size, and memory applied to a product via `PimProductFeatureAppl`, allowing a product to inherit multiple distinct classifications simultaneously.
        </div>
      </div>

      <!-- 5. Product Associations -->
      <div class="detail-card">
        <div class="card-title">
          <span>Product Associations</span>
          <span class="q-badge">Modeling 7</span>
        </div>
        <table class="info-table">
          <thead>
            <tr>
              <th>Related Product ID</th>
              <th>Related Name</th>
              <th>Association Type</th>
              <th>From Date</th>
            </tr>
          </thead>
          <tbody>
            <#if productAssocs?has_content || productAssocsTo?has_content>
              <#list productAssocs as asc>
                <#assign toProd = delegator.findOne("PimProduct", {"productId" : asc.toProductId}, true)!/>
                <tr>
                  <td>
                    <a href="<@ofbizUrl>PimProductDetail?productId=${asc.toProductId}</@ofbizUrl>" class="table-link">
                      ${asc.toProductId}
                    </a>
                  </td>
                  <td>${(toProd.productName)!}</td>
                  <td><span class="badge badge-variant">${asc.productAssocTypeEnumId!} (Target)</span></td>
                  <td>${asc.fromDate!}</td>
                </tr>
              </#list>
              <#list productAssocsTo as asc>
                <#assign fromProd = delegator.findOne("PimProduct", {"productId" : asc.productId}, true)!/>
                <tr>
                  <td>
                    <a href="<@ofbizUrl>PimProductDetail?productId=${asc.productId}</@ofbizUrl>" class="table-link">
                      ${asc.productId}
                    </a>
                  </td>
                  <td>${(fromProd.productName)!}</td>
                  <td><span class="badge badge-virtual">${asc.productAssocTypeEnumId!} (Source)</span></td>
                  <td>${asc.fromDate!}</td>
                </tr>
              </#list>
            <#else>
              <tr>
                <td colspan="4" style="text-align: center; color: var(--text-secondary);">No associations.</td>
              </tr>
            </#if>
          </tbody>
        </table>
        <div class="q-explanation">
          <strong>Product to Product Associations Pattern:</strong> Defines relationships like virtual products to variant specifications (`VARIANT`) or packages and bundling components (`COMPONENT`).
        </div>
      </div>

    </div>

    <!-- Side Right Column (Media, Dimensions, Forms) -->
    <div class="column-right">
      
      <!-- 6. Media / Product Content -->
      <div class="detail-card">
        <div class="card-title">
          <span>Product Media Content</span>
        </div>
        <table class="info-table">
          <thead>
            <tr>
              <th>Type</th>
              <th>Location</th>
            </tr>
          </thead>
          <tbody>
            <#if productContents?has_content>
              <#list productContents as cnt>
                <tr>
                  <td><span class="badge badge-standard">${cnt.productContentTypeEnumId!}</span></td>
                  <td><code>${cnt.contentLocation!}</code></td>
                </tr>
              </#list>
            <#else>
              <tr>
                <td colspan="2" style="text-align: center; color: var(--text-secondary);">No content items.</td>
              </tr>
            </#if>
          </tbody>
        </table>
      </div>

      <!-- 7. Product Dimensions -->
      <div class="detail-card">
        <div class="card-title">
          <span>Dimensions &amp; Weight</span>
        </div>
        <table class="info-table">
          <thead>
            <tr>
              <th>Dimension Type</th>
              <th>Value</th>
            </tr>
          </thead>
          <tbody>
            <#if productDimensions?has_content>
              <#list productDimensions as dim>
                <tr>
                  <td><strong>${dim.dimensionTypeEnumId!}</strong></td>
                  <td>${dim.dimensionValue!} ${dim.valueUomId!}</td>
                </tr>
              </#list>
            <#else>
              <tr>
                <td colspan="2" style="text-align: center; color: var(--text-secondary);">No dimensions.</td>
              </tr>
            </#if>
          </tbody>
        </table>
      </div>

    </div>
  </div>
</div>
