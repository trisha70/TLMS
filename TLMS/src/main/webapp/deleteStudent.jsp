<%@ page import="java.util.*,com.DAO.StudentDAO,com.User.Student,com.Db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
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
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
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
            background: #00bfff;
            color: white;
            margin-right: 5px;
        }
        .edit-btn:hover {
            background: #0088cc;
            transform: scale(1.05);
        }
        .msg {
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
        }
        .success { color: #00ff88; }
        .error { color: #ff4c4c; }
    </style>
</head>

<body>
    <h1>Manage Students</h1>

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
            <th>DOB</th>
            <th>Gender</th>
            <th>Attendance</th>
            <th>Semester</th>
            <th>Section</th>
            <th>Dept ID</th>
            <th>Action</th>
        </tr>

        <%
            StudentDAO dao = new StudentDAO(DBConnect.getConn());
            List<Student> list = dao.getAllStudents();
            if (list != null && !list.isEmpty()) {
                for (Student s : list) {
        %>
        <tr>
            <td><%= s.getStudentId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getPhoneNo() %></td>
            <td><%= s.getDob() %></td>
            <td><%= s.getGender() %></td>
            <td><%= s.getAttendance() %></td>
            <td><%= s.getSemester() %></td>
            <td><%= s.getSection() %></td>
            <td><%= s.getDeptId() %></td>
            <td>
                <a href="edit_student.jsp?id=<%= s.getStudentId() %>">
                    <button class="btn edit-btn">Edit</button>
                </a>
                <a href="deleteStudent?id=<%= s.getStudentId() %>"
                   onclick="return confirm('Are you sure you want to delete this student?');">
                    <button class="btn delete-btn">Delete</button>
                </a>
            </td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="11" style="color:#ff4c4c;">No student records found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
