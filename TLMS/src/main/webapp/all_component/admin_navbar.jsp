<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    🚨 IMPORTANT: JSTL Troubleshooting - All JSTL code below has been replaced with Scriptlets 
    because the server environment is failing to load the JSTL library (jakarta.tags.core).
--%>

<%
    // --- PURE JAVA SCRIPTLET AUTHENTICATION CHECK ---
    // Check if Admin is logged in. If not, redirect to the login page.
    Object sessionRole = session.getAttribute("role");
    
    if (sessionRole == null || !sessionRole.equals("Admin")) {
        // Set the failure message in the session
        session.setAttribute("failed-msg", "Please Login as Admin to access this page.");
        
        // Use the absolute path for redirection
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Helper variable to determine the active page using pure Java Scriptlet for the active class logic
    String currentURI = request.getRequestURI();
%>

<style>
    /* Admin Navbar Styling */
    .navbar {
        background-color: #1a1a1a; /* Dark background */
        padding: 10px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .navbar-brand {
        color: #ffcc00; /* Yellow accent for logo */
        font-size: 24px;
        font-weight: 700;
        text-decoration: none;
        display: flex;
        align-items: center;
    }
    .navbar-brand i {
        margin-right: 8px;
    }
    .nav-links {
        display: flex;
        gap: 25px;
    }
    .nav-links a {
        color: #fff;
        text-decoration: none;
        font-size: 16px;
        padding: 8px 12px;
        border-radius: 8px;
        transition: background-color 0.2s ease, color 0.2s ease;
    }
    /* Active class styling based on the page you are currently on */
    .nav-links a:hover, .nav-links a.active {
        background-color: #333;
        color: #ffcc00;
    }

    .user-info {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .user-badge {
        background-color: #ffcc00;
        color: #1a1a1a;
        padding: 5px 10px;
        border-radius: 50px;
        font-weight: 600;
        font-size: 14px;
    }
    .logout-btn {
        background-color: #f44336; /* Red color for logout */
        color: #fff;
        border: none;
        padding: 8px 15px;
        border-radius: 8px;
        cursor: pointer;
        text-decoration: none;
        font-weight: 500;
        transition: background-color 0.2s ease;
    }
    .logout-btn:hover {
        background-color: #d32f2f;
    }
</style>

<nav class="navbar">
    <a href="admin_home.jsp" class="navbar-brand">
        <i class="ri-graduation-cap-fill"></i>Lernix
    </a>

    <div class="nav-links">
        <a href="admin_home.jsp" class="<%= currentURI.endsWith("/admin_home.jsp") ? "active" : "" %>">Home</a>
        <a href="#">Courses</a>
        <a href="#">Schedule</a>
        <a href="#">Resources</a>
        <!-- Link to the new Routine Upload Page -->
        <a href="admin_routine_upload.jsp" class="<%= currentURI.endsWith("/admin_routine_upload.jsp") ? "active" : "" %>">Routine</a>
        <a href="#">Notice</a>
    </div>

    <div class="user-info">
        <span class="user-badge">
            <i class="ri-user-2-fill"></i> Admin
        </span>
        
        <%-- Assuming LogoutServlet is at the root level --%>
        <a href="<%= request.getContextPath() %>/LogoutServlet" class="logout-btn">Logout</a>
    </div>
</nav>

<!-- 💡 CRITICAL FIX: The closing </div> from the screenshot's end was outside the final </div> tag. -->
<!-- Ensure the containing element is closed properly if this is included in a parent JSP. -->
<!-- In a typical JSP include, the surrounding HTML tags handle closing, but I'll assume the structure is self-contained. -->
