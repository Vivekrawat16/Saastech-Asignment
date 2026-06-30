<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    /* Premium Theme & Global Styles */
    :root {
        --bg-gradient-start: #0f172a;
        --bg-gradient-end: #1e293b;
        --card-bg: rgba(30, 41, 59, 0.7);
        --card-border: rgba(255, 255, 255, 0.08);
        --text-primary: #f8fafc;
        --text-secondary: #94a3b8;
        --accent-primary: #3b82f6;
        --accent-hover: #2563eb;
        --accent-success: #10b981;
        --accent-danger: #ef4444;
        --accent-warning: #f59e0b;
        --transition-smooth: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    .customer-finder-container {
        font-family: 'Outfit', sans-serif;
        background: linear-gradient(135deg, var(--bg-gradient-start), var(--bg-gradient-end));
        color: var(--text-primary);
        min-height: 100vh;
        padding: 2rem;
        box-sizing: border-box;
    }

    .glass-card {
        background: var(--card-bg);
        backdrop-filter: blur(16px);
        border: 1px solid var(--card-border);
        border-radius: 16px;
        padding: 2rem;
        box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        margin-bottom: 2rem;
    }

    .dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2.5rem;
        border-bottom: 1px solid var(--card-border);
        padding-bottom: 1.5rem;
    }

    .dashboard-header h1 {
        font-size: 2.2rem;
        font-weight: 700;
        background: linear-gradient(to right, #60a5fa, #3b82f6);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin: 0;
    }

    .header-actions {
        display: flex;
        gap: 1rem;
    }

    /* Buttons */
    .btn {
        font-family: 'Outfit', sans-serif;
        padding: 0.75rem 1.5rem;
        border-radius: 10px;
        font-weight: 500;
        font-size: 0.95rem;
        border: none;
        cursor: pointer;
        transition: var(--transition-smooth);
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-primary {
        background: var(--accent-primary);
        color: white;
    }

    .btn-primary:hover {
        background: var(--accent-hover);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4);
    }

    .btn-success {
        background: var(--accent-success);
        color: white;
    }

    .btn-success:hover {
        background: #059669;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
    }

    .btn-warning {
        background: var(--accent-warning);
        color: white;
    }

    .btn-warning:hover {
        background: #d97706;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(245, 158, 11, 0.4);
    }

    .btn-secondary {
        background: rgba(255, 255, 255, 0.1);
        color: var(--text-primary);
        border: 1px solid var(--card-border);
    }

    .btn-secondary:hover {
        background: rgba(255, 255, 255, 0.2);
    }

    /* Form Fields */
    .form-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 1.5rem;
        margin-bottom: 1.5rem;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }

    .form-group label {
        font-size: 0.85rem;
        color: var(--text-secondary);
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }

    .form-control {
        background: rgba(15, 23, 42, 0.6);
        border: 1px solid var(--card-border);
        border-radius: 8px;
        padding: 0.75rem;
        color: var(--text-primary);
        font-family: 'Outfit', sans-serif;
        font-size: 0.95rem;
        transition: var(--transition-smooth);
    }

    .form-control:focus {
        outline: none;
        border-color: var(--accent-primary);
        box-shadow: 0 0 0 2px rgba(59, 130, 246, 0.25);
        background: rgba(15, 23, 42, 0.8);
    }

    select.form-control option {
        background: #1e293b;
        color: var(--text-primary);
    }

    /* Table styles */
    .results-table-container {
        overflow-x: auto;
    }

    .results-table {
        width: 100%;
        border-collapse: collapse;
        text-align: left;
    }

    .results-table th {
        padding: 1rem;
        border-bottom: 2px solid var(--card-border);
        color: var(--text-secondary);
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.8rem;
        letter-spacing: 0.05em;
    }

    .results-table td {
        padding: 1.25rem 1rem;
        border-bottom: 1px solid var(--card-border);
        font-size: 0.95rem;
        vertical-align: middle;
    }

    .results-table tr {
        transition: var(--transition-smooth);
    }

    .results-table tr:hover {
        background: rgba(255, 255, 255, 0.03);
    }

    /* Badges */
    .badge {
        display: inline-flex;
        align-items: center;
        padding: 0.25rem 0.5rem;
        border-radius: 6px;
        font-size: 0.75rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }

    .badge-primary {
        background: rgba(59, 130, 246, 0.15);
        color: #93c5fd;
        border: 1px solid rgba(59, 130, 246, 0.3);
    }

    /* Modal / Popup */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(15, 23, 42, 0.75);
        backdrop-filter: blur(8px);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
        opacity: 0;
        pointer-events: none;
        transition: var(--transition-smooth);
    }

    .modal-overlay.active {
        opacity: 1;
        pointer-events: auto;
    }

    .modal-content {
        background: #1e293b;
        border: 1px solid var(--card-border);
        border-radius: 16px;
        width: 100%;
        max-width: 600px;
        max-height: 90vh;
        overflow-y: auto;
        padding: 2.5rem;
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.5);
        transform: scale(0.95);
        transition: var(--transition-smooth);
    }

    .modal-overlay.active .modal-content {
        transform: scale(1);
    }

    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        border-bottom: 1px solid var(--card-border);
        padding-bottom: 1rem;
    }

    .modal-header h2 {
        margin: 0;
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-primary);
    }

    .close-btn {
        background: none;
        border: none;
        color: var(--text-secondary);
        font-size: 1.5rem;
        cursor: pointer;
        transition: var(--transition-smooth);
    }

    .close-btn:hover {
        color: var(--text-primary);
    }

    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 1rem;
        margin-top: 2rem;
        border-top: 1px solid var(--card-border);
        padding-top: 1.5rem;
    }

    /* Notification Banner */
    .alert {
        padding: 1rem 1.5rem;
        border-radius: 8px;
        margin-bottom: 1.5rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 500;
    }

    .alert-success {
        background: rgba(16, 185, 129, 0.15);
        color: #34d399;
        border: 1px solid rgba(16, 185, 129, 0.3);
    }

    .alert-danger {
        background: rgba(239, 68, 68, 0.15);
        color: #f87171;
        border: 1px solid rgba(239, 68, 68, 0.3);
    }
