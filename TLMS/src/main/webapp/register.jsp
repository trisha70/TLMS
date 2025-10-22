<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - Lernix</title>
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
      padding: 0;
      margin: 0;
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

    .register-container {
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
    
    .register-container:hover {
      transform: translateY(-5px);
      box-shadow: 0 18px 40px rgba(0, 0, 0, 0.6);
    }

    .register-container h2 {
      margin-bottom: 25px;
      font-size: 28px;
      font-weight: bold;
      color: #ffcc00;
    }

    .register-container input,
    .register-container select {
      width: 100%;
      padding: 14px;
      margin: 10px 0;
      border: 2px solid #333;
      border-radius: 10px;
      font-size: 16px;
      background-color: #2a2a2a;
      color: #fff;
      transition: border 0.3s ease;
    }
    
    .register-container input:focus,
    .register-container select:focus {
      outline: none;
      border: 2px solid #ffcc00;
    }

    /* Stylish file upload */
    .file-upload {
      position: relative;
      width: 100%;
      margin: 10px 0;
    }

    .file-upload input[type="file"] {
      display: none;
    }

    .file-upload label {
      display: block;
      width: 100%;
      padding: 14px;
      background-color: #2a2a2a;
      border: 2px dashed #555;
      border-radius: 10px;
      font-size: 16px;
      color: #aaa;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .file-upload label:hover {
      border-color: #ffcc00;
      color: #ffcc00;
    }

    .file-upload span {
      display: inline-block;
    }

    .register-container button {
      width: 100%;
      padding: 14px;
      margin-top: 15px;
      border: none;
      border-radius: 30px;
      background-color: #ffcc00;
      color: #1a1a1a;
      font-size: 18px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    .register-container button:hover {
      background-color: #e6b800;
      color: #fff;
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(0,0,0,0.3);
    }

    .login-link {
      margin-top: 20px;
      padding-top: 15px;
      border-top: 1px solid #333;
      color: #aaa;
      font-size: 15px;
    }

    .login-link a {
      color: #ffcc00;
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s ease;
    }

    .login-link a:hover {
      color: #e6b800;
      text-decoration: underline;
    }

    ::placeholder {
      color: #aaa;
    }
    
    /* Change calendar icon (for Chrome, Edge, Safari) */
    .register-container input[type="date"]::-webkit-calendar-picker-indicator {
      filter: invert(100%) sepia(100%) saturate(500%) hue-rotate(20deg); 
      cursor: pointer;
    }

    /* Optional: On focus add yellow border */
    .register-container input[type="date"]:focus {
      border: 2px solid #ffcc00;
      outline: none;
    }
    
    @media screen and (max-width: 600px) {
      .main-content {
        padding: 20px 15px;
      }
      
      .register-container {
        width: 90%;
        padding: 30px 20px;
        margin: 20px 0;
      }

      .register-container h2 {
        font-size: 24px;
        margin-bottom: 20px;
      }

      .register-container button {
        font-size: 16px;
        padding: 12px 0;
      }

      .login-link {
        font-size: 14px;
      }
    }
  </style>
  <!-- Include Remix Icon for the graduation cap icon -->
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
   <%@ include file="all_component/login_navbar.jsp" %>
   
   <div class="main-content">
     <div class="register-container">
       <h2>Create Account In Lernix <i class="ri-graduation-cap-fill"></i></h2>
       
       <%
    String successMsg = (String) session.getAttribute("reg-success");
    String errorMsg = (String) session.getAttribute("failed-msg");
%>

<% if (successMsg != null) { %>
    <div style="color: #00ff7f; background-color: #1a1a1a; border: 2px solid #00ff7f; 
                border-radius: 10px; padding: 10px; margin-bottom: 15px;">
        <%= successMsg %>
    </div>
    <% session.removeAttribute("reg-success"); %>
<% } else if (errorMsg != null) { %>
    <div style="color: #ff4d4d; background-color: #1a1a1a; border: 2px solid #ff4d4d;
                border-radius: 10px; padding: 10px; margin-bottom: 15px;">
        <%= errorMsg %>
    </div>
    <% session.removeAttribute("failed-msg"); %>
<% } %>
       
       
       <form action="StudentRegister" method="post"  enctype="multipart/form-data">
         <input type="text" name="name" placeholder="Full Name" required>
         <input type="email" name="email" placeholder="Email" required>
         <input type="tel" name="mobile" placeholder="Mobile No." pattern="[0-9]{10}" required>
         <input type="date" name="dob" required>
         <input type="password" name="password" placeholder="Password" required>

         <select name="department" required>
           <option value="" disabled selected>Select Department</option>
           <option value="cse">CSE</option>
           <option value="ece">ECE</option>
           <option value="eee">EEE</option>
           <option value="mech">Mechanical</option>
           <option value="civil">Civil</option>
         </select>

         <select name="gender" required>
           <option value="" disabled selected>Select Gender</option>
           <option value="male">Male</option>
           <option value="female">Female</option>
           <option value="other">Other</option>
         </select>

         <!-- Stylish file upload -->
         <div class="file-upload">
           <input type="file" name="photo" id="photo" accept="image/*"  required>
           <label for="photo"><span id="fileName">📷 Upload Photo</span></label>
         </div>

         <button type="submit">Register</button>
       </form>
       
       <div class="login-link">
         Already have an account? <a href="login.jsp">Sign in here</a>
       </div>
     </div>
   </div>

   <%@ include file="all_component/footer.jsp" %>

  <script>
    // Show selected file name instead of placeholder text
    const fileInput = document.getElementById('photo');
    const fileName = document.getElementById('fileName');

    fileInput.addEventListener('change', function() {
      if (this.files && this.files.length > 0) {
        fileName.textContent = "✅ " + this.files[0].name;
      } else {
        fileName.textContent = "📷 Upload Photo";
      }
    });
    setTimeout(() => {
        const msg = document.querySelector(".register-container div[style*='padding']");
        if (msg) msg.style.display = 'none';
      }, 3000);
  </script>
</body>
</html>