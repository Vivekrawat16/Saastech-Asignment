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
  }

  .pim-dashboard {
    background: linear-gradient(135deg, var(--bg-gradient-start), var(--bg-gradient-end));
    color: var(--text-primary);
    font-family: 'Inter', system-ui, sans-serif;
    padding: 2.5rem;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
    margin-bottom: 2rem;
  }

  .pim-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid var(--border-color);
    padding-bottom: 1.5rem;
    margin-bottom: 2.5rem;
  }

  .pim-title h1 {
    font-size: 2.25rem;
    font-weight: 800;
    background: linear-gradient(to right, var(--accent-blue), var(--accent-purple));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin: 0;
  }

  .pim-title p {
    color: var(--text-secondary);
    margin-top: 0.5rem;
    font-size: 0.95rem;
  }

  .pim-btn {
    background: linear-gradient(to right, var(--accent-blue), var(--accent-purple));
    color: white;
    font-weight: 600;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    text-decoration: none;
    transition: transform 0.2s, box-shadow 0.2s;
    box-shadow: 0 4px 12px rgba(56, 189, 248, 0.2);
  }

  .pim-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(192, 132, 252, 0.4);
    color: white;
  }

  .stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
    margin-bottom: 3rem;
  }

  .stat-card {
    background: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 12px;
    padding: 1.5rem;
    position: relative;
    overflow: hidden;
    backdrop-filter: blur(10px);
    transition: transform 0.3s, border-color 0.3s;
  }

  .stat-card:hover {
    transform: translateY(-4px);
    border-color: rgba(56, 189, 248, 0.3);
  }

  .stat-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
  }

  .stat-blue::before { background-color: var(--accent-blue); }
  .stat-purple::before { background-color: var(--accent-purple); }
  .stat-green::before { background-color: var(--accent-green); }
  .stat-orange::before { background-color: var(--accent-orange); }
  .stat-pink::before { background-color: var(--accent-pink); }

  .stat-label {
    font-size: 0.875rem;
    color: var(--text-secondary);
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  .stat-value {
    font-size: 2.25rem;
    font-weight: 700;
    margin-top: 0.5rem;
    color: var(--text-primary);
  }

  .dashboard-section {
    background: var(--card-bg);
    border: 1px solid var(--border-color);
    border-radius: 12px;
    padding: 2rem;
    backdrop-filter: blur(10px);
  }

  .section-title {
    font-size: 1.25rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: var(--text-primary);
    border-left: 3px solid var(--accent-blue);
    padding-left: 0.75rem;
  }

  .pim-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
  }

  .pim-table th {
    text-align: left;
    padding: 1rem;
    border-bottom: 2px solid var(--border-color);
    color: var(--text-secondary);
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  .pim-table td {
    padding: 1rem;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-primary);
    font-size: 0.95rem;
  }

  .pim-table tr:hover td {
    background-color: rgba(255, 255, 255, 0.02);
  }

  .badge {
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

  .table-link {
    color: var(--accent-blue);
    text-decoration: none;
    font-weight: 600;
  }

  .table-link:hover {
    text-decoration: underline;
  }
</style>

<div class="pim-dashboard">
  <div class="pim-header">
    <div class="pim-title">
      <h1>Product Information Manager</h1>
      <p>Manage product catalog, categorization, pricing, associations, and features.</p>
    </div>
    <a href="<@ofbizUrl>FindPimProduct</@ofbizUrl>" class="pim-btn">Manage Products</a>
  </div>

  <div class="stats-grid">
    <div class="stat-card stat-blue">
      <div class="stat-label">Total Products</div>
      <div class="stat-value">${totalProducts!0}</div>
    </div>
    <div class="stat-card stat-purple">
      <div class="stat-label">Virtual Products</div>
      <div class="stat-value">${virtualProducts!0}</div>
    </div>
    <div class="stat-card stat-green">
      <div class="stat-label">Variant Products</div>
      <div class="stat-value">${variantProducts!0}</div>
    </div>
    <div class="stat-card stat-orange">
      <div class="stat-label">Categories</div>
      <div class="stat-value">${totalCategories!0}</div>
    </div>
    <div class="stat-card stat-pink">
      <div class="stat-label">Product Features</div>
      <div class="stat-value">${totalFeatures!0}</div>
    </div>
  </div>

  <div class="dashboard-section">
    <div class="section-title">Recently Added Products</div>
    <table class="pim-table">
      <thead>
        <tr>
          <th>Product ID</th>
          <th>Product Name</th>
          <th>Type</th>
          <th>Is Virtual</th>
          <th>Is Variant</th>
          <th>Created Date</th>
        </tr>
      </thead>
      <tbody>
        <#if latestProducts?has_content>
          <#list latestProducts as prod>
            <tr>
              <td>
                <a href="<@ofbizUrl>PimProductDetail?productId=${prod.productId}</@ofbizUrl>" class="table-link">
                  ${prod.productId}
                </a>
              </td>
              <td><strong>${prod.productName!}</strong></td>
              <td><span class="badge badge-standard">${prod.productTypeEnumId!}</span></td>
              <td>
                <#if prod.isVirtual == 'Y'>
                  <span class="badge badge-virtual">Virtual</span>
                <#else>
                  <span class="badge badge-standard">No</span>
                </#if>
              </td>
              <td>
                <#if prod.isVariant == 'Y'>
                  <span class="badge badge-variant">Variant</span>
                <#else>
                  <span class="badge badge-standard">No</span>
                </#if>
              </td>
              <td>${prod.fromDate!}</td>
            </tr>
          </#list>
        <#else>
          <tr>
            <td colspan="6" style="text-align: center; color: var(--text-secondary);">No products found in system.</td>
          </tr>
        </#if>
      </tbody>
    </table>
  </div>
</div>