</style>

<div class="customer-finder-container">

    <!-- Messages / Alerts -->
    <#if requestAttributes._event_message_?has_content>
        <div class="alert alert-success">
            <span>${requestAttributes._event_message_}</span>
            <button class="close-btn" onclick="this.parentElement.remove()">&times;</button>
        </div>
    </#if>
    <#if requestAttributes._error_message_?has_content>
        <div class="alert alert-danger">
            <span>${requestAttributes._error_message_}</span>
            <button class="close-btn" onclick="this.parentElement.remove()">&times;</button>
        </div>
    </#if>

    <!-- Top Dashboard Header -->
    <div class="dashboard-header">
        <div>
            <h1>Customer Finder Console</h1>
            <p style="color: var(--text-secondary); margin: 0.25rem 0 0 0;">Search, Create, Update and Establish Party Relationships</p>
        </div>
        <div class="header-actions">
            <button class="btn btn-success" onclick="openModal('createCustomerModal')">
                <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"/></svg>
                New Customer
            </button>
            <button class="btn btn-warning" onclick="openModal('updateCustomerModal')">
                <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                Update Customer
            </button>
            <button class="btn btn-primary" onclick="openModal('relationshipModal')">
                <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"/></svg>
                Relationships
            </button>
        </div>
    </div>

    <!-- Search Form Section -->
    <div class="glass-card">
        <form method="get" action="main">
            <div class="form-grid">
                <div class="form-group">
                    <label>Party ID</label>
                    <input type="text" name="partyId" class="form-control" placeholder="e.g. 10010" value="${parameters.partyId!}">
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="text" name="emailAddress" class="form-control" placeholder="e.g. john@doe.com" value="${parameters.emailAddress!}">
                </div>
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" name="firstName" class="form-control" placeholder="e.g. John" value="${parameters.firstName!}">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" name="lastName" class="form-control" placeholder="e.g. Doe" value="${parameters.lastName!}">
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="text" name="contactNumber" class="form-control" placeholder="e.g. 555-0199" value="${parameters.contactNumber!}">
                </div>
                <div class="form-group">
                    <label>Address 1</label>
                    <input type="text" name="address1" class="form-control" placeholder="e.g. 123 Main St" value="${parameters.address1!}">
                </div>
                <div class="form-group">
                    <label>City</label>
                    <input type="text" name="city" class="form-control" placeholder="e.g. Salt Lake City" value="${parameters.city!}">
                </div>
                <div class="form-group">
                    <label>State / Province</label>
                    <select name="stateProvinceGeoId" class="form-control">
                        <option value="">-- Select State --</option>
                        <#list stateList as state>
                            <option value="${state.geoId}" <#if parameters.stateProvinceGeoId! == state.geoId>selected</#if>>${state.geoName} (${state.geoId})</option>
                        </#list>
                    </select>
                </div>
                <div class="form-group">
                    <label>Postal Code</label>
                    <input type="text" name="postalCode" class="form-control" placeholder="e.g. 84101" value="${parameters.postalCode!}">
                </div>
                <div class="form-group">
                    <label>Country</label>
                    <select name="countryGeoId" class="form-control">
                        <option value="">-- Select Country --</option>
                        <#list countryList as country>
                            <option value="${country.geoId}" <#if parameters.countryGeoId! == country.geoId>selected</#if>>${country.geoName} (${country.geoId})</option>
                        </#list>
                    </select>
                </div>
            </div>
            <div style="display: flex; gap: 1rem; justify-content: flex-end;">
                <a href="main" class="btn btn-secondary">Clear Filters</a>
                <button type="submit" class="btn btn-primary">
                    <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                    Search Customers
                </button>
            </div>
        </form>
    </div>

    <!-- Search Results Section -->
    <div class="glass-card">
        <h2 style="margin-top: 0; margin-bottom: 1.5rem; font-weight: 600; font-size: 1.3rem;">Search Results</h2>
        <div class="results-table-container">
            <table class="results-table" id="customerResultsTable">
                <thead>
                    <tr>
                        <th>Party ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Primary Email</th>
                        <th>Primary Phone</th>
                        <th>Primary Address</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody>
                    <#if customerList?has_content>
                        <#list customerList as customer>
                            <tr>
                                <td>
                                    <span class="badge badge-primary">${customer.partyId}</span>
                                </td>
                                <td style="font-weight: 500;">${customer.firstName!}</td>
                                <td style="font-weight: 500;">${customer.lastName!}</td>
                                <td style="color: #60a5fa;">${customer.emailAddress!}</td>
                                <td>${customer.contactNumber!}</td>
                                <td>
                                    <div style="font-weight: 500;">${customer.address1!}</div>
                                    <#if customer.address2?has_content><div style="font-size: 0.85rem; color: var(--text-secondary);">${customer.address2}</div></#if>
                                </td>
                                <td>
                                    ${customer.city!}<#if customer.stateProvinceGeoId?has_content>, ${customer.stateProvinceGeoId}</#if>
                                    <#if customer.postalCode?has_content> - ${customer.postalCode}</#if>
                                </td>
                            </tr>
                        </#list>
                    <#else>
                        <tr>
                            <td colspan="7" style="text-align: center; color: var(--text-secondary); padding: 3rem;">
                                No customers found matching search criteria.
                            </td>
                        </tr>
                    </#if>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- CREATE CUSTOMER MODAL -->
