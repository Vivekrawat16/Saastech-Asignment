<style>
  :root {
    --bg-gradient-start: #0f172a;
    --bg-gradient-end: #1e293b;
    --card-bg: rgba(30, 41, 59, 0.7);
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

  .pm-container {
    background: linear-gradient(135deg, var(--bg-gradient-start), var(--bg-gradient-end));
    color: var(--text-primary);
    font-family: 'Inter', system-ui, sans-serif;
    padding: 2.5rem;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    margin-bottom: 2rem;
  }

  .pm-header {
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 1.5rem;
    margin-bottom: 2.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .pm-title h1 {
    font-size: 2.25rem;
    font-weight: 800;
    background: linear-gradient(to right, var(--accent-blue), var(--accent-purple));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin: 0;
  }

  .pm-title p {
    color: var(--text-secondary);
    margin-top: 0.5rem;
    font-size: 0.95rem;
  }

  /* Flex grid layout for side-by-side components */
  .pm-grid {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 2rem;
    margin-bottom: 2.5rem;
  }

  @media (max-width: 1024px) {
    .pm-grid {
      grid-template-columns: 1fr;
    }
  }

  .pm-card {
    background: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 12px;
    padding: 1.75rem;
    margin-bottom: 1.5rem;
    backdrop-filter: blur(10px);
  }

  .pm-card-title {
    font-size: 1.2rem;
    font-weight: 700;
    margin-bottom: 1.25rem;
    color: var(--text-primary);
    border-left: 3px solid var(--accent-blue);
    padding-left: 0.75rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  /* Form layouts */
  .pm-form-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.25rem;
    margin-bottom: 1.25rem;
  }

  .pm-form-group {
    display: flex;
    flex-direction: column;
  }

  .pm-label {
    font-size: 0.8rem;
    color: var(--text-secondary);
    text-transform: uppercase;
    margin-bottom: 0.5rem;
    font-weight: 600;
  }

  .pm-input, .pm-select {
    background: rgba(15, 23, 42, 0.6);
    border: 1px solid var(--border-color);
    color: var(--text-primary);
    padding: 0.75rem 1rem;
    border-radius: 8px;
    font-size: 0.95rem;
    outline: none;
    transition: border-color 0.2s;
  }

  .pm-input:focus, .pm-select:focus {
    border-color: var(--accent-blue);
  }

  .pm-btn {
    background: linear-gradient(to right, var(--accent-blue), var(--accent-purple));
    color: white;
    font-weight: 600;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    text-align: center;
    text-decoration: none;
  }

  .pm-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(192, 132, 252, 0.4);
    color: white;
  }

  .pm-btn-secondary {
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid var(--border-color);
    color: var(--text-primary);
  }

  .pm-btn-secondary:hover {
    background: rgba(255, 255, 255, 0.1);
    box-shadow: none;
    transform: none;
  }

  /* Table styling */
  .pm-table-container {
    overflow-x: auto;
  }

  .pm-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
  }

  .pm-table th {
    text-align: left;
    padding: 1rem;
    border-bottom: 2px solid var(--border-color);
    color: var(--text-secondary);
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  .pm-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-primary);
    font-size: 0.95rem;
  }

  .pm-table tr:hover td {
    background-color: rgba(255, 255, 255, 0.02);
  }

  .pm-badge {
    display: inline-block;
    padding: 0.25rem 0.6rem;
    font-size: 0.75rem;
    font-weight: 700;
    border-radius: 9999px;
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

  .badge-standard {
    background-color: rgba(74, 222, 128, 0.15);
    color: var(--accent-green);
    border: 1px solid rgba(74, 222, 128, 0.3);
  }

  /* Pagination styles */
  .pagination-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 1.5rem;
    padding-top: 1rem;
    border-top: 1px solid var(--border-color);
  }

  .pagination-info {
    font-size: 0.875rem;
    color: var(--text-secondary);
  }

  .pagination-buttons {
    display: flex;
    gap: 0.5rem;
  }

  .tab-btn {
    background: transparent;
    color: var(--text-secondary);
    border: 1px solid var(--border-color);
    padding: 0.5rem 1rem;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
  }

  .tab-btn.active {
    background: var(--accent-blue);
    color: white;
    border-color: var(--accent-blue);
  }

  .alert-box {
    background-color: rgba(56, 189, 248, 0.05);
    border: 1px dashed rgba(56, 189, 248, 0.2);
    border-radius: 8px;
    padding: 0.75rem 1rem;
    margin-bottom: 1.5rem;
    font-size: 0.85rem;
    color: var(--text-secondary);
  }

  .alert-box strong {
    color: var(--accent-blue);
  }
