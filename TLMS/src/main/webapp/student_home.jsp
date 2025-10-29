<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Home - Lernix</title>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      background: linear-gradient(135deg, #2A7B9B, #93C757, #EDDD53);
    }

    .main-content {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 50px 20px;
    }

    .student-home {
      background-color: rgba(26, 26, 26, 0.95);
      padding: 50px 40px;
      border-radius: 20px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
      width: 90%;
      max-width: 1000px;
      text-align: center;
      color: #fff;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      backdrop-filter: blur(10px);
    }

    .student-home:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 45px rgba(0, 0, 0, 0.7);
    }

    .student-home h2 {
      font-size: 32px;
      font-weight: bold;
      color: #ffcc00;
      margin-bottom: 40px;
      text-shadow: 0 2px 4px rgba(0,0,0,0.3);
    }

    /* Grid layout (same as teacher) */
    .home-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 25px;
    }

    /* Card design identical to teacher-home */
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
      text-decoration: none;
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
      text-decoration: none;
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

    @media (max-width: 900px) {
      .student-home {
        padding: 35px 25px;
      }
      .student-home h2 {
        font-size: 26px;
      }
      .home-card {
        min-height: 140px;
        font-size: 18px;
      }
    }
  </style>
</head>
<body>

  <%@ include file="all_component/home_navbar.jsp" %>

  <div class="main-content">
    <div class="student-home">
      <h2>Welcome Student <i class="ri-graduation-cap-fill"></i></h2>

      <div class="home-grid">
        <a href="student_profile.jsp" class="home-card">
          <i class="ri-user-line"></i>
          <span>Profile</span>
        </a>

        <a href="attendance.jsp" class="home-card">
          <i class="ri-line-chart-line"></i>
          <span>Attendance</span>
        </a>

        <a href="results.jsp" class="home-card">
          <i class="ri-medal-line"></i>
          <span>Results</span>
        </a>

        <a href="online_test.jsp" class="home-card">
          <i class="ri-clipboard-line"></i>
          <span>Online Test</span>
        </a>

        <a href="online_class.jsp" class="home-card">
          <i class="ri-video-line"></i>
          <span>Online Class</span>
        </a>

        <a href="assignments.jsp" class="home-card">
          <i class="ri-task-line"></i>
          <span>Assignments</span>
        </a>

        <a href="view_routine.jsp" class="home-card">
          <i class="ri-calendar-event-line"></i>
          <span>Timetable</span>
        </a>

        <a href="noticeBoard.jsp" class="home-card">
          <i class="ri-notification-3-line"></i>
          <span>Notice</span>
        </a>
      </div>
    </div>
  </div>

  <%@ include file="all_component/footer.jsp" %>
</body>
</html>
