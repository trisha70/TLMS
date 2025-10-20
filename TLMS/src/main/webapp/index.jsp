<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lernix - Home</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            scroll-behavior: smooth; /* Smooth scrolling for all anchor links */
        }

        /* Home section with modern gradient */
        .home-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 60px 5% 40px; /* Reduced bottom padding */
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
            gap: 60px;
            min-height: 80vh;
            position: relative;
            overflow: hidden;
        }

        /* Decorative elements */
        .home-section::before {
            content: '';
            position: absolute;
            top: -100px;
            right: -100px;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(255, 204, 0, 0.1) 0%, rgba(147, 199, 87, 0.1) 100%);
            z-index: 0;
        }

        .home-section::after {
            content: '';
            position: absolute;
            bottom: -80px;
            left: -80px;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(42, 123, 155, 0.1) 0%, rgba(237, 221, 83, 0.1) 100%);
            z-index: 0;
        }

        /* Left: Text */
        .home-left {
            flex: 1;
            padding-right: 20px;
            position: relative;
            z-index: 1;
        }

        .main-head {
            font-size: 3.5rem;
            margin-bottom: 25px;
            line-height: 1.2;
            font-weight: 700;
            background: linear-gradient(135deg, #1a1a1a 0%, #2A7B9B 30%, #93C757 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        /* Adding a dark shade effect */
        .main-head::after {
            content: 'Welcome to Lernix';
            position: absolute;
            top: 2px;
            left: 2px;
            background: linear-gradient(135deg, #1a1a1a 0%, #2A7B9B 30%, #93C757 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            z-index: -1;
            filter: blur(2px) brightness(0.8);
            opacity: 0.7;
        }

        .home-left p {
            font-size: 1.25rem;
            line-height: 1.7;
            color: #555;
            margin-bottom: 40px;
            max-width: 90%;
        }

        /* Buttons */
        .button-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .home-left .btn {
            text-decoration: none;
            padding: 18px 40px;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 50px;
            transition: all 0.3s ease;
            display: inline-block;
            cursor: pointer;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #ffcc00;
            color: #1a1a1a;
            border: 2px solid #ffcc00;
        }

        .btn-primary:hover {
            background-color: #e6b800;
            color: #fff;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(230, 184, 0, 0.3);
        }

        .btn-secondary {
            background-color: transparent;
            color: #2A7B9B;
            border: 2px solid #2A7B9B;
        }

        .btn-secondary:hover {
            background-color: #2A7B9B;
            color: #fff;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(42, 123, 155, 0.3);
        }

        /* Right: Image */
        .home-right {
            flex: 1;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .home-right img {
            width: 100%;
            max-width: 580px;
            height: auto;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            transition: all 0.5s ease;
            transform: perspective(1000px) rotateY(-5deg);
        }

        .home-right img:hover {
            transform: perspective(1000px) rotateY(0deg) scale(1.02);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
        }

        /* Feature highlights */
        .features {
            display: flex;
            gap: 30px;
            margin-top: 40px;
            flex-wrap: wrap;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1rem;
            color: #555;
        }

        .feature i {
            color: #ffcc00;
            font-size: 1.2rem;
        }

        /* Section Styling */
        .section {
            padding: 40px 5%; /* Reduced padding */
            position: relative;
            overflow: hidden;
        }

        .section-light {
            background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
        }

        .section-dark {
            background: linear-gradient(135deg, #1a1a1a 0%, #2a2a2a 100%);
            color: #fff;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 40px; /* Reduced margin */
            font-weight: 700;
            background: linear-gradient(135deg, #1a1a1a 0%, #2A7B9B 30%, #93C757 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            position: relative;
        }

        .section-dark .section-title {
            background: linear-gradient(135deg, #ffcc00 0%, #93C757 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* About Us Section */
        .about-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 60px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .about-image {
            flex: 1;
            text-align: center;
        }

        .about-image img {
            width: 100%;
            max-width: 500px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            transition: all 0.5s ease;
        }

        .about-image img:hover {
            transform: scale(1.03);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
        }

        .about-content {
            flex: 1;
        }

        .about-content p {
            font-size: 1.1rem;
            line-height: 1.8;
            margin-bottom: 25px;
            color: #555;
        }

        .section-dark .about-content p {
            color: #e0e0e0;
        }

        /* Services Section */
        .services-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .service-card {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: 1px solid #f0f0f0;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .service-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #2A7B9B, #93C757);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .service-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #2A7B9B;
            font-weight: 600;
        }

        .service-description {
            font-size: 1rem;
            line-height: 1.6;
            color: #666;
        }

        /* Contact Section */
        .contact-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .contact-icon {
            font-size: 1.5rem;
            color: #ffcc00;
            background: #2a2a2a;
            padding: 12px;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .contact-details h4 {
            margin: 0;
            font-size: 1.2rem;
            color: #2A7B9B;
        }

        .contact-details p {
            margin: 5px 0 0;
            color: #555;
        }

        .section-dark .contact-details h4 {
            color: #ffcc00;
        }

        .section-dark .contact-details p {
            color: #e0e0e0;
        }

        .contact-form {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2A7B9B;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #2A7B9B;
        }

        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }

        .submit-btn {
            background: linear-gradient(135deg, #2A7B9B, #93C757);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(42, 123, 155, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(42, 123, 155, 0.4);
            background: linear-gradient(135deg, #1e5a7a, #7ab342);
        }

        /* Responsive */
        @media screen and (max-width: 1100px) {
            .home-section {
                flex-direction: column;
                text-align: center;
                padding: 40px 5% 30px; /* Reduced padding */
                gap: 40px;
            }

            .home-left {
                padding: 0;
            }

            .main-head {
                font-size: 2.8rem;
            }

            .home-left p {
                font-size: 1.1rem;
                max-width: 100%;
            }

            .button-container {
                justify-content: center;
            }

            .home-left .btn {
                padding: 16px 32px;
                font-size: 1rem;
            }

            .home-right img {
                max-width: 100%;
                transform: none;
            }
            
            .home-right img:hover {
                transform: scale(1.02);
            }
            
            .features {
                justify-content: center;
            }

            .about-container {
                flex-direction: column;
                text-align: center;
            }

            .about-image {
                order: -1;
            }
        }

        @media screen and (max-width: 600px) {
            .main-head {
                font-size: 2.2rem;
            }

            .home-left p {
                font-size: 1rem;
            }

            .button-container {
                flex-direction: column;
                align-items: center;
            }

            .home-left .btn {
                width: 100%;
                max-width: 280px;
            }
            
            .features {
                flex-direction: column;
                align-items: center;
            }
            
            /* Adjust the dark shade for mobile */
            .main-head::after {
                top: 1px;
                left: 1px;
                filter: blur(1px) brightness(0.8);
            }

            .section-title {
                font-size: 2rem;
            }

            .service-card {
                padding: 20px;
            }
            
            .section {
                padding: 30px 5%; /* Further reduced padding for mobile */
            }
        }
    </style>
    <!-- Include Remix Icon CDN for icons -->
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <%@ include file="all_component/navbar.jsp" %>

    <!-- Home Section -->
    <div class="home-section" id="home">
        <div class="home-left">
            <h1 class="main-head">Welcome to Lernix</h1>
            <p>Lernix is a modern Teaching-Learning Management System designed to empower educators and students. Organize courses, track progress, and access learning materials seamlessly in one platform.</p>
            
            <div class="button-container">
                <a href="login.jsp" class="btn btn-primary">Get Started</a>
                <a href="#about" class="btn btn-secondary">Learn More</a>
            </div>
            
            <div class="features">
                <div class="feature">
                    <i class="ri-group-line"></i>
                    <span>Interactive Learning</span>
                </div>
                <div class="feature">
                    <i class="ri-line-chart-line"></i>
                    <span>Progress Tracking</span>
                </div>
                <div class="feature">
                    <i class="ri-time-line"></i>
                    <span>24/7 Access</span>
                </div>
            </div>
        </div>
        
        <div class="home-right">
            <img src="images/img1.jpeg" alt="Teaching and Learning Image">
        </div>
    </div>

    <!-- About Us Section -->
    <section id="about" class="section section-light">
        <h2 class="section-title main-head">About Us</h2>
        <div class="about-container">
            <div class="about-content">
                <p>Lernix was founded with a vision to revolutionize the education sector by providing a comprehensive teaching-learning management system that bridges the gap between educators and students.</p>
                <p>Our platform is designed to create an engaging, interactive, and efficient learning environment that adapts to the needs of modern education. We believe in empowering both teachers and students with tools that enhance the learning experience.</p>
                <p>With years of experience in educational technology, our team is committed to continuous innovation and improvement, ensuring that Lernix remains at the forefront of digital learning solutions.</p>
            </div>
            <div class="about-image">
                <img src="images/img2.jpeg" alt="About Lernix">
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="section section-dark">
        <h2 class="section-title main-head">Our Services</h2>
        <div class="services-container">
            <div class="service-card">
                <div class="service-icon">
                    <i class="ri-book-open-line"></i>
                </div>
                <h3 class="service-title">Course Management</h3>
                <p class="service-description">Create, organize, and manage courses with intuitive tools. Upload materials, set schedules, and track student progress effortlessly.</p>
            </div>
            
            <div class="service-card">
                <div class="service-icon">
                    <i class="ri-line-chart-line"></i>
                </div>
                <h3 class="service-title">Progress Tracking</h3>
                <p class="service-description">Monitor student performance with detailed analytics and reports. Identify areas for improvement and celebrate achievements.</p>
            </div>
            
            <div class="service-card">
                <div class="service-icon">
                    <i class="ri-chat-3-line"></i>
                </div>
                <h3 class="service-title">Interactive Communication</h3>
                <p class="service-description">Facilitate seamless communication between teachers and students through forums, messaging, and virtual classrooms.</p>
            </div>
            
            <div class="service-card">
                <div class="service-icon">
                    <i class="ri-task-line"></i>
                </div>
                <h3 class="service-title">Assignment Management</h3>
                <p class="service-description">Create, distribute, and grade assignments efficiently. Provide timely feedback to enhance learning outcomes.</p>
            </div>
            
            <div class="service-card">
                <div class="service-icon">
                    <i class="ri-database-line"></i>
                </div>
                <h3 class="service-title">Resource Library</h3>
                <p class="service-description">Access a comprehensive library of learning materials, including videos, documents, and interactive content.</p>
            </div>
            
            <div class="service-card">
                <div class="service-icon">
                    <i class="ri-smartphone-line"></i>
                </div>
                <h3 class="service-title">Mobile Accessibility</h3>
                <p class="service-description">Learn on the go with our mobile-friendly platform that works seamlessly across all devices.</p>
            </div>
        </div>
    </section>

    <!-- Contact Us Section -->
    <section id="contact" class="section section-light">
        <h2 class="section-title main-head">Contact Us</h2>
        <div class="contact-container">
            <div class="contact-info">
                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="ri-mail-line"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Email</h4>
                        <p>support@lernix.com</p>
                    </div>
                </div>
                
                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="ri-phone-line"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Phone</h4>
                        <p>+91 9876543210</p>
                    </div>
                </div>
                
                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="ri-map-pin-line"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Address</h4>
                        <p>123 Knowledge St, EduCity, India</p>
                    </div>
                </div>
                
                <div class="contact-item">
                    <div class="contact-icon">
                        <i class="ri-time-line"></i>
                    </div>
                    <div class="contact-details">
                        <h4>Working Hours</h4>
                        <p>Monday - Friday: 9AM - 6PM</p>
                    </div>
                </div>
            </div>
            
            <div class="contact-form">
                <form>
                    <div class="form-group">
                        <label for="name">Your Name</label>
                        <input type="text" id="name" placeholder="Enter your name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Your Email</label>
                        <input type="email" id="email" placeholder="Enter your email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" placeholder="Enter subject" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Your Message</label>
                        <textarea id="message" placeholder="Enter your message" required></textarea>
                    </div>
                    
                    <button type="submit" class="submit-btn">Send Message</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <%@ include file="all_component/footer.jsp" %>
</body>
</html>