</style>

<div class="pm-container">
  <div class="pm-header">
    <div class="pm-title">
      <h1>Dynamic Product Finder</h1>
      <p>Simplified product management dashboard powered by FindProductView entity and custom event triggers.</p>
    </div>
  </div>

  <div class="pm-grid">
    <!-- Left Column: Search Filters & Table Results -->
    <div class="column-left">
      <!-- 1. Search Filters Form -->
      <div class="pm-card">
        <div class="pm-card-title">Search Filter</div>
        <form action="<@ofbizUrl>FindProduct</@ofbizUrl>" method="GET">
          <div class="pm-form-row">
            <div class="pm-form-group">
              <label class="pm-label">Product ID</label>
              <input type="text" name="productId" class="pm-input" value="${parameters.productId!}" placeholder="e.g. TREADMILL"/>
            </div>
            <div class="pm-form-group">
              <label class="pm-label">Product Name</label>
              <input type="text" name="productName" class="pm-input" value="${parameters.productName!}" placeholder="e.g. Pro"/>
            </div>
            <div class="pm-form-group">
              <label class="pm-label">Min Price</label>
              <input type="text" name="minPrice" class="pm-input" value="${parameters.minPrice!}" placeholder="0.00"/>
            </div>
            <div class="pm-form-group">
              <label class="pm-label">Max Price</label>
              <input type="text" name="maxPrice" class="pm-input" value="${parameters.maxPrice!}" placeholder="1000.00"/>
            </div>
          </div>
          <div class="pm-form-row">
            <div class="pm-form-group">
              <label class="pm-label">Product Category</label>
              <select name="productCategoryId" class="pm-select">
                <option value="">-- Select Category --</option>
                <#if categories?has_content>
                  <#list categories as cat>
                    <option value="${cat.productCategoryId}" <#if (parameters.productCategoryId!) == cat.productCategoryId>selected</#if>>
                      ${cat.categoryName!cat.productCategoryId}
                    </option>
                  </#list>
                </#if>
              </select>
            </div>
            <div class="pm-form-group">
              <label class="pm-label">Product Feature</label>
              <select name="productFeatureId" class="pm-select">
                <option value="">-- Select Feature --</option>
                <#if features?has_content>
                  <#list features as ftr>
                    <option value="${ftr.productFeatureId}" <#if (parameters.productFeatureId!) == ftr.productFeatureId>selected</#if>>
                      ${ftr.description!ftr.productFeatureId}
                    </option>
                  </#list>
                </#if>
              </select>
            </div>
            <div class="pm-form-group" style="justify-content: flex-end;">
              <div style="display: flex; gap: 0.5rem;">
                <button type="submit" class="pm-btn" style="flex: 1;">Search</button>
                <a href="<@ofbizUrl>FindProduct</@ofbizUrl>" class="pm-btn pm-btn-secondary" style="flex: 1; display: inline-block;">Clear</a>
              </div>
            </div>
          </div>
        </form>
      </div>

      <!-- 2. Paginated Search Results Table -->
      <div class="pm-card">
        <div class="pm-card-title">Search Results</div>
        <div class="pm-table-container">
          <table class="pm-table" id="resultsTable">
            <thead>
              <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price (LIST)</th>
                <th>Category</th>
                <th>Applied Feature</th>
                <th>Virtual</th>
                <th>Variant</th>
              </tr>
            </thead>
            <tbody>
              <#if productList?has_content>
                <#list productList as item>
                  <tr class="table-row-item">
                    <td><strong>${item.productId}</strong></td>
                    <td>${item.productName!item.internalName!}</td>
                    <td>
                      <#if item.price??>
                        <strong>$${item.price?string(",##0.00")}</strong>
                      <#else>
                        <span style="color: var(--text-secondary);">N/A</span>
                      </#if>
                    </td>
                    <td><span class="pm-badge badge-standard">${item.productCategoryId!"None"}</span></td>
                    <td>
                      <#if item.productFeatureId??>
                        <span class="pm-badge badge-variant">${item.featureDescription!item.productFeatureId}</span>
                      <#else>
                        <span style="color: var(--text-secondary);">None</span>
                      </#if>
                    </td>
                    <td>
                      <#if item.isVirtual == 'Y'>
                        <span class="pm-badge badge-virtual">Yes</span>
                      <#else>
                        <span class="pm-badge badge-standard">No</span>
                      </#if>
                    </td>
                    <td>
                      <#if item.isVariant == 'Y'>
                        <span class="pm-badge badge-variant">Yes</span>
                      <#else>
                        <span class="pm-badge badge-standard">No</span>
                      </#if>
                    </td>
                  </tr>
                </#list>
              <#else>
                <tr>
                  <td colspan="7" style="text-align: center; color: var(--text-secondary);">No products match search criteria.</td>
                </tr>
              </#if>
            </tbody>
          </table>
        </div>

        <!-- Pagination HTML -->
        <div class="pagination-container">
          <div class="pagination-info" id="paginationInfo">Showing 0-0 of 0 products</div>
          <div class="pagination-buttons">
            <button class="tab-btn" id="prevBtn" onclick="prevPage()">&larr; Prev</button>
            <button class="tab-btn" id="nextBtn" onclick="nextPage()">Next &rarr;</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Right Column: Administrative Actions (Create, Update, Variant Assoc) -->
    <div class="column-right">
      
      <!-- 3. Create Product Form -->
      <div class="pm-card">
        <div class="pm-card-title">Create Product</div>
        <div class="alert-box">
          Ensures name is <strong>unique</strong> across the catalog before inserting.
        </div>
        <form action="<@ofbizUrl>createProductEvent</@ofbizUrl>" method="POST">
          <div class="pm-form-group" style="margin-bottom: 1rem;">
            <label class="pm-label">Product ID (Optional)</label>
            <input type="text" name="productId" class="pm-input" placeholder="Auto-generated if empty"/>
          </div>
          <div class="pm-form-group" style="margin-bottom: 1rem;">
            <label class="pm-label">Product Name *</label>
            <input type="text" name="productName" class="pm-input" required placeholder="e.g. Smartwatch V2"/>
          </div>
          <div class="pm-form-group" style="margin-bottom: 1rem;">
            <label class="pm-label">Category *</label>
            <select name="productCategoryId" class="pm-select" required>
              <option value="">-- Choose Category --</option>
              <#if categories?has_content>
                <#list categories as cat>
                  <option value="${cat.productCategoryId}">${cat.categoryName!cat.productCategoryId}</option>
                </#list>
              </#if>
            </select>
          </div>
          <div class="pm-form-row" style="margin-bottom: 1rem;">
            <div class="pm-form-group">
              <label class="pm-label">List Price *</label>
              <input type="text" name="price" class="pm-input" required placeholder="0.00"/>
            </div>
          </div>
          <div class="pm-form-row" style="margin-bottom: 1.5rem;">
            <div class="pm-form-group">
              <label class="pm-label">Is Virtual</label>
              <select name="isVirtual" class="pm-select">
                <option value="N">No</option>
                <option value="Y">Yes</option>
              </select>
            </div>
            <div class="pm-form-group">
              <label class="pm-label">Is Variant</label>
              <select name="isVariant" class="pm-select">
                <option value="N">No</option>
                <option value="Y">Yes</option>
              </select>
            </div>
          </div>
          <button type="submit" class="pm-btn" style="width: 100%;">Create Product</button>
        </form>
      </div>

      <!-- 4. Update Product Form -->
      <div class="pm-card">
        <div class="pm-card-title">Update Product</div>
        <form action="<@ofbizUrl>updateProductEvent</@ofbizUrl>" method="POST">
          <div class="pm-form-group" style="margin-bottom: 1rem;">
            <label class="pm-label">Product ID *</label>
            <input type="text" name="productId" class="pm-input" required placeholder="e.g. PROD10001"/>
          </div>
          <div class="pm-form-group" style="margin-bottom: 1rem;">
            <label class="pm-label">Update Price</label>
            <input type="text" name="price" class="pm-input" placeholder="New price value"/>
          </div>
          <div class="pm-form-group" style="margin-bottom: 1.5rem;">
            <label class="pm-label">Apply Feature</label>
            <select name="productFeatureId" class="pm-select">
              <option value="">-- Select Feature --</option>
              <#if features?has_content>
                <#list features as ftr>
                  <option value="${ftr.productFeatureId}">${ftr.description!ftr.productFeatureId}</option>
                </#list>
              </#if>
            </select>
          </div>
          <button type="submit" class="pm-btn" style="width: 100%;">Update Product</button>
        </form>
      </div>

      <!-- 5. Associate Product to Virtual -->
      <div class="pm-card">
        <div class="pm-card-title">Associate Virtual &amp; Variant</div>
        <form action="<@ofbizUrl>assocProductToVirtualEvent</@ofbizUrl>" method="POST">
          <div class="pm-form-group" style="margin-bottom: 1rem;">
            <label class="pm-label">Virtual Product ID *</label>
            <select name="virtualProductId" class="pm-select" required>
              <option value="">-- Choose Virtual --</option>
              <#if products?has_content>
                <#list products as prod>
                  <option value="${prod.productId}">${prod.productName!prod.productId}</option>
                </#list>
              </#if>
            </select>
          </div>
          <div class="pm-form-group" style="margin-bottom: 1.5rem;">
            <label class="pm-label">Variant Product ID *</label>
            <input type="text" name="productId" class="pm-input" required placeholder="e.g. PROD10001"/>
          </div>
          <button type="submit" class="pm-btn" style="width: 100%;">Establish Relationship</button>
        </form>
      </div>

    </div>
  </div>
