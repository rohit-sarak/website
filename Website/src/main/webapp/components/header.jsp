<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentPage = request.getRequestURI();
    String contextPath = request.getContextPath();
%>

<header class="header glass-effect" id="mainHeader">
    <div class="container">
        <nav class="nav">
            <!-- Logo -->
            <a href="<%= contextPath %>/home" class="logo">
                <div class="logo-3d">
                    <span class="logo-text">PRECISION</span>
                    <span class="logo-subtext">TECH</span>
                </div>
            </a>
            
            <!-- Desktop Menu -->
            <ul class="nav-menu">
                <li class="nav-item <%= currentPage.contains("/home") ? "active" : "" %>">
                    <a href="<%= contextPath %>/home" class="nav-link">
                        <span>Home</span>
                        <div class="underline"></div>
                    </a>
                </li>
                <li class="nav-item <%= currentPage.contains("/products") ? "active" : "" %>">
                    <a href="<%= contextPath %>/products" class="nav-link">
                        <span>Products</span>
                        <div class="underline"></div>
                    </a>
                </li>
                <li class="nav-item dropdown <%= currentPage.contains("/compliance") ? "active" : "" %>">
                    <a href="<%= contextPath %>/compliance/conflict-minerals" class="nav-link">
                        <span>Compliance</span>
                        <div class="underline"></div>
                    </a>
                    <div class="dropdown-menu">
                        <a href="<%= contextPath %>/compliance/conflict-minerals">Conflict Minerals</a>
                        <a href="<%= contextPath %>/compliance/reach-statement">REACH Statement</a>
                        <a href="<%= contextPath %>/compliance/rohs-policy">RoHS Policy</a>
                    </div>
                </li>
                <li class="nav-item <%= currentPage.contains("/library") ? "active" : "" %>">
                    <a href="<%= contextPath %>/library" class="nav-link">
                        <span>Library</span>
                        <div class="underline"></div>
                    </a>
                </li>
                <li class="nav-item <%= currentPage.contains("/requests") ? "active" : "" %>">
                    <a href="<%= contextPath %>/requests" class="nav-link">
                        <span>Requests</span>
                        <div class="underline"></div>
                    </a>
                </li>
                <li class="nav-item <%= currentPage.contains("/contact") ? "active" : "" %>">
                    <a href="<%= contextPath %>/contact" class="nav-link">
                        <span>Contact</span>
                        <div class="underline"></div>
                    </a>
                </li>
            </ul>
            
            <!-- Mobile Menu Toggle -->
            <button class="menu-toggle" id="menuToggle">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </nav>
    </div>
</header>

<style>
    .header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        padding: 1rem 0;
        transition: all 0.3s ease;
    }
    
    .header.scrolled {
        padding: 0.5rem 0;
        background: rgba(0, 64, 128, 0.95);
        backdrop-filter: blur(20px);
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    }
    
    .nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .logo {
        text-decoration: none;
    }
    
    .logo-3d {
        display: inline-block;
        padding: 0.5rem 1rem;
        background: linear-gradient(135deg, var(--primary-blue) 0%, #20C997 100%);
        border-radius: 10px;
        transform: perspective(500px) rotateX(10deg);
        box-shadow: 0 10px 30px rgba(0, 64, 128, 0.3);
        transition: all 0.3s ease;
    }
    
    .logo-3d:hover {
        transform: perspective(500px) rotateX(0deg) scale(1.05);
    }
    
    .logo-text {
        font-size: 1.5rem;
        font-weight: 700;
        color: white;
        display: block;
        letter-spacing: 2px;
    }
    
    .logo-subtext {
        font-size: 0.8rem;
        color: rgba(255, 255, 255, 0.9);
        display: block;
        letter-spacing: 3px;
    }
    
    .nav-menu {
        display: flex;
        list-style: none;
        gap: 2rem;
    }
    
    .nav-link {
        color: white;
        text-decoration: none;
        font-weight: 500;
        padding: 0.5rem 0;
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    
    .nav-link span {
        position: relative;
        z-index: 2;
    }
    
    .underline {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0;
        height: 2px;
        background: var(--accent-teal);
        transition: width 0.3s ease;
        border-radius: 1px;
    }
    
    .nav-link:hover .underline {
        width: 100%;
    }
    
    .nav-item.active .underline {
        width: 100%;
        background: var(--accent-orange);
    }
    
    /* Dropdown */
    .dropdown {
        position: relative;
    }
    
    .dropdown-menu {
        position: absolute;
        top: 100%;
        left: 0;
        background: white;
        min-width: 200px;
        border-radius: 10px;
        box-shadow: var(--shadow-lg);
        opacity: 0;
        visibility: hidden;
        transform: translateY(10px);
        transition: all 0.3s ease;
        padding: 0.5rem 0;
    }
    
    .dropdown:hover .dropdown-menu {
        opacity: 1;
        visibility: visible;
        transform: translateY(0);
    }
    
    .dropdown-menu a {
        display: block;
        padding: 0.75rem 1.5rem;
        color: var(--secondary-gray);
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .dropdown-menu a:hover {
        background: var(--background-light);
        color: var(--primary-blue);
        padding-left: 2rem;
    }
    
    /* Mobile Menu */
    .menu-toggle {
        display: none;
        background: none;
        border: none;
        cursor: pointer;
        padding: 0.5rem;
    }
    
    .menu-toggle span {
        display: block;
        width: 25px;
        height: 3px;
        background: white;
        margin: 4px 0;
        transition: all 0.3s ease;
        border-radius: 2px;
    }
    
    @media (max-width: 768px) {
        .menu-toggle {
            display: block;
        }
        
        .nav-menu {
            position: fixed;
            top: 70px;
            left: 0;
            width: 100%;
            background: rgba(0, 64, 128, 0.98);
            backdrop-filter: blur(20px);
            flex-direction: column;
            padding: 2rem;
            gap: 1rem;
            transform: translateX(-100%);
            transition: transform 0.3s ease;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .nav-menu.active {
            transform: translateX(0);
        }
        
        .menu-toggle.active span:nth-child(1) {
            transform: rotate(45deg) translate(5px, 5px);
        }
        
        .menu-toggle.active span:nth-child(2) {
            opacity: 0;
        }
        
        .menu-toggle.active span:nth-child(3) {
            transform: rotate(-45deg) translate(7px, -6px);
        }
        
        .dropdown-menu {
            position: static;
            opacity: 1;
            visibility: visible;
            transform: none;
            box-shadow: none;
            background: rgba(255, 255, 255, 0.1);
            margin-top: 0.5rem;
            border-radius: 5px;
        }
    }
</style>

<script>
    // Header scroll effect
    document.addEventListener('DOMContentLoaded', function() {
        const header = document.getElementById('mainHeader');
        const menuToggle = document.getElementById('menuToggle');
        const navMenu = document.querySelector('.nav-menu');
        
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
        
        // Mobile menu toggle
        menuToggle.addEventListener('click', function() {
            this.classList.toggle('active');
            navMenu.classList.toggle('active');
        });
        
        // Close menu on click outside
        document.addEventListener('click', function(event) {
            if (!navMenu.contains(event.target) && !menuToggle.contains(event.target)) {
                menuToggle.classList.remove('active');
                navMenu.classList.remove('active');
            }
        });
    });
</script>