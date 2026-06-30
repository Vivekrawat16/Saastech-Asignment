<style>
    .oms-dashboard {
        font-family: 'Outfit', 'Inter', sans-serif;
        padding: 20px;
        background: #f8fafc;
        border-radius: 12px;
    }
    .oms-title {
        font-size: 28px;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 24px;
        border-left: 5px solid #6366f1;
        padding-left: 12px;
    }
    .oms-cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 20px;
        margin-bottom: 32px;
    }
    .oms-card {
        background: white;
        padding: 24px;
        border-radius: 12px;
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05), 0 2px 4px -2px rgb(0 0 0 / 0.05);
        border: 1px solid #e2e8f0;
        transition: transform 0.2s, box-shadow 0.2s;
    }
    .oms-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
    }
    .oms-card-title {
        font-size: 14px;
        font-weight: 600;
        color: #64748b;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        margin-bottom: 8px;
    }
    .oms-card-value {
        font-size: 36px;
        font-weight: 700;
        color: #1e1b4b;
    }
    .oms-card.total { border-top: 4px solid #6366f1; }
    .oms-card.sales { border-top: 4px solid #10b981; }
    .oms-card.purchase { border-top: 4px solid #f59e0b; }
    
    .oms-section {
        background: white;
        border-radius: 12px;
        padding: 24px;
        border: 1px solid #e2e8f0;
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
    }
    .oms-section-title {
        font-size: 20px;
        font-weight: 600;
        color: #0f172a;
        margin-bottom: 16px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .oms-table {
        width: 100%;
        border-collapse: collapse;
    }
    .oms-table th {
        text-align: left;
        padding: 12px 16px;
        font-weight: 600;
        color: #475569;
        border-bottom: 2px solid #edf2f7;
        background: #f8fafc;
    }
    .oms-table td {
        padding: 16px;
        border-bottom: 1px solid #e2e8f0;
        color: #334155;
    }
    .oms-badge {
        display: inline-flex;
        align-items: center;
        padding: 4px 12px;
        border-radius: 9999px;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
    }
    .badge-sales { background: #d1fae5; color: #065f46; }
    .badge-purchase { background: #fef3c7; color: #92400e; }
    .badge-status { background: #e2e8f0; color: #334155; }
    .oms-btn {
        background: #6366f1;
        color: white !important;
        padding: 8px 16px;
        border-radius: 6px;
        font-weight: 500;
        text-decoration: none !important;
        transition: background 0.2s;
    }
    .oms-btn:hover {
        background: #4f46e5;
    }
    .oms-link {
        color: #6366f1;
        font-weight: 600;
        text-decoration: none;
    }
    .oms-link:hover {
        text-decoration: underline;
    }
</style>

<div class="oms-dashboard">
    <div class="oms-title">Order Management Dashboard</div>
    
    <div class="oms-cards">
        <div class="oms-card total">
            <div class="oms-card-title">Total Orders</div>
            <div class="oms-card-value">${totalOrders!0}</div>
        </div>
        <div class="oms-card sales">
            <div class="oms-card-title">Sales Orders</div>
            <div class="oms-card-value">${salesOrders!0}</div>
        </div>
        <div class="oms-card purchase">
            <div class="oms-card-title">Purchase Orders</div>
            <div class="oms-card-value">${purchaseOrders!0}</div>
        </div>
    </div>
    
    <div class="oms-section">
        <div class="oms-section-title">
            <span>Latest Orders</span>
            <a href="<@ofbizUrl>FindOmsOrder</@ofbizUrl>" class="oms-btn">View All Orders</a>
        </div>
        
        <table class="oms-table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <#if latestOrders?has_content>
                    <#list latestOrders as order>
                        <tr>
                            <td>
                                <a href="<@ofbizUrl>OmsOrderDetail?orderId=${order.orderId}</@ofbizUrl>" class="oms-link">${order.orderId}</a>
                            </td>
                            <td>
                                <#if order.orderTypeId == "SALES_ORDER">
                                    <span class="oms-badge badge-sales">Sales Order</span>
                                <#else>
                                    <span class="oms-badge badge-purchase">Purchase Order</span>
                                </#if>
                            </td>
                            <td>${order.orderDate!}</td>
                            <td>
                                <span class="oms-badge badge-status">${order.statusId!}</span>
                            </td>
                            <td>
                                <a href="<@ofbizUrl>OmsOrderDetail?orderId=${order.orderId}</@ofbizUrl>" class="oms-link">View Details</a>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <tr>
                        <td colspan="5" style="text-align: center; color: #64748b;">No orders found. Click "Find/Create Orders" to add some!</td>
                    </tr>
                </#if>
            </tbody>
        </table>
    </div>
</div>
