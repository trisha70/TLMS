<%@ page import="java.util.*,com.DAO.NoticeDAO,com.User.Notice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Notice Board - Lernix</title>
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
      color: #fff;
    }

    .main-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 40px 20px;
      width: 100%;
    }

    .notice-container {
      background-color: #1a1a1a;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.4);
      width: 600px;
      max-width: 90%;
      text-align: center;
      color: #fff;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      margin: 30px 0;
    }

    .notice-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 18px 40px rgba(0, 0, 0, 0.6);
    }

    .notice-container h2 {
      margin-bottom: 25px;
      font-size: 28px;
      font-weight: bold;
      color: #ffcc00;
    }

    .notice-item {
      background-color: #2a2a2a;
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 20px;
      border: 1px solid #333;
      text-align: left;
      transition: all 0.3s ease;
    }

    .notice-item:hover {
      border-color: #ffcc00;
      transform: scale(1.02);
    }

    .notice-item small {
      color: #ccc;
      display: block;
      margin-top: 10px;
    }

    .back-btn {
      display: inline-block;
      margin-top: 20px;
      padding: 12px 25px;
      border: none;
      border-radius: 30px;
      background-color: #ffcc00;
      color: #1a1a1a;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      text-decoration: none;
      box-shadow: 0 4px 8px rgba(0,0,0,0.3);
    }

    .back-btn:hover {
      background-color: #e6b800;
      color: #fff;
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(0,0,0,0.4);
    }

    @media screen and (max-width: 600px) {
      .notice-container {
        width: 90%;
        padding: 25px 15px;
      }
      .notice-container h2 {
        font-size: 24px;
      }
    }
  </style>
</head>
<body>

  <%@ include file="all_component/home_navbar.jsp" %>

  <div class="main-content">
    <div class="notice-container">
      <h2>📢 Notice Board</h2>

      <%
        NoticeDAO dao = new NoticeDAO();
        List<Notice> list = dao.getAllNotices();

        if (list.isEmpty()) {
      %>
          <p style="color:#ccc;">No notices available yet.</p>
      <%
        } else {
          for (Notice n : list) {
      %>
          <div class="notice-item">
            <p><%= n.getNoticeText() %></p>
            <small>Published on: <%= n.getPostedAt() %></small>
          </div>
      <%
          }
        }

        // ✅ Role-based back page logic
        String role1 = (String) session.getAttribute("role");
        String backPage = "#";
        if ("admin".equalsIgnoreCase(role1)) {
            backPage = "admin_home.jsp";
        } else if ("teacher".equalsIgnoreCase(role1)) {
            backPage = "teacher_home.jsp";
        } else if ("student".equalsIgnoreCase(role1)) {
            backPage = "student_home.jsp";
        }
      %>

      <!-- Back button placed outside scriptlet -->
      <a href="<%= backPage %>" class="back-btn">← Back</a>

    </div>
  </div>

  <%@ include file="all_component/footer.jsp" %>
</body>
</html>
