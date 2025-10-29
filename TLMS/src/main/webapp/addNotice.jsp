<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.DAO.NoticeDAO,com.User.Notice" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Notice - Lernix Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">

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
      width: 100%;
    }

    .notice-container {
      background-color: #1a1a1a;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.4);
      width: 650px;
      max-width: 95%;
      color: #fff;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .notice-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 18px 40px rgba(0, 0, 0, 0.6);
    }

    .notice-container h2 {
      font-size: 28px;
      margin-bottom: 20px;
      font-weight: bold;
      color: #ffcc00;
    }

    textarea {
      width: 100%;
      height: 120px;
      border: 2px solid #333;
      border-radius: 12px;
      background-color: #2a2a2a;
      color: #fff;
      padding: 15px;
      font-size: 16px;
      resize: none;
      transition: border 0.3s ease;
    }

    textarea:focus {
      outline: none;
      border: 2px solid #ffcc00;
    }

    .btn-group {
      display: flex;
      justify-content: space-between;
      gap: 10px;
      margin-top: 20px;
    }

    button {
      flex: 1;
      padding: 14px;
      border: none;
      border-radius: 30px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    .publish-btn {
      background-color: #ffcc00;
      color: #1a1a1a;
    }

    .publish-btn:hover {
      background-color: #e6b800;
      color: #fff;
      transform: translateY(-2px);
    }

    .back-btn {
      background-color: #333;
      color: #fff;
    }

    .back-btn:hover {
      background-color: #444;
      transform: translateY(-2px);
    }

    hr {
      border: 1px solid #333;
      margin: 25px 0;
    }

    .msg {
      background-color: #1a1a1a;
      border: 2px solid #ffcc00;
      color: #ffcc00;
      border-radius: 10px;
      padding: 10px;
      margin-bottom: 20px;
      font-weight: bold;
    }

    .notice-list {
      max-height: 350px;
      overflow-y: auto;
      text-align: left;
    }

    .notice-item {
      background-color: #2a2a2a;
      padding: 15px 15px 10px;
      border-radius: 10px;
      margin-bottom: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.3);
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      gap: 10px;
    }

    .notice-text {
      flex: 1;
    }

    .notice-text p {
      color: #fff;
      font-size: 16px;
      margin-bottom: 5px;
    }

    .notice-text small {
      color: #ccc;
      font-size: 13px;
    }

    .delete-btn {
      background: transparent;
      border: none;
      color: #ff4444;
      font-size: 20px;
      cursor: pointer;
      transition: color 0.3s ease, transform 0.3s ease;
    }

    .delete-btn:hover {
      color: #ff0000;
      transform: scale(1.2);
    }

    @media screen and (max-width: 600px) {
      .notice-container {
        width: 90%;
        padding: 25px;
      }
      textarea {
        height: 100px;
      }
    }
  </style>
</head>

<body>
  <jsp:include page="/all_component/home_navbar.jsp" />

  <div class="main-content">
    <div class="notice-container">
      <h2>📢 Publish New Notice</h2>

      <!-- ✅ Success / Failure Message -->
      <%
          String msg = (String) session.getAttribute("msg");
          if (msg != null) {
      %>
          <div class="msg"><%= msg %></div>
      <%
              session.removeAttribute("msg");
          }
      %>

      <!-- ✅ Add Notice Form -->
      <form action="addNotice" method="post">
        <textarea name="noticeText" placeholder="Write your notice here..." required></textarea>
        <div class="btn-group">
          <button type="submit" class="publish-btn"><i class="ri-upload-cloud-2-line"></i> Publish</button>
          <button type="button" class="back-btn" onclick="window.location.href='admin_home.jsp'">
            <i class="ri-arrow-left-line"></i> Back
          </button>
        </div>
      </form>

      <hr>

      <h3 style="color:#ffcc00;">Previous Notices</h3>
      <div class="notice-list">
        <%
            NoticeDAO dao = new NoticeDAO();
            List<Notice> list = dao.getAllNotices();
            if (list.isEmpty()) {
        %>
            <p style="color:#aaa; text-align:center;">No notices published yet.</p>
        <%
            } else {
                for (Notice n : list) {
        %>
            <div class="notice-item">
              <div class="notice-text">
                <p><%= n.getNoticeText() %></p>
                <small><i class="ri-time-line"></i> Published on: <%= n.getPostedAt() %></small>
              </div>

              <!-- ✅ Delete Notice -->
              <form action="deleteNotice" method="post" onsubmit="return confirm('Are you sure you want to delete this notice?');">
                <input type="hidden" name="id" value="<%= n.getId() %>">
                <button type="submit" class="delete-btn" title="Delete Notice">
                  <i class="ri-delete-bin-6-line"></i>
                </button>
              </form>
            </div>
        <%
                }
            }
        %>
      </div>
    </div>
  </div>

  <jsp:include page="/all_component/footer.jsp" />

  <script>
    setTimeout(() => {
      const msg = document.querySelector('.msg');
      if (msg) msg.style.display = 'none';
    }, 3000);
  </script>
</body>
</html>
