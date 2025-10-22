<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <!-- Remix Icon CDN -->

    
    <style>
        /* Footer container */
        .footer {
            background-color: #1a1a1a; /* Same as navbar */
            color: #fff;
            padding: 40px 50px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            box-shadow: 0 -4px 6px rgba(0,0,0,0.2);
        }

        /* Footer sections */
        .footer-left, .footer-center, .footer-right, .footer-contact {
            flex: 1;
            min-width: 220px;
            margin: 15px 0;
        }

        /* Footer title/brand */
        .footer .brand {
            font-size: 24px;
            font-weight: bold;
            color: #ffcc00;
            margin-bottom: 15px;
        }

        /* Footer links */
        .footer a {
            color: #fff;
            text-decoration: none;
            display: block;
            margin: 6px 0;
            font-weight: 500;
            transition: color 0.3s;
        }

        .footer a:hover {
            color: #ffcc00;
        }

        /* Social buttons */
        .footer .social-btn {
            display: inline-block;
            margin-right: 10px;
            width: 40px;
            height: 40px;
            background-color: #333;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            color: #fff;
            transition: all 0.3s ease;
        }

        .footer .social-btn:hover {
            background-color: #ffcc00;
            color: #1a1a1a;
            transform: translateY(-2px);
        }

        /* Footer contact info */
        .footer-contact p {
            margin: 6px 0;
            font-size: 15px;
        }

        /* Footer bottom copyright */
        .footer-bottom {
            width: 100%;
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            border-top: 1px solid #444;
            padding-top: 10px;
            color: #aaa;
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            .footer {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .footer-left, .footer-center, .footer-right, .footer-contact {
                margin: 15px 0;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
    <div class="footer">
        <!-- Left section: Brand & short description -->
        <div class="footer-left">
            <div class="brand">Lernix <i class="ri-graduation-cap-fill"></i></div>
            <p>Your go-to platform for modern teaching and learning. Empowering educators and students to achieve more.</p>
        </div>

        <!-- Center section: Quick Links -->
        <div class="footer-center">
            <div><strong>Quick Links</strong></div>
            <a href="index.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="services.jsp">Services</a>
            <a href="contact.jsp">Contact Us</a>
        </div>

        <!-- Contact information -->
        <div class="footer-contact">
            <div><strong>Contact Us</strong></div>
            <p>Email: support@lernix.com</p>
            <p>Phone: +91 9876543210</p>
            <p>Address: 123 Knowledge St, EduCity, India</p>
        </div>

        <!-- Right section: Social media -->
        <div class="footer-right">
            <div><strong>Follow Us</strong></div>
            <a href="#" class="social-btn"><i class="ri-facebook-fill"></i></a>
            <a href="#" class="social-btn"><i class="ri-telegram-fill"></i></a>
            <a href="#" class="social-btn"><i class="ri-linkedin-fill"></i></a>
            <a href="#" class="social-btn"><i class="ri-instagram-fill"></i></a>
        </div>

        <!-- Bottom copyright -->
        <div class="footer-bottom">
            &copy; 2025 Lernix. All rights reserved.
        </div>
    </div>
</body>
</html>
