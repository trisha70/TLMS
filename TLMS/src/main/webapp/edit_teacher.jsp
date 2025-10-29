<%@ page import="com.DAO.TeacherDAO,com.User.Teacher,com.Db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Teacher</title>
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
    TeacherDAO dao = new TeacherDAO(DBConnect.getConn());
    Teacher t = dao.getTeacherById(id);
%>

<h1>Edit Teacher</h1>

<form action="updateTeacher" method="post">
    <input type="hidden" name="teacherId" value="<%= t.getTeacherId() %>">

    <label>Name:</label>
    <input type="text" name="name" value="<%= t.getName() %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= t.getEmail() %>" required>

    <label>Phone:</label>
    <input type="text" name="phoneNo" value="<%= t.getPhoneNo() %>" required>

    <label>Gender:</label>
    <input type="text" name="gender" value="<%= t.getGender() %>" required>

    <label>Date of Joining:</label>
    <input type="date" name="dateOfJoining" value="<%= t.getDateOfJoining() %>" required>

    <label>Dept ID:</label>
    <input type="number" name="deptId" value="<%= t.getDeptId() %>" required>

    <label>Sub ID:</label>
    <input type="number" name="subId" value="<%= t.getSubId() %>" required>

    <button type="submit">Update Teacher</button>
</form>

</body>
</html>
