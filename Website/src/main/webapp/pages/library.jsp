<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/components/header.jsp" %>

<div class="loading-bar"></div>

<!-- Library Hero -->
<section class="library-hero">
    <div class="container">
        <div class="hero-content">
            <h1 class="fade-in">Technical Library</h1>
            <p class="subtitle slide-in">Access datasheets, manuals, and technical documentation</p>
        </div>
    </div>
</section>

<!-- Library Navigation -->
<section class="section library-nav">
    <div class="container">
        <div class="nav-tabs fade-in">
            <button class="nav-tab active" data-category="all">All Documents</button>
            <button class="nav-tab" data-category="datasheets">Datasheets</button>
            <button class="nav-tab" data-category="manuals">Manuals</button>
            <button class="nav-tab" data-category="certificates">Certificates</button>
            <button class="nav-tab" data-category="cad">CAD Models</button>
        </div>
        
        <div class="search-box slide-in" data-direction="right">
            <input type="text" id="documentSearch" placeholder="Search documents...">
            <button class="search-btn">
                <svg viewBox="0 0 24 24">
                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
                </svg>
            </button>
        </div>
    </div>
</section>

<!-- Documents Table -->
<section class="section documents-section">
    <div class="container">
        <div class="documents-header">
            <h2 class="fade-in">Available Documents</h2>
            <div class="document-stats slide-in">
                <span id="documentCount">0 documents</span>
                <button class="btn btn-filter" id="filterToggle">
                    <svg viewBox="0 0 24 24">
                        <path d="M10 18h4v-2h-4v2zM3 6v2h18V6H3zm3 7h12v-2H6v2z"/>
                    </svg>
                    Filter
                </button>
            </div>
        </div>
        
        <!-- Filter Panel -->
        <div class="filter-panel" id="filterPanel">
            <div class="filter-group">
                <h4>Document Type</h4>
                <div class="filter-options">
                    <label class="filter-checkbox">
                        <input type="checkbox" name="type" value="datasheet" checked>
                        <span class="checkmark"></span>
                        Datasheets
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="type" value="manual" checked>
                        <span class="checkmark"></span>
                        Manuals
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="type" value="certificate" checked>
                        <span class="checkmark"></span>
                        Certificates
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="type" value="cad" checked>
                        <span class="checkmark"></span>
                        CAD Models
                    </label>
                </div>
            </div>
            
            <div class="filter-group">
                <h4>Product Category</h4>
                <div class="filter-options">
                    <label class="filter-checkbox">
                        <input type="checkbox" name="category" value="articulated-arms" checked>
                        <span class="checkmark"></span>
                        Articulated Arms
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="category" value="focusing-handpieces" checked>
                        <span class="checkmark"></span>
                        Focusing Handpieces
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="category" value="laparoscope-coupler" checked>
                        <span class="checkmark"></span>
                        Laparoscope Coupler
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="category" value="micromanipulators" checked>
                        <span class="checkmark"></span>
                        Micromanipulators
                    </label>
                    <label class="filter-checkbox">
                        <input type="checkbox" name="category" value="scanners" checked>
                        <span class="checkmark"></span>
                        Scanners
                    </label>
                </div>
            </div>
            
            <div class="filter-group">
                <h4>Language</h4>
                <div class="filter-options">
                    <label class="filter-radio">
                        <input type="radio" name="language" value="all" checked>
                        <span class="radiomark"></span>
                        All Languages
                    </label>
                    <label class="filter-radio">
                        <input type="radio" name="language" value="english">
                        <span class="radiomark"></span>
                        English
                    </label>
                    <label class="filter-radio">
                        <input type="radio" name="language" value="german">
                        <span class="radiomark"></span>
                        German
                    </label>
                    <label class="filter-radio">
                        <input type="radio" name="language" value="japanese">
                        <span class="radiomark"></span>
                        Japanese
                    </label>
                </div>
            </div>
            
            <div class="filter-actions">
                <button class="btn btn-apply" id="applyFilters">Apply Filters</button>
                <button class="btn btn-reset" id="resetFilters">Reset</button>
            </div>
        </div>
        
        <!-- Documents Table -->
        <div class="documents-table-container">
            <table class="documents-table" id="documentsTable">
                <thead>
                    <tr>
                        <th class="sortable" data-sort="name">
                            Document Name
                            <span class="sort-icon"></span>
                        </th>
                        <th class="sortable" data-sort="type">
                            Type
                            <span class="sort-icon"></span>
                        </th>
                        <th class="sortable" data-sort="category">
                            Category
                            <span class="sort-icon"></span>
                        </th>
                        <th class="sortable" data-sort="format">
                            Format
                            <span class="sort-icon"></span>
                        </th>
                        <th class="sortable" data-sort="language">
                            Language
                            <span class="sort-icon"></span>
                        </th>
                        <th class="sortable" data-sort="size">
                            Size
                            <span class="sort-icon"></span>
                        </th>
                        <th class="sortable" data-sort="date">
                            Date
                            <span class="sort-icon"></span>
                        </th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="documentsBody">
                    <!-- Documents will be loaded dynamically -->
                </tbody>
            </table>
            
            <div class="table-empty" id="noDocuments">
                <svg viewBox="0 0 24 24">
                    <path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/>
                </svg>
                <h3>No documents found</h3>
                <p>Try adjusting your filters or search terms</p>
            </div>
        </div>
        
        <!-- Pagination -->
        <div class="pagination" id="pagination">
            <button class="pagination-btn prev" disabled>
                <svg viewBox="0 0 24 24">
                    <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
                </svg>
            </button>
            <div class="pagination-numbers"></div>
            <button class="pagination-btn next">
                <svg viewBox="0 0 24 24">
                    <path d="M8.59 16.59L10 18l6-6-6-6-1.41 1.41L13.17 12z"/>
                </svg>
            </button>
        </div>
    </div>
