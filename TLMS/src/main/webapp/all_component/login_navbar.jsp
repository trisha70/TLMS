<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Back Navbar</title>
    <style>
        /* Navbar container */
        .back-navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a1a1a; /* Dark sleek background */
            padding: 15px 30px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        /* Left side: brand and logo */
        .back-navbar-left {
            display: flex;
            align-items: center;
        }

        .back-navbar-left .brand {
            font-size: 28px;
            font-weight: bold;
            color: #ffcc00;
            letter-spacing: 1px;
            margin-left: 10px;
        }

        .back-navbar-left img {
            width: 40px;
            height: 40px;
        }

        /* Right side: back button */
        .back-navbar-right a {
            text-decoration: none;
            padding: 12px 25px;
            font-weight: 600;
            font-size: 16px;
            border-radius: 30px;
            background-color: #ffcc00;
            color: #1a1a1a;
            border: 2px solid #ffcc00;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        .back-navbar-right a:hover {
            background-color: #e6b800;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0,0,0,0.3);
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            .back-navbar {
                flex-direction: column;
                align-items: flex-start;
            }
            .back-navbar-right {
                margin-top: 10px;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
    <div class="back-navbar">
        <div class="back-navbar-left">
            <span class="brand">Lernix <i class="ri-graduation-cap-fill"></i></span>
        </div>
        <div class="back-navbar-right">
            <a href="javascript:history.back()">Back</a>
        </div>
    </div>
</body>
</html>
