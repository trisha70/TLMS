<%@ page import="java.util.*,com.DAO.TeacherDAO,com.User.Teacher,com.Db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Teachers</title>
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
            text-shadow: 0 0 10px #00ff88;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #161b22;
            box-shadow: 0 0 15px rgba(0, 255, 136, 0.2);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background: #00ff88;
            color: #000;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background: #1f242d;
        }

        tr:hover {
            background: rgba(0, 255, 136, 0.1);
            transition: 0.3s;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            margin: 0 3px;
        }

        .delete-btn {
            background: #ff4c4c;
            color: white;
        }

        .delete-btn:hover {
            background: #ff1a1a;
            transform: scale(1.05);
        }

        .edit-btn {
            background: #0099ff;
            color: white;
        }

        .edit-btn:hover {
            background: #007acc;
            transform: scale(1.05);
        }

        .msg {
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .success {
            color: #00ff88;
        }

        .error {
            color: #ff4c4c;
        }
    </style>
</head>

<body>
    <h1>All Registered Teachers</h1>

    <div class="msg">
        <%
            String succMsg = (String) session.getAttribute("succMsg");
            String errorMsg = (String) session.getAttribute("errorMsg");
            if (succMsg != null) {
        %>
            <p class="success"><%= succMsg %></p>
        <%
                session.removeAttribute("succMsg");
            } else if (errorMsg != null) {
        %>
            <p class="error"><%= errorMsg %></p>
        <%
                session.removeAttribute("errorMsg");
            }
        %>
    </div>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>Date Of Joining</th>
            <th>Dept ID</th>
            <th>Sub ID</th>
            <th>Action</th>
        </tr>

        <%
            TeacherDAO dao = new TeacherDAO(DBConnect.getConn());
            List<Teacher> list = dao.getAllTeachers();
            if (list != null && !list.isEmpty()) {
                for (Teacher t : list) {
        %>
        <tr>
            <td><%= t.getTeacherId() %></td>
            <td><%= t.getName() %></td>
            <td><%= t.getEmail() %></td>
            <td><%= t.getPhoneNo() %></td>
            <td><%= t.getGender() %></td>
            <td><%= t.getDateOfJoining() %></td>
            <td><%= t.getDeptId() %></td>
            <td><%= t.getSubId() %></td>
            <td>
                <a href="edit_teacher.jsp?id=<%= t.getTeacherId() %>">
                    <button class="action-btn edit-btn">Edit</button>
                </a>
                <a href="deleteTeacher?id=<%= t.getTeacherId() %>" 
                   onclick="return confirm('Are you sure you want to delete this teacher?');">
                    <button class="action-btn delete-btn">Delete</button>
                </a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="10" style="color:#ff4c4c;">No teacher records found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
