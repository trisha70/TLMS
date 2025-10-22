<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
    NOTE: All JSTL tags have been removed and replaced with pure Java scriptlets 
    to bypass the "Cannot find the tag library descriptor" error.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Routine</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        /* Shared Styling for User Pages */
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
        }

        .filter-form > div {
            flex: 1;
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

        /* Routine Display Area */
        .routine-display {
            width: 100%;
            margin-top: 20px;
            background-color: #2a2a2a;
            border-radius: 15px;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5);
            min-height: 400px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            overflow: hidden;
        }
        
        .routine-display p {
            color: #aaa;
        }

        .routine-viewer {
            width: 100%;
            height: 100%;
            border: none;
        }

        /* Message Styling */
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
    
    <%-- Navbar include (You must ensure /all_component/navbar.jsp is JSTL-free as well) --%>
    <%@ include file="/all_component/navbar.jsp" %>
    
    <div class="main-content">
        
        <div class="view-container">
            <h2><i class="ri-calendar-check-fill"></i> Select Criteria to View Routine</h2>
            
            <%
                // Scriptlet to handle failure message (replaces c:if and c:remove)
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
            
            <%
                // Scriptlets to retrieve selected values (replaces requestScope/EL)
                String selectedDept = (String) request.getAttribute("selectedDept");
                String selectedYear = (String) request.getAttribute("selectedYear");
                String selectedSem = (String) request.getAttribute("selectedSem");
                String selectedSection = (String) request.getAttribute("selectedSection");
                String routineFilePath = (String) request.getAttribute("routineFilePath");
            %>

            <form action="RoutineViewServlet" method="get" class="filter-form">
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Department:</label>
                    <select name="dept_name" id="dept" required>
                        <option value="" disabled <% if (selectedDept == null) out.print("selected"); %>>Select Department</option>
                        <option value="Computer Science and Engineering" <% if ("Computer Science and Engineering".equals(selectedDept)) out.print("selected"); %>>Computer Science and Engineering</option>
                        <option value="Mechanical Engineering" <% if ("Mechanical Engineering".equals(selectedDept)) out.print("selected"); %>>Mechanical Engineering</option>
                        <option value="Electrical Engineering" <% if ("Electrical Engineering".equals(selectedDept)) out.print("selected"); %>>Electrical Engineering</option>
                        <option value="Electronics and Communication Engineering" <% if ("Electronics and Communication Engineering".equals(selectedDept)) out.print("selected"); %>>ECE</option>
                        </select>
                </div>
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Year:</label>
                    <select name="academic_year" id="year" required>
                        <option value="" disabled <% if (selectedYear == null) out.print("selected"); %>>Select Year</option>
                        <option value="1st" <% if ("1st".equals(selectedYear)) out.print("selected"); %>>1st Year</option>
                        <option value="2nd" <% if ("2nd".equals(selectedYear)) out.print("selected"); %>>2nd Year</option>
                        <option value="3rd" <% if ("3rd".equals(selectedYear)) out.print("selected"); %>>3rd Year</option>
                        <option value="4th" <% if ("4th".equals(selectedYear)) out.print("selected"); %>>4th Year</option>
                    </select>
                </div>
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Semester:</label>
                    <select name="semester" id="semester" required>
                        <option value="" disabled <% if (selectedSem == null) out.print("selected"); %>>Select Semester</option>
                        <% 
                            // Loop for semesters (replaces c:forEach)
                            for (int i = 1; i <= 8; i++) { 
                                String semValue = String.valueOf(i);
                        %>
                            <option value="<%= semValue %>" <% if (semValue.equals(selectedSem)) out.print("selected"); %>>Semester <%= i %></option>
                        <% } %>
                    </select>
                </div>
                
                <div>
                    <label style="display:block; margin-bottom: 5px;">Section:</label>
                    <select name="section" id="section" required>
                        <option value="" disabled <% if (selectedSection == null) out.print("selected"); %>>Select Section</option>
                        <option value="A" <% if ("A".equals(selectedSection)) out.print("selected"); %>>Section A</option>
                        <option value="B" <% if ("B".equals(selectedSection)) out.print("selected"); %>>Section B</option>
                        <option value="C" <% if ("C".equals(selectedSection)) out.print("selected"); %>>Section C</option>
                    </select>
                </div>

                <div style="flex: 0.5;">
                    <button type="submit">View Routine</button>
                </div>

            </form>
        </div>
        
        <div class="view-container routine-display">
            <%
                // Conditional display (replaces c:choose/c:when/c:otherwise)
                if (routineFilePath != null && !routineFilePath.isEmpty()) {
            %>
                <iframe src="<%= routineFilePath %>" class="routine-viewer"></iframe>
            <%
                } else {
            %>
                <p>Select the department, year, semester, and section above, then click 'View Routine' to display the schedule.</p>
            <%
                }
            %>
        </div>
        
    </div>
    
    <%@ include file="/all_component/footer.jsp" %>
    
</body>
</html>