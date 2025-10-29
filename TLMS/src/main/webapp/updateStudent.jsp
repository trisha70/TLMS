<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
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

        .update-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .update-card {
            background-color: #1a1a1a;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.5);
            width: 700px;
            max-width: 95%;
            text-align: center;
        }

        .update-card h2 {
            margin-bottom: 30px;
            font-size: 32px;
            font-weight: bold;
            color: #ffcc00;
        }

        .box-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }

        .box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 140px;
            border-radius: 15px;
            text-decoration: none;
            background-color: #333;
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .box i {
            font-size: 42px;
            margin-bottom: 8px;
        }

        .box:hover {
            transform: translateY(-6px);
            background-color: #444;
            box-shadow: 0 8px 15px rgba(0,0,0,0.3);
        }

        /* Add New */
        .add-box {
            background-color: #ffcc00;
            color: #1a1a1a;
        }

        .add-box i {
            color: #1a1a1a;
        }

        .add-box:hover {
            background-color: #e6b800;
        }

        /* Edit */
        .edit-box {
            background-color: #2A7B9B;
        }

        .edit-box:hover {
            background-color: #21657e;
        }

        /* Delete */
        .delete-box {
            background-color: #e74c3c;
        }

        .delete-box:hover {
            background-color: #c0392b;
        }

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

    <%@ include file="/all_component/home_navbar.jsp" %>

    <div class="update-container">
        <div class="update-card">

            <h2>Update Student <i class="ri-user-3-fill"></i></h2>

            <div class="box-grid">
                <!-- Add New Student -->
                <a href="register.jsp" class="box add-box">
                    <i class="ri-user-add-line"></i>
                    Add New
                </a>

                <!-- Edit Student -->
                <a href="deleteStudent.jsp" class="box edit-box">
                    <i class="ri-edit-box-line"></i>
                    Edit / Delete
                </a>
            </div>
        </div>
    </div>

    <%@ include file="/all_component/footer.jsp" %>

</body>
</html>
