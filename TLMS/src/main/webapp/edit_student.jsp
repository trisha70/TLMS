<%@ page import="com.DAO.StudentDAO,com.User.Student,com.Db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Student</title>
<style>
    body {
        background: #0d1117;
        color: white;
        font-family: 'Segoe UI', sans-serif;
        padding: 40px;
    }

    h1 {
        text-align: center;
        color: #00ff88;
        margin-bottom: 30px;
    }

    form {
        background: #161b22;
        padding: 25px;
        border-radius: 10px;
        width: 60%;
        margin: auto;
        box-shadow: 0 0 15px rgba(0,255,136,0.2);
    }

    label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
    }

    input, select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 6px;
        border: none;
        background: #1f242d;
        color: white;
    }

    button {
        margin-top: 20px;
        width: 100%;
        background: #00ff88;
        color: black;
        border: none;
        padding: 10px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background: #00cc70;
    }

    .top-bar {
        text-align: center;
        margin-bottom: 20px;
    }

    .home-btn {
        background: #00ff88;
        color: black;
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 8px;
        font-weight: bold;
    }

    .home-btn:hover {
        background: #00cc70;
    }
</style>
</head>
<body>

<div class="top-bar">
    <a href="admin_home.jsp" class="home-btn">🏠 Home</a>
</div>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    StudentDAO dao = new StudentDAO(DBConnect.getConn());
    Student s = dao.getStudentById(id);
%>

<h1>Edit Student</h1>

<form action="updateStudent" method="post">
    <input type="hidden" name="studentId" value="<%= s.getStudentId() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= s.getName() %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= s.getEmail() %>" required>

    <label>Phone No:</label>
    <input type="text" name="phoneNo" value="<%= s.getPhoneNo() %>" required>

    <label>Date of Birth:</label>
    <input type="date" name="dob" value="<%= s.getDob() %>" required>

    <label>Gender:</label>
    <input type="text" name="gender" value="<%= s.getGender() %>" required>

    <label>Attendance (%):</label>
    <input type="number" name="attendance" step="0.01" value="<%= s.getAttendance() %>" required>

    <label>Semester:</label>
    <input type="number" name="semester" value="<%= s.getSemester() %>" required>

    <label>Section:</label>
    <input type="text" name="section" value="<%= s.getSection() %>" required>
    
    <label>Dept Id:</label>
    <input type="number" name="deptId" value="<%= s.getDeptId() %>" required>

    <button type="submit">Update Student</button>
</form>

</body>
</html>
