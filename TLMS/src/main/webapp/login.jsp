<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Lernix</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

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
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 40px 20px;
      width: 100%;
    }

    .login-container {
      background-color: #1a1a1a;
      padding: 40px 35px;
      border-radius: 15px;
      box-shadow: 0 12px 30px rgba(0,0,0,0.4);
      width: 450px;
      max-width: 90%;
      text-align: center;
      color: #fff;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      margin: 30px 0;
    }

    .login-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 18px 40px rgba(0, 0, 0, 0.6);
    }

    .login-container h2 {
      margin-bottom: 25px;
      font-size: 26px;
      font-weight: bold;
      color: #ffcc00;
    }

    .login-container form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .login-container select,
    .login-container input {
      width: 100%;
      padding: 12px 14px;
      border: 2px solid #333;
      border-radius: 10px;
      font-size: 16px;
      background-color: #2a2a2a;
      color: #fff;
      transition: border 0.3s ease, background 0.3s ease;
    }

    .login-container select:focus,
    .login-container input:focus {
      outline: none;
      border: 2px solid #ffcc00;
      background-color: #1f1f1f;
    }

    .login-container button {
      padding: 12px 0;
      border: none;
      border-radius: 30px;
      background-color: #ffcc00;
      color: #1a1a1a;
      font-size: 18px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
      margin-top: 10px;
    }

    .login-container button:hover {
      background-color: #e6b800;
      color: #fff;
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(0,0,0,0.3);
    }

    .register-link {
      margin-top: 20px;
      padding-top: 15px;
      border-top: 1px solid #333;
      color: #aaa;
      font-size: 15px;
    }

    .register-link a {
      color: #ffcc00;
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s ease;
    }

    .register-link a:hover {
      color: #e6b800;
      text-decoration: underline;
    }

    ::placeholder { color: #aaa; }

    @media screen and (max-width: 480px) {
      .main-content { padding: 20px 15px; }
      .login-container { width: 90%; padding: 30px 20px; margin: 20px 0; }
      .login-container h2 { font-size: 22px; margin-bottom: 20px; }
      .login-container button { font-size: 16px; padding: 10px 0; }
      .register-link { font-size: 14px; }
    }
  </style>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>

<%@ include file="all_component/login_navbar.jsp" %>

<div class="main-content">
  <div class="login-container">
    <h2>Login to Lernix <i class="ri-graduation-cap-fill"></i></h2>
    
    <%
    String logoutMsg = (String) session.getAttribute("logout-success");
    if (logoutMsg != null) {
%>
    <div style="color:blue; background:#dff0ff; padding:10px; border-radius:5px; margin-bottom:10px;">
        <%= logoutMsg %>
    </div>
<%
        session.removeAttribute("logout-success");
    }
%>
    

    <%-- ✅ Session messages --%>
    <%
        String successMsg = (String) session.getAttribute("login-success");
        String errorMsg = (String) session.getAttribute("login-failed");
    %>

    <% if (successMsg != null) { %>
      <div style="color: #00ff7f; background-color: #1a1a1a; border: 2px solid #00ff7f;
                  border-radius: 10px; padding: 10px; margin-bottom: 15px;">
          <%= successMsg %>
      </div>
      <% session.removeAttribute("login-success"); %>
    <% } else if (errorMsg != null) { %>
      <div style="color: #ff4d4d; background-color: #1a1a1a; border: 2px solid #ff4d4d;
                  border-radius: 10px; padding: 10px; margin-bottom: 15px;">
          <%= errorMsg %>
      </div>
      <% session.removeAttribute("login-failed"); %>
    <% } %>

    <form action="LoginServlet" method="post">
      <select name="role" required>
        <option value="" disabled selected>Select Role</option>
        <option value="student">Student</option>
        <option value="teacher">Teacher</option>
        <option value="admin">Admin</option>
      </select>
      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>

    <div class="register-link">
      New user? <a href="register.jsp">Register here</a>
    </div>
  </div>
</div>

<%@ include file="all_component/footer.jsp" %>

<script>
  // Auto-hide messages after 3 seconds
  setTimeout(() => {
    const msg = document.querySelector(".login-container div[style*='padding']");
    if (msg) msg.style.display = 'none';
  }, 3000);
</script>

</body>
</html>