</div>

<!-- Premium Client-side Pagination Script -->
<script>
  var currentPage = 1;
  var pageSize = 5;
  var rows = document.getElementsByClassName('table-row-item');
  var totalRows = rows.length;

  function showPage(page) {
    if (totalRows === 0) {
      document.getElementById('paginationInfo').innerText = "Showing 0-0 of 0 products";
      return;
    }
    currentPage = page;
    var start = (page - 1) * pageSize;
    var end = start + pageSize;
    if (end > totalRows) end = totalRows;

    for (var i = 0; i < totalRows; i++) {
      if (i >= start && i < end) {
        rows[i].style.display = '';
      } else {
        rows[i].style.display = 'none';
      }
    }

    document.getElementById('paginationInfo').innerText = "Showing " + (start + 1) + "-" + end + " of " + totalRows + " products";
    document.getElementById('prevBtn').disabled = (page === 1);
    document.getElementById('nextBtn').disabled = (end === totalRows);
  }

  function prevPage() {
    if (currentPage > 1) {
      showPage(currentPage - 1);
    }
  }

  function nextPage() {
    var maxPage = Math.ceil(totalRows / pageSize);
    if (currentPage < maxPage) {
      showPage(currentPage + 1);
    }
  }

  // Initialize page
  showPage(1);
</script>