</section>

<!-- Quick Download Modal -->
<div class="modal" id="downloadModal">
    <div class="modal-content">
        <button class="modal-close">&times;</button>
        <div class="modal-body">
            <div class="download-info">
                <div class="download-icon">
                    <svg viewBox="0 0 24 24">
                        <path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/>
                    </svg>
                </div>
                <h3>Download Document</h3>
                <p id="downloadFileName"></p>
                <div class="download-details">
                    <div class="detail">
                        <strong>Size:</strong>
                        <span id="downloadFileSize"></span>
                    </div>
                    <div class="detail">
                        <strong>Format:</strong>
                        <span id="downloadFileFormat"></span>
                    </div>
                    <div class="detail">
                        <strong>Last Updated:</strong>
                        <span id="downloadFileDate"></span>
                    </div>
                </div>
            </div>
            
            <div class="download-options">
                <h4>Download Options</h4>
                <div class="option-group">
                    <label class="option-radio">
                        <input type="radio" name="downloadOption" value="direct" checked>
                        <span class="radiomark"></span>
                        Direct Download
                    </label>
                    <label class="option-radio">
                        <input type="radio" name="downloadOption" value="email">
                        <span class="radiomark"></span>
                        Send to Email
                    </label>
                </div>
                
                <div class="email-input" id="emailInput" style="display: none;">
                    <input type="email" placeholder="Enter your email address">
                    <button class="btn btn-send">Send</button>
                </div>
                
                <div class="download-actions">
                    <button class="btn btn-primary" id="confirmDownload">
                        Start Download
                    </button>
                    <button class="btn btn-secondary modal-close">
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    /* Library Hero */
    .library-hero {
        min-height: 40vh;
        background: linear-gradient(135deg, #004080, #20C997);
        display: flex;
        align-items: center;
        text-align: center;
        color: white;
        padding-top: 100px;
    }
    
    .library-hero h1 {
        -webkit-text-fill-color: white;
        background: transparent;
        margin-bottom: 1rem;
    }
    
    /* Navigation Tabs */
    .library-nav {
        padding: 3rem 0;
        background: var(--white);
        border-bottom: 1px solid #e9ecef;
    }
    
    .nav-tabs {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
        justify-content: center;
        margin-bottom: 2rem;
    }
    
    .nav-tab {
        padding: 0.75rem 1.5rem;
        background: transparent;
        border: 2px solid var(--primary-blue);
        color: var(--primary-blue);
        border-radius: 50px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    
    .nav-tab.active {
        background: var(--primary-blue);
        color: white;
    }
    
    .nav-tab:hover:not(.active) {
        background: rgba(0, 64, 128, 0.1);
    }
    
    .search-box {
        max-width: 500px;
        margin: 0 auto;
        position: relative;
    }
    
    .search-box input {
        width: 100%;
        padding: 1rem 3rem 1rem 1.5rem;
        border: 2px solid #e9ecef;
        border-radius: 50px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }
    
    .search-box input:focus {
        outline: none;
        border-color: var(--accent-teal);
        box-shadow: 0 0 0 3px rgba(32, 201, 151, 0.1);
    }
    
    .search-btn {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        cursor: pointer;
        padding: 0.5rem;
    }
    
    .search-btn svg {
        width: 20px;
        height: 20px;
        fill: var(--secondary-gray);
        transition: fill 0.3s ease;
    }
    
    .search-btn:hover svg {
        fill: var(--accent-teal);
    }
    
    /* Documents Section */
    .documents-section {
        padding: 3rem 0 5rem;
        background: var(--background-light);
    }
    
    .documents-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        flex-wrap: wrap;
        gap: 1rem;
    }
    
    .document-stats {
        display: flex;
        align-items: center;
        gap: 1rem;
    }
    
    .document-stats span {
        color: var(--secondary-gray);
        font-weight: 500;
    }
    
    .btn-filter {
        padding: 0.5rem 1rem;
        background: white;
        border: 1px solid #e9ecef;
        color: var(--secondary-gray);
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }
    
    .btn-filter svg {
        width: 18px;
        height: 18px;
        fill: currentColor;
    }
    
    /* Filter Panel */
    .filter-panel {
        background: white;
        border-radius: 15px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-sm);
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
        display: none;
    }
    
    .filter-panel.active {
        display: grid;
        animation: fadeIn 0.3s ease;
    }
    
    .filter-group h4 {
        margin-bottom: 1rem;
        color: var(--primary-blue);
    }
    
    .filter-options {
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
    }
    
    .filter-checkbox, .filter-radio {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        cursor: pointer;
        user-select: none;
    }
    
    .filter-checkbox input, .filter-radio input {
        display: none;
    }
    
    .checkmark, .radiomark {
        width: 20px;
        height: 20px;
        border: 2px solid #ddd;
        border-radius: 4px;
        position: relative;
        transition: all 0.3s ease;
    }
    
    .radiomark {
        border-radius: 50%;
    }
    
    .filter-checkbox input:checked + .checkmark {
        background: var(--accent-teal);
        border-color: var(--accent-teal);
    }
    
    .filter-checkbox input:checked + .checkmark::after {
        content: '✓';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-size: 12px;
        font-weight: bold;
    }
    
    .filter-radio input:checked + .radiomark {
        border-color: var(--accent-teal);
    }
    
    .filter-radio input:checked + .radiomark::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 10px;
        height: 10px;
        background: var(--accent-teal);
        border-radius: 50%;
    }
    
    .filter-actions {
        grid-column: 1 / -1;
        display: flex;
        gap: 1rem;
        justify-content: flex-end;
        padding-top: 1rem;
        border-top: 1px solid #e9ecef;
    }
    
    .btn-apply {
        background: var(--accent-teal);
    }
    
    .btn-reset {
        background: transparent;
        border: 1px solid #ddd;
        color: var(--secondary-gray);
    }
    
    /* Documents Table */
    .documents-table-container {
        background: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: var(--shadow-sm);
        margin-bottom: 2rem;
    }
    
    .documents-table {
        width: 100%;
        border-collapse: collapse;
    }
    
    .documents-table thead {
        background: var(--background-light);
    }
    
    .documents-table th {
        padding: 1.5rem 1rem;
        text-align: left;
        font-weight: 600;
        color: var(--primary-blue);
        border-bottom: 2px solid #e9ecef;
        cursor: pointer;
        user-select: none;
        position: relative;
    }
    
    .sortable:hover {
        background: rgba(0, 64, 128, 0.05);
    }
    
    .sort-icon {
        display: inline-block;
        width: 0;
        height: 0;
        margin-left: 5px;
        opacity: 0.3;
    }
    
    .sortable.asc .sort-icon {
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-bottom: 5px solid var(--primary-blue);
    }
    
    .sortable.desc .sort-icon {
        border-left: 5px solid transparent;
        border-right: 5px solid transparent;
        border-top: 5px solid var(--primary-blue);
    }
    
    .documents-table tbody tr {
        border-bottom: 1px solid #e9ecef;
        transition: background 0.3s ease;
    }
    
    .documents-table tbody tr:hover {
        background: rgba(0, 64, 128, 0.02);
    }
    
    .documents-table td {
        padding: 1.5rem 1rem;
        color: var(--secondary-gray);
    }
    
    .documents-table .document-name {
        color: var(--primary-blue);
        font-weight: 500;
    }
    
    .document-badge {
        display: inline-block;
        padding: 0.25rem 0.75rem;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
    }
    
    .badge-datasheet {
        background: rgba(32, 201, 151, 0.1);
        color: var(--accent-teal);
    }
    
    .badge-manual {
        background: rgba(0, 64, 128, 0.1);
        color: var(--primary-blue);
    }
    
    .badge-certificate {
        background: rgba(255, 165, 0, 0.1);
        color: #FFA500;
    }
    
    .badge-cad {
        background: rgba(108, 117, 125, 0.1);
        color: #6c757d;
    }
    
    .category-badge {
        display: inline-block;
        padding: 0.25rem 0.75rem;
        background: var(--background-light);
        border-radius: 4px;
        font-size: 0.8rem;
    }
    
    .btn-download {
        padding: 0.5rem 1rem;
        background: var(--accent-teal);
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.9rem;
        transition: background 0.3s ease;
    }
    
    .btn-download:hover {
        background: #1ab082;
    }
    
    .table-empty {
        text-align: center;
        padding: 4rem 2rem;
        display: none;
    }
    
    .table-empty.active {
        display: block;
    }
    
    .table-empty svg {
        width: 60px;
        height: 60px;
        fill: #e9ecef;
        margin-bottom: 1rem;
    }
    
    .table-empty h3 {
        margin-bottom: 0.5rem;
        color: var(--secondary-gray);
    }
    
    /* Pagination */
    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 1rem;
    }
    
    .pagination-btn {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        border: 1px solid #e9ecef;
        background: white;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .pagination-btn:hover:not(:disabled) {
        border-color: var(--accent-teal);
        background: rgba(32, 201, 151, 0.1);
    }
    
    .pagination-btn:disabled {
        opacity: 0.5;
        cursor: not-allowed;
    }
    
    .pagination-btn svg {
        width: 20px;
        height: 20px;
        fill: var(--secondary-gray);
    }
    
    .pagination-numbers {
        display: flex;
        gap: 0.5rem;
    }
    
    .page-number {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
        font-weight: 500;
    }
    
    .page-number.active {
        background: var(--primary-blue);
        color: white;
    }
    
    .page-number:hover:not(.active) {
        background: rgba(0, 64, 128, 0.1);
    }
    
    /* Download Modal */
    .download-info {
        text-align: center;
        margin-bottom: 2rem;
    }
    
    .download-icon {
        width: 80px;
        height: 80px;
        background: linear-gradient(135deg, var(--primary-blue), var(--accent-teal));
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1.5rem;
    }
    
    .download-icon svg {
        width: 40px;
        height: 40px;
        fill: white;
    }
    
    .download-details {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 1rem;
        margin-top: 1.5rem;
        padding: 1.5rem;
        background: var(--background-light);
        border-radius: 10px;
    }
    
    .download-options {
        margin-top: 2rem;
        padding-top: 2rem;
        border-top: 1px solid #e9ecef;
    }
    
    .option-group {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        margin: 1.5rem 0;
    }
    
    .email-input {
        display: flex;
        gap: 1rem;
        margin: 1.5rem 0;
    }
    
    .email-input input {
        flex: 1;
        padding: 0.75rem 1rem;
        border: 1px solid #e9ecef;
        border-radius: 4px;
    }
    
    .btn-send {
        background: var(--accent-teal);
        color: white;
        border: none;
        padding: 0.75rem 1.5rem;
        border-radius: 4px;
        cursor: pointer;
    }
    
    .download-actions {
        display: flex;
        gap: 1rem;
        justify-content: flex-end;
        margin-top: 2rem;
    }
    
    @media (max-width: 768px) {
        .documents-table {
            display: block;
            overflow-x: auto;
        }
        
        .documents-header {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .filter-panel {
            grid-template-columns: 1fr;
        }
        
        .download-details {
            grid-template-columns: 1fr;
        }
    }
</style>

<script src="<%= contextPath %>/assets/js/library.js"></script>

<%@ include file="/components/footer.jsp" %>