<div class="modal-overlay" id="createCustomerModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Create New Customer</h2>
            <button class="close-btn" onclick="closeModal('createCustomerModal')">&times;</button>
        </div>
        <form method="post" action="createCustomerEvent">
            <div style="display: flex; flex-direction: column; gap: 1.25rem;">
                <div class="form-group">
                    <label>Email Address *</label>
                    <input type="email" name="emailAddress" class="form-control" required placeholder="name@domain.com">
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label>First Name *</label>
                        <input type="text" name="firstName" class="form-control" required placeholder="John">
                    </div>
                    <div class="form-group">
                        <label>Last Name *</label>
                        <input type="text" name="lastName" class="form-control" required placeholder="Doe">
                    </div>
                </div>
                <div class="form-group">
                    <label>Contact Number (Primary)</label>
                    <input type="text" name="contactNumber" class="form-control" placeholder="555-0199">
                </div>
                <div class="form-group">
                    <label>Address Line 1</label>
                    <input type="text" name="address1" class="form-control" placeholder="123 Main St">
                </div>
                <div class="form-group">
                    <label>Address Line 2</label>
                    <input type="text" name="address2" class="form-control" placeholder="Suite 400">
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" name="city" class="form-control" placeholder="Salt Lake City">
                    </div>
                    <div class="form-group">
                        <label>Postal Code</label>
                        <input type="text" name="postalCode" class="form-control" placeholder="84101">
                    </div>
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label>State / Province</label>
                        <select name="stateProvinceGeoId" class="form-control">
                            <option value="">-- Select State --</option>
                            <#list stateList as state>
                                <option value="${state.geoId}">${state.geoName} (${state.geoId})</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <select name="countryGeoId" class="form-control">
                            <option value="">-- Select Country --</option>
                            <#list countryList as country>
                                <option value="${country.geoId}">${country.geoName} (${country.geoId})</option>
                            </#list>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal('createCustomerModal')">Cancel</button>
                <button type="submit" class="btn btn-success">Save Customer</button>
            </div>
        </form>
    </div>
