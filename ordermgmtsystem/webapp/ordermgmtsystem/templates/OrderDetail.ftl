<style>
    .oms-details {
        font-family: 'Outfit', 'Inter', sans-serif;
        background: #f8fafc;
        padding: 20px;
        border-radius: 12px;
    }
    .oms-header-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: white;
        padding: 20px 24px;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
        margin-bottom: 24px;
    }
    .oms-order-title {
        font-size: 24px;
        font-weight: 700;
        color: #0f172a;
    }
    .oms-qna-panel {
        background: linear-gradient(135deg, #e0e7ff 0%, #e0f2fe 100%);
        border: 1px solid #c7d2fe;
        border-radius: 12px;
        padding: 24px;
        margin-bottom: 24px;
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
    }
    .qna-title {
        font-size: 18px;
        font-weight: 700;
        color: #1e1b4b;
        margin-bottom: 16px;
        border-bottom: 2px solid #c7d2fe;
        padding-bottom: 8px;
    }
    .qna-item {
        margin-bottom: 16px;
    }
    .qna-item:last-child {
        margin-bottom: 0;
    }
    .qna-question {
        font-weight: 600;
        color: #312e81;
        font-size: 14px;
        margin-bottom: 4px;
        text-transform: uppercase;
        letter-spacing: 0.025em;
    }
    .qna-answer {
        font-size: 16px;
        color: #1e293b;
        background: rgba(255, 255, 255, 0.6);
        padding: 10px 16px;
        border-radius: 8px;
        border-left: 4px solid #6366f1;
        display: inline-block;
        min-width: 300px;
    }
    
    .oms-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 24px;
        margin-bottom: 24px;
    }
    @media(min-width: 1024px) {
        .oms-grid {
            grid-template-columns: 1fr 1fr;
        }
    }
    .oms-section-box {
        background: white;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
        padding: 20px;
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
    }
    .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #0f172a;
        margin-bottom: 12px;
        border-bottom: 1px solid #e2e8f0;
        padding-bottom: 8px;
    }
    .oms-mini-table {
        width: 100%;
        border-collapse: collapse;
    }
    .oms-mini-table th {
        text-align: left;
        padding: 8px 12px;
        font-size: 12px;
        font-weight: 600;
        color: #475569;
        border-bottom: 2px solid #f1f5f9;
        background: #f8fafc;
    }
    .oms-mini-table td {
        padding: 10px 12px;
        font-size: 13px;
        border-bottom: 1px solid #f1f5f9;
        color: #334155;
    }
    .oms-badge {
        display: inline-flex;
        align-items: center;
        padding: 2px 8px;
        border-radius: 9999px;
        font-size: 11px;
        font-weight: 600;
        text-transform: uppercase;
    }
    .badge-sales { background: #d1fae5; color: #065f46; }
    .badge-purchase { background: #fef3c7; color: #92400e; }
    .badge-status { background: #e2e8f0; color: #334155; }
    .badge-active { background: #dbeafe; color: #1e40af; }
    
    .grid-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }
</style>

<div class="oms-details">
    <#if orderHeader?has_content>
        <!-- Header Bar -->
        <div class="oms-header-bar">
            <div>
                <div class="oms-order-title">Order #${orderHeader.orderId}</div>
                <div style="font-size: 13px; color: #64748b; margin-top: 4px;">
                    Date: ${orderHeader.orderDate!} | Type: 
                    <#if orderHeader.orderTypeId == "SALES_ORDER">
                        <span class="oms-badge badge-sales">Sales Order</span>
                    <#else>
                        <span class="oms-badge badge-purchase">Purchase Order</span>
                    </#if>
                </div>
            </div>
            <div>
                <span class="oms-badge badge-status" style="font-size: 14px; padding: 6px 16px;">Status: ${orderHeader.statusId!}</span>
            </div>
        </div>

        <!-- Business Q&A Panel -->
        <div class="oms-qna-panel">
            <div class="qna-title">Critical Business Insights</div>
            
            <div class="qna-item">
                <div class="qna-question">1. When is the expected delivery time?</div>
                <div class="qna-answer">${expectedDelivery} (Estimated 5 days post order date)</div>
            </div>
            
            <div class="qna-item">
                <div class="qna-question">2. Who is responsible for paying for the order?</div>
                <div class="qna-answer">${payer}</div>
            </div>
            
            <div class="qna-item">
                <div class="qna-question">3. What is the price for each product that is ordered?</div>
                <div style="margin-top: 4px;">
                    <table class="oms-mini-table" style="background: white; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#if orderItems?has_content>
                                <#list orderItems as item>
                                    <#if !item.parentOrderItemSeqId?has_content>
                                        <tr>
                                            <td style="font-weight: 600; color: #1e293b;">${item.productId}</td>
                                            <td>$${item.unitPrice?string(",##0.00")}</td>
                                            <td>${item.quantity}</td>
                                            <td style="font-weight: 600;">$${(item.unitPrice * item.quantity)?string(",##0.00")}</td>
                                        </tr>
                                    </#if>
                                </#list>
                            <#else>
                                <tr>
                                    <td colspan="4" style="text-align: center; color: #64748b;">No items found.</td>
                                </tr>
                            </#if>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="qna-item">
                <div class="qna-question">4. What people and organizations are involved in the order?</div>
                <div class="qna-answer">
                    <#if involvedParties?has_content>
                        <#list involvedParties as party>
                            <div>&bull; <strong>${party.name}</strong> as <em>${party.role}</em></div>
                        </#list>
                    <#else>
                        No specific parties mapped.
                    </#if>
                </div>
            </div>
            
            <div class="qna-item">
                <div class="qna-question">5. Who placed the order? To whom is the order being shipped?</div>
                <div class="qna-answer">
                    <div><strong>Placed By:</strong> ${placingCustomer}</div>
                    <div style="margin-top: 4px;"><strong>Shipped To:</strong> ${shippingDestination}</div>
                </div>
            </div>
        </div>

        <!-- Entity Component Details -->
        <div class="oms-grid">
            <!-- Parts List -->
            <div class="oms-section-box">
                <div class="section-title">Order Parts</div>
                <table class="oms-mini-table">
                    <thead>
                        <tr>
                            <th>Part Seq</th>
                            <th>Customer/Vendor</th>
                            <th>Postal / Phone</th>
                            <th>Status</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#if orderParts?has_content>
                            <#list orderParts as part>
                                <tr>
                                    <td>${part.orderPartSeqId}</td>
                                    <td>${part.customerPartyId!part.vendorPartyId!}</td>
                                    <td>${part.postalContactMechId!} <#if part.telecomContactMechId?has_content>/ ${part.telecomContactMechId}</#if></td>
                                    <td><span class="oms-badge badge-active">${part.statusId!}</span></td>
                                    <td>$${part.partTotal!0.00}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="5" style="text-align: center; color: #64748b;">No parts defined.</td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>

            <!-- Items List (Detailed) -->
            <div class="oms-section-box">
                <div class="section-title">All Items &amp; Associations</div>
                <table class="oms-mini-table">
                    <thead>
                        <tr>
                            <th>Part</th>
                            <th>Item Seq</th>
                            <th>Product ID</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Parent Item</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#if orderItems?has_content>
                            <#list orderItems as item>
                                <tr>
                                    <td>${item.orderPartSeqId}</td>
                                    <td>${item.orderItemSeqId}</td>
                                    <td><strong>${item.productId}</strong></td>
                                    <td>${item.quantity}</td>
                                    <td>$${item.unitPrice?string(",##0.00")}</td>
                                    <td>${item.parentOrderItemSeqId!"None"}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="6" style="text-align: center; color: #64748b;">No items defined.</td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>

            <!-- Contact Mechanisms List -->
            <div class="oms-section-box">
                <div class="section-title">Contact Mechanisms</div>
                <table class="oms-mini-table">
                    <thead>
                        <tr>
                            <th>Part</th>
                            <th>Purpose</th>
                            <th>Contact Mech ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#if orderContactMechs?has_content>
                            <#list orderContactMechs as cm>
                                <tr>
                                    <td>${cm.orderPartSeqId}</td>
                                    <td>${cm.contactMechPurposeTypeId}</td>
                                    <td>${cm.contactMechId}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="3" style="text-align: center; color: #64748b;">No contact mechanisms.</td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>

            <!-- Adjustments List -->
            <div class="oms-section-box">
                <div class="section-title">Order Adjustments</div>
                <table class="oms-mini-table">
                    <thead>
                        <tr>
                            <th>Part</th>
                            <th>Item</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#if orderAdjustments?has_content>
                            <#list orderAdjustments as adj>
                                <tr>
                                    <td>${adj.orderPartSeqId}</td>
                                    <td>${adj.orderItemSeqId!"Entire Part"}</td>
                                    <td><span class="oms-badge badge-sales">${adj.orderAdjustmentTypeId}</span></td>
                                    <td>$${adj.amount?string(",##0.00")}</td>
                                    <td>${adj.description!}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="5" style="text-align: center; color: #64748b;">No adjustments.</td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>

            <!-- Payments List -->
            <div class="oms-section-box">
                <div class="section-title">Order Payments</div>
                <table class="oms-mini-table">
                    <thead>
                        <tr>
                            <th>Part</th>
                            <th>Method</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#if orderPayments?has_content>
                            <#list orderPayments as pay>
                                <tr>
                                    <td>${pay.orderPartSeqId}</td>
                                    <td>${pay.paymentMethodTypeId}</td>
                                    <td>$${pay.amount?string(",##0.00")}</td>
                                    <td><span class="oms-badge badge-active">${pay.statusId}</span></td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="4" style="text-align: center; color: #64748b;">No payments.</td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>

            <!-- Status Logs List -->
            <div class="oms-section-box">
                <div class="section-title">Status History</div>
                <table class="oms-mini-table">
                    <thead>
                        <tr>
                            <th>Part</th>
                            <th>Status</th>
                            <th>DateTime</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#if orderStatuses?has_content>
                            <#list orderStatuses as stat>
                                <tr>
                                    <td>${stat.orderPartSeqId!"Entire Order"}</td>
                                    <td><span class="oms-badge badge-status">${stat.statusId}</span></td>
                                    <td>${stat.statusDatetime!}</td>
                                </tr>
                            </#list>
                        <#else>
                            <tr>
                                <td colspan="3" style="text-align: center; color: #64748b;">No status logs.</td>
                            </tr>
                        </#if>
                    </tbody>
                </table>
            </div>
        </div>
    <#else>
        <div style="text-align: center; padding: 48px 0; color: #64748b;">
            <h2>Order Not Found</h2>
            <p>The requested order ID does not exist or has been deleted.</p>
            <a href="<@ofbizUrl>FindOmsOrder</@ofbizUrl>" class="oms-btn">Back to Find Orders</a>
        </div>
    </#if>
</div>
