<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Home - Lernix</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background: linear-gradient(135deg, #2A7B9B, #93C757, #EDDD53);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .main-content {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 20px;
    }

    .admin-home {
      background-color: rgba(26, 26, 26, 0.95);
      padding: 50px;
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0,0,0,0.5);
      width: 90%;
      max-width: 1000px;
      text-align: center;
      color: #fff;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      backdrop-filter: blur(10px);
    }

    .admin-home:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 45px rgba(0, 0, 0, 0.7);
    }

    .admin-home h2 {
      font-size: 32px;
      font-weight: bold;
      color: #ffcc00;
      margin-bottom: 40px;
      text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    /* Grid layout for admin options - 2 columns */
    .home-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 30px;
    }

    .home-card {
      background: linear-gradient(145deg, #2a2a2a, #333333);
      padding: 35px 25px;
      border-radius: 16px;
      font-size: 20px;
      font-weight: 600;
      color: #fff;
      cursor: pointer;
      transition: all 0.3s ease;
      border: 2px solid #444;
      box-shadow: 0 8px 20px rgba(0,0,0,0.2);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 160px;
      position: relative;
      overflow: hidden;
    }

    .home-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(to right, transparent, rgba(255,255,255,0.1), transparent);
      transform: translateX(-100%);
    }

    .home-card:hover {
      background: linear-gradient(145deg, #ffcc00, #ffdb4d);
      color: #1a1a1a;
      transform: translateY(-8px) scale(1.03);
      box-shadow: 0 12px 25px rgba(0,0,0,0.5);
      border: 2px solid #ffcc00;
    }

    .home-card:hover::before {
      animation: shimmer 1.5s ease infinite;
    }

    @keyframes shimmer {
      100% {
        transform: translateX(100%);
      }
    }

    .home-card i {
      font-size: 32px;
      margin-bottom: 15px;
      transition: transform 0.3s ease;
    }

    .home-card:hover i {
      transform: scale(1.2);
    }

    @media screen and (max-width: 900px) {
      .home-grid {
        grid-template-columns: 1fr;
        gap: 20px;
      }
      
      .admin-home {
        padding: 30px 25px;
      }
      
      .home-card {
        min-height: 140px;
        padding: 30px 20px;
      }
    }

    @media screen and (max-width: 600px) {
      .admin-home {
        padding: 25px 20px;
      }
      
      .admin-home h2 {
        font-size: 26px;
        margin-bottom: 30px;
      }
      
      .home-card {
        font-size: 18px;
        padding: 25px 15px;
        min-height: 120px;
      }
      
      .home-card i {
        font-size: 28px;
        margin-bottom: 12px;
      }
    }
  </style>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
  <%@ include file="all_component/home_navbar.jsp" %>

  <div class="main-content">
    <div class="admin-home">
      <h2>Welcome Admin <i class="ri-admin-line"></i></h2>
      <div class="home-grid">
        <div class="home-card">
          <i class="ri-eye-line"></i>
          <span>View</span>
        </div>
        <div class="home-card">
          <i class="ri-edit-2-line"></i>
          <span>Update</span>
        </div>
        <div class="home-card">
          <i class="ri-notification-3-line"></i>
          <span>Notice</span>
        </div>
        <div class="home-card">
          <i class="ri-calendar-schedule-line"></i>
          <span>Routine</span>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="all_component/footer.jsp" %>
</body>
</html>