</div>

<!-- UPDATE CUSTOMER MODAL -->
<div class="modal-overlay" id="updateCustomerModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Update Customer Details</h2>
            <button class="close-btn" onclick="closeModal('updateCustomerModal')">&times;</button>
        </div>
        <form method="post" action="updateCustomerEvent">
            <div style="display: flex; flex-direction: column; gap: 1.25rem;">
                <div class="form-group">
                    <label>Email Address * (Serves as Unique Identifier)</label>
                    <input type="email" name="emailAddress" class="form-control" required placeholder="name@domain.com">
                </div>
                <div class="form-group">
                    <label>New Contact Number</label>
                    <input type="text" name="contactNumber" class="form-control" placeholder="555-0199">
                </div>
                <div class="form-group">
                    <label>Address Line 1</label>
                    <input type="text" name="address1" class="form-control" placeholder="123 Main St">
                </div>
                <div class="form-group">
                    <label>Address Line 2</label>
                    <input type="text" name="address2" class="form-control" placeholder="Suite 400">
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" name="city" class="form-control" placeholder="Salt Lake City">
                    </div>
                    <div class="form-group">
                        <label>Postal Code</label>
                        <input type="text" name="postalCode" class="form-control" placeholder="84101">
                    </div>
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label>State / Province</label>
                        <select name="stateProvinceGeoId" class="form-control">
                            <option value="">-- Select State --</option>
                            <#list stateList as state>
                                <option value="${state.geoId}">${state.geoName} (${state.geoId})</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <select name="countryGeoId" class="form-control">
                            <option value="">-- Select Country --</option>
                            <#list countryList as country>
                                <option value="${country.geoId}">${country.geoName} (${country.geoId})</option>
                            </#list>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal('updateCustomerModal')">Cancel</button>
                <button type="submit" class="btn btn-warning">Apply Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- RELATIONSHIPS MODAL -->
