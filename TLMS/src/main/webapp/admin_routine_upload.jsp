<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Routine</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        /* General Page Styles */
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
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .upload-container {
            background-color: #1a1a1a;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.5);
            width: 650px;
            max-width: 95%;
        }

        .upload-container h2 {
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: bold;
            color: #ffcc00;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #ddd;
        }

        input[type="text"], select {
            width: 100%;
            padding: 12px;
            border: 2px solid #333;
            border-radius: 10px;
            font-size: 16px;
            background-color: #2a2a2a;
            color: #fff;
            transition: border 0.3s ease;
            /* Hide default select arrow */
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }
        
        /* Custom file input styling */
        input[type="file"] {
            display: block;
            width: 100%;
            background-color: #2a2a2a;
            border: 2px dashed #ffcc0055;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
            color: #ffcc00;
            font-size: 16px;
        }

        input[type="file"]::-webkit-file-upload-button {
            visibility: hidden;
            width: 0;
            height: 0;
            padding: 0;
            margin: 0;
        }
        
        input[type="file"]::before {
            content: 'Select Routine File (PDF)';
            display: inline-block;
            background: #ffcc00;
            border-radius: 6px;
            padding: 8px 15px;
            outline: none;
            white-space: nowrap;
            -webkit-user-select: none;
            cursor: pointer;
            font-weight: 700;
            color: #1a1a1a;
            margin-right: 10px;
        }

        input[type="text"]:focus, select:focus {
            outline: none;
            border: 2px solid #ffcc00;
            background-color: #1f1f1f;
        }

        .submit-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background-color: #93C757;
            color: #1a1a1a;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .submit-btn:hover {
            background-color: #79a84d;
            transform: translateY(-2px);
        }

        /* Message Styling */
        .message-box {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 600;
            text-align: center;
        }
        .msg-success {
            background-color: #154c33;
            color: #93C757;
            border: 1px solid #93C757;
        }
        .msg-failure {
            background-color: #5c1818;
            color: #ff6b6b;
            border: 1px solid #ff6b6b;
        }
        
        .filter-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        
        @media (max-width: 768px) {
            .filter-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    
    <%-- Admin Navbar Inclusion --%>
    <%@ include file="/all_component/home_navbar.jsp" %>
    
    <div class="main-content">
        <div class="upload-container">
            <h2><i class="ri-upload-cloud-2-fill"></i> Upload/Update Course Routine</h2>
            
            <%
                // Scriptlet to handle success message (replaces JSTL c:if and c:remove)
                String successMsg = (String) session.getAttribute("routine-upload-success-msg");
                if (successMsg != null) {
            %>
                <div class="message-box msg-success">
                    <%= successMsg %>
                </div>
            <%
                    session.removeAttribute("routine-upload-success-msg");
                }
            %>

            <%
                // Scriptlet to handle failure message (replaces JSTL c:if and c:remove)
                String failedMsg = (String) session.getAttribute("routine-upload-failed-msg");
                if (failedMsg != null) {
            %>
                <div class="message-box msg-failure">
                    <%= failedMsg %>
                </div>
            <%
                    session.removeAttribute("routine-upload-failed-msg");
                }
            %>

            <form action="RoutineUploadServlet" method="post" enctype="multipart/form-data">
                
                <div class="filter-grid">
                    <div class="form-group">
                        <label for="dept">Department:</label>
                        <select name="dept_name" id="dept" required>
                            <option value="" disabled selected>Select Department</option>
                            <option value="Computer Science and Engineering">Computer Science and Engineering</option>
                            <option value="Mechanical Engineering">Mechanical Engineering</option>
                            <option value="Electrical Engineering">Electrical Engineering</option>
                            <option value="Electronics and Communication Engineering">ECE</option>
                            <!-- Add more departments -->
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="year">Year:</label>
                        <select name="academic_year" id="year" required>
                            <option value="" disabled selected>Select Year</option>
                            <option value="1st">1st Year</option>
                            <option value="2nd">2nd Year</option>
                            <option value="3rd">3rd Year</option>
                            <option value="4th">4th Year</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="semester">Semester:</label>
                        <select name="semester" id="semester" required>
                            <option value="" disabled selected>Select Semester</option>
                            <% 
                                // Scriptlet loop for semesters (replaces JSTL c:forEach)
                                for (int i = 1; i <= 8; i++) { 
                            %>
                                <option value="<%= i %>">Semester <%= i %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="section">Section:</label>
                        <select name="section" id="section" required>
                            <option value="" disabled selected>Select Section</option>
                            <option value="A">Section A</option>
                            <option value="B">Section B</option>
                            <option value="C">Section C</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="routineFile">Routine File (PDF Only):</label>
                    <input type="file" id="routineFile" name="routineFile" accept="application/pdf" required>
                </div>
                
                <button type="submit" class="submit-btn">Upload/Update Routine</button>

            </form>
        </div>
    </div>
    
    <%@ include file="/all_component/footer.jsp" %>
</body>
</html>