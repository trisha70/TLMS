<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Navbar</title>
    <style>
        /* Navbar container */
        .home-navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(26, 26, 26, 0.95);
            padding: 15px 40px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            border-bottom: 2px solid #ffcc00;
        }

        /* Left side: brand and logo */
        .home-navbar-left {
            display: flex;
            align-items: center;
        }

        .home-navbar-left .brand {
            font-size: 28px;
            font-weight: bold;
            color: #ffcc00;
            letter-spacing: 1px;
            margin-left: 10px;
            display: flex;
            align-items: center;
        }

        .home-navbar-left .brand i {
            margin-right: 8px;
        }

        /* Center: navigation links */
        .home-navbar-center {
            display: flex;
            gap: 30px;
        }

        .home-navbar-center a {
            text-decoration: none;
            color: #fff;
            font-weight: 600;
            font-size: 16px;
            padding: 8px 15px;
            border-radius: 20px;
            transition: all 0.3s ease;
            position: relative;
        }

        .home-navbar-center a:not(.active):hover {
            color: #ffcc00;
            transform: translateY(-2px);
        }

        .home-navbar-center a.active {
            background-color: #ffcc00;
            color: #1a1a1a;
        }

        .home-navbar-center a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 3px;
            background-color: #ffcc00;
            transition: width 0.3s ease;
            border-radius: 2px;
        }

        .home-navbar-center a:hover::after {
            width: 100%;
        }

        /* Right side: user profile and logout */
        .home-navbar-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #fff;
            cursor: pointer;
            padding: 8px 15px;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .user-profile:hover {
            background-color: rgba(255, 204, 0, 0.2);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(145deg, #ffcc00, #ffdb4d);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #1a1a1a;
            border: 2px solid #ffcc00;
        }

        .logout-btn {
            text-decoration: none;
            padding: 10px 20px;
            font-weight: 600;
            font-size: 16px;
            border-radius: 30px;
            background-color: transparent;
            color: #ffcc00;
            border: 2px solid #ffcc00;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #ffcc00;
            color: #1a1a1a;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(255, 204, 0, 0.3);
        }

        /* Responsive design */
        @media screen and (max-width: 992px) {
            .home-navbar-center {
                gap: 15px;
            }
            
            .home-navbar-center a {
                font-size: 14px;
                padding: 6px 12px;
            }
        }

        @media screen and (max-width: 768px) {
            .home-navbar {
                flex-direction: column;
                padding: 15px 20px;
            }
            
            .home-navbar-center {
                margin: 15px 0;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .home-navbar-right {
                width: 100%;
                justify-content: center;
                border-top: 1px solid #444;
                padding-top: 15px;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
    <div class="home-navbar">
        <div class="home-navbar-left">
            <span class="brand">
                <i class="ri-graduation-cap-fill"></i>Lernix
            </span>
        </div>
        
        <div class="home-navbar-center">
            <a href="#" class="active">Home</a>
            <a href="#">Courses</a>
            <a href="#">Schedule</a>
            <a href="#">Resources</a>
        </div>
        
        <div class="home-navbar-right">
            <div class="user-profile">
                <div class="user-avatar">S</div>
                <span>Student</span>
            </div>
            <a href="#" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>