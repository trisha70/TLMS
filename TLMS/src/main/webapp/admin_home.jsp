<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- NOTE: Removed JSTL (jakarta.tags.core) dependency to fix compilation errors --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <style>
        /* General page layout matching your theme */
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #2A7B9B, #93C757, #EDDD53);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
        }
        
        /* Main content alignment */
        .dashboard-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            width: 100%;
        }

        /* Dashboard Card Styling */
        .dashboard-card {
            background-color: #1a1a1a;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.5);
            width: 600px;
            max-width: 90%;
            text-align: center;
        }

        .dashboard-card h2 {
            margin-bottom: 30px;
            font-size: 32px;
            font-weight: bold;
            color: #ffcc00;
        }
        
        /* Grid layout for the buttons */
        .action-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        /* Styling for action buttons/links */
        .action-button {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 120px;
            padding: 20px;
            border-radius: 15px;
            text-decoration: none;
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            background-color: #333; /* Default dark color */
        }
        
        .action-button i {
            font-size: 40px;
            margin-bottom: 8px;
        }

        .action-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.3);
            background-color: #444;
        }

        /* Special styling for the Routine button */
        .routine-button {
            background-color: #ffcc00; /* Yellow accent color */
            color: #1a1a1a; /* Dark text on yellow */
        }
        
        .routine-button i {
            color: #1a1a1a;
        }

        .routine-button:hover {
            background-color: #e6b800;
            color: #1a1a1a;
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

    </style>
</head>
<body>
    
    <%-- Admin Navbar Inclusion --%>
    <%@ include file="/all_component/admin_navbar.jsp" %>
    
    <div class="dashboard-container">
        <div class="dashboard-card">
            
            <%
                // Scriptlet to handle success message (replaces c:if and c:remove)
                String successMsg = (String) session.getAttribute("login-success-msg");
                if (successMsg != null) {
            %>
                <div class="message-box msg-success">
                    <%= successMsg %>
                </div>
            <%
                    session.removeAttribute("login-success-msg");
                }
            %>

            <h2>Welcome Admin <i class="ri-user-2-fill"></i></h2>
            
            <div class="action-grid">
                
                <!-- 1. View Button (Top Left) -->
                <a href="#" class="action-button">
                    <i class="ri-eye-line"></i>
                    View
                </a>

                <!-- 2. Update Button (Top Right) -->
                <a href="#" class="action-button">
                    <i class="ri-pencil-line"></i>
                    Update
                </a>

                <!-- 3. Notice Button (Bottom Left) -->
                <a href="#" class="action-button">
                    <i class="ri-notification-3-line"></i>
                    Notice
                </a>

                <!-- 4. Routine Button (Bottom Right) -->
                <a href="admin_routine_upload.jsp" class="action-button routine-button">
                    <i class="ri-calendar-event-line"></i>
                    Routine
                </a>
            </div>
        </div>
    </div>
    
    <%@ include file="/all_component/footer.jsp" %>
</body>
</html>