<div class="modal-overlay" id="relationshipModal">
    <div class="modal-content" style="max-width: 650px;">
        <div class="modal-header">
            <h2>Establish & Update Party Relationships</h2>
            <button class="close-btn" onclick="closeModal('relationshipModal')">&times;</button>
        </div>
        
        <!-- Establish Relationship Form -->
        <div style="border-bottom: 1px solid var(--card-border); margin-bottom: 2rem; padding-bottom: 1.5rem;">
            <h3 style="margin-top: 0; margin-bottom: 1rem; font-size: 1.1rem; color: #60a5fa;">Establish Relationship</h3>
            <form method="post" action="createCustomerRelationshipEvent">
                <div style="display: flex; flex-direction: column; gap: 1.25rem;">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Party ID From *</label>
                            <input type="text" name="partyIdFrom" class="form-control" required placeholder="e.g. 10010">
                        </div>
                        <div class="form-group">
                            <label>Party ID To *</label>
                            <input type="text" name="partyIdTo" class="form-control" required placeholder="e.g. 10020">
                        </div>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Role Type ID From</label>
                            <input type="text" name="roleTypeIdFrom" class="form-control" value="_NA_">
                        </div>
                        <div class="form-group">
                            <label>Role Type ID To</label>
                            <input type="text" name="roleTypeIdTo" class="form-control" value="_NA_">
                        </div>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Relationship Type ID *</label>
                            <input type="text" name="partyRelationshipTypeId" class="form-control" value="CUSTOMER_RELATION" required placeholder="e.g. CUSTOMER_RELATION">
                        </div>
                        <div class="form-group">
                            <label>Status ID</label>
                            <input type="text" name="statusId" class="form-control" placeholder="e.g. PARTYREL_CREATED">
                        </div>
                    </div>
                    <div style="text-align: right; margin-top: 0.5rem;">
                        <button type="submit" class="btn btn-primary">Establish Connection</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Update Relationship Form -->
        <div>
            <h3 style="margin-top: 0; margin-bottom: 1rem; font-size: 1.1rem; color: #f59e0b;">Update Relationship</h3>
            <form method="post" action="updateCustomerRelationshipEvent">
                <div style="display: flex; flex-direction: column; gap: 1.25rem;">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Party ID From *</label>
                            <input type="text" name="partyIdFrom" class="form-control" required placeholder="e.g. 10010">
                        </div>
                        <div class="form-group">
                            <label>Party ID To *</label>
                            <input type="text" name="partyIdTo" class="form-control" required placeholder="e.g. 10020">
                        </div>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Role Type ID From</label>
                            <input type="text" name="roleTypeIdFrom" class="form-control" value="_NA_">
                        </div>
                        <div class="form-group">
                            <label>Role Type ID To</label>
                            <input type="text" name="roleTypeIdTo" class="form-control" value="_NA_">
                        </div>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Relationship Type ID *</label>
                            <input type="text" name="partyRelationshipTypeId" class="form-control" value="CUSTOMER_RELATION" required>
                        </div>
                        <div class="form-group">
                            <label>From Date *</label>
                            <input type="text" name="fromDate" class="form-control" placeholder="yyyy-MM-dd HH:mm:ss.SSS" required>
                        </div>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label>Thru Date (Expiry)</label>
                            <input type="text" name="thruDate" class="form-control" placeholder="yyyy-MM-dd HH:mm:ss.SSS">
                        </div>
                        <div class="form-group">
                            <label>New Status ID</label>
                            <input type="text" name="statusId" class="form-control" placeholder="e.g. PARTYREL_COMPLETED">
                        </div>
                    </div>
                    <div style="text-align: right; margin-top: 0.5rem;">
                        <button type="submit" class="btn btn-warning">Update Connection</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function openModal(id) {
        document.getElementById(id).classList.add('active');
    }
    function closeModal(id) {
        document.getElementById(id).classList.remove('active');
    }
    // Close modal if clicking outside content
    window.onclick = function(event) {
        if (event.target.classList.contains('modal-overlay')) {
            event.target.classList.remove('active');
        }
    }
</script>
