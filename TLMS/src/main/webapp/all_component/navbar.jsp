<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navbar</title>
    <style>
        /* Navbar container */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a1a1a; /* Dark sleek background */
            padding: 15px 30px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        /* Left side links */
        .navbar-left {
            display: flex;
            align-items: center;
        }

        .navbar-left a {
            color: #fff;
            text-decoration: none;
            padding: 0 20px;
            font-weight: 600;
            font-size: 16px;
            transition: color 0.3s ease;
            cursor: pointer;
        }

        .navbar-left a:hover {
            color: #ffcc00;
        }

        /* Website name styling */
        .navbar-left .brand {
            font-size: 30px;
            font-weight: bold;
            margin-right: 30px;
            letter-spacing: 1px;
            color: #ffcc00;
            cursor: pointer;
        }

        /* Right side buttons */
        .navbar-right a {
            text-decoration: none;
            padding: 12px 30px;
            margin-left: 15px;
            font-weight: 600;
            font-size: 16px;
            border-radius: 30px;
            transition: all 0.3s ease;
            display: inline-block;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
            cursor: pointer;
        }

        /* Login button style */
        .navbar-right .login-btn {
            background-color: transparent;
            color: #fff;
            border: 2px solid #fff;
        }

        .navbar-right .login-btn:hover {
            background-color: #fff;
            color: #1a1a1a;
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0,0,0,0.3);
        }

        /* Register button style */
        .navbar-right .register-btn {
            background-color: #ffcc00;
            color: #1a1a1a;
            border: 2px solid #ffcc00;
        }

        .navbar-right .register-btn:hover {
            background-color: #e6b800;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0,0,0,0.3);
        }

        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }
            .navbar-left, .navbar-right {
                display: flex;
                flex-direction: column;
                width: 100%;
            }
            .navbar-left a, .navbar-right a {
                margin: 8px 0;
                padding: 10px 20px;
            }
        }
    </style>
    <!-- Remix Icon CDN -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    
</head>
<body>
    <div class="navbar">
        <div class="navbar-left">
            <span class="brand" onclick="scrollToSection('home')">Lernix <i class="ri-graduation-cap-fill"></i></span>
            <a onclick="scrollToSection('home')">HOME</a>
            <a onclick="scrollToSection('about')">ABOUT US</a>
            <a onclick="scrollToSection('services')">SERVICES</a>
            <a onclick="scrollToSection('contact')">CONTACT US</a>
        </div>
        <div class="navbar-right">
            <a href="login.jsp" class="login-btn">Login</a>
            <a href="register.jsp" class="register-btn">Register as student</a>
            <a href="registerTeacher.jsp" class="register-btn">Register as Teacher</a>
        </div>
    </div>

    <script>
        function scrollToSection(sectionId) {
            // Check if we're on the index.jsp page
            if (window.location.pathname.endsWith('index.jsp') || 
                window.location.pathname.endsWith('/') || 
                window.location.pathname === '') {
                // Scroll to section on the same page
                const element = document.getElementById(sectionId);
                if (element) {
                    element.scrollIntoView({ behavior: 'smooth' });
                }
            } else {
                // Redirect to index.jsp with the section hash
                window.location.href = 'index.jsp#' + sectionId;
            }
        }
        
        // Handle page load with hash (if coming from another page)
        window.addEventListener('load', function() {
            if (window.location.hash) {
                const sectionId = window.location.hash.substring(1);
                const element = document.getElementById(sectionId);
                if (element) {
                    setTimeout(() => {
                        element.scrollIntoView({ behavior: 'smooth' });
                    }, 100);
                }
            }
        });
    </script>
</body>
</html>