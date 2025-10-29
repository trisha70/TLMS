<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Routine</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
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
            justify-content: flex-start;
            align-items: center;
            padding: 40px 20px;
            width: 100%;
        }

        .view-container {
            background-color: #1a1a1a;
            padding: 30px 35px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.4);
            width: 800px;
            max-width: 95%;
            margin-bottom: 25px;
        }
        
        .view-container h2 {
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: bold;
            color: #ffcc00;
            text-align: center;
        }

        .filter-form {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            align-items: flex-end;
            flex-wrap: wrap;
        }

        .filter-form > div {
            flex: 1;
            min-width: 180px;
        }

        select, button {
            width: 100%;
            padding: 10px 14px;
            border: 2px solid #333;
            border-radius: 10px;
            font-size: 16px;
            background-color: #2a2a2a;
            color: #fff;
            transition: border 0.3s ease;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }
        
        select:focus {
            outline: none;
            border: 2px solid #ffcc00;
            background-color: #1f1f1f;
        }

        button[type="submit"] {
            background-color: #93C757;
            color: #1a1a1a;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        button[type="submit"]:hover {
            background-color: #79a84d;
            transform: translateY(-2px);
        }

        .routine-display {
            width: 100%;
            margin-top: 20px;
            background-color: #2a2a2a;
            border-radius: 15px;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5);
            min-height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            overflow: hidden;
        }
        
        .routine-display p {
            color: #aaa;
        }

        .message-box {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            font-weight: 600;
            text-align: center;
        }

        .msg-failure {
            background-color: #5c1818;
            color: #ff6b6b;
            border: 1px solid #ff6b6b;
        }
    </style>
</head>
<body>
    
    <%@ include file="/all_component/home_navbar.jsp" %>
    
    <div class="main-content">
        
        <div class="view-container">
            <h2><i class="ri-calendar-check-fill"></i> Select Criteria to View Routine</h2>
            
            <%
                String failedMsg = (String) session.getAttribute("routine-view-failed-msg");
                if (failedMsg != null) {
            %>
                <div class="message-box msg-failure">
                    <%= failedMsg %>
                </div>
            <%
                    session.removeAttribute("routine-view-failed-msg");
                }
            %>

            <!-- Added target="_blank" to open in a new tab -->
            <form action="RoutineViewServlet" method="get" class="filter-form" target="_blank">
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Department:</label>
                    <select name="dept_name" id="dept" required>
                        <option value="" disabled selected>Select Department</option>
                        <option value="Computer Science and Engineering">Computer Science and Engineering</option>
                        <option value="Mechanical Engineering">Mechanical Engineering</option>
                        <option value="Electrical Engineering">Electrical Engineering</option>
                        <option value="Electronics and Communication Engineering">ECE</option>
                    </select>
                </div>
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Year:</label>
                    <select name="academic_year" id="year" required>
                        <option value="" disabled selected>Select Year</option>
                        <option value="1st">1st Year</option>
                        <option value="2nd">2nd Year</option>
                        <option value="3rd">3rd Year</option>
                        <option value="4th">4th Year</option>
                    </select>
                </div>
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Semester:</label>
                    <select name="semester" id="semester" required>
                        <option value="" disabled selected>Select Semester</option>
                        <% for (int i = 1; i <= 8; i++) { %>
                            <option value="<%= i %>">Semester <%= i %></option>
                        <% } %>
                    </select>
                </div>
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Section:</label>
                    <select name="section" id="section" required>
                        <option value="" disabled selected>Select Section</option>
                        <option value="A">Section A</option>
                        <option value="B">Section B</option>
                        <option value="C">Section C</option>
                    </select>
                </div>

                <div style="flex: 0.5;">
                    <button type="submit">View Routine</button>
                </div>
            </form>
        </div>
        
        <div class="view-container routine-display">
            <p>Select the department, year, semester, and section above, then click 'View Routine'. The routine will open in a new tab.</p>
        </div>
        
    </div>
    
    <%@ include file="/all_component/footer.jsp" %>
    
</body>
</html>