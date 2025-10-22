package com.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.Date;

import com.DAO.TeacherLoginDAO;
import com.Db.DBConnect;
import com.User.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/TeacherRegister")
@MultipartConfig   // Enables handling of file upload
public class TeacherAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Change this path to any folder on your system where you want to store images
    private static final String UPLOAD_DIR = "C:\\Users\\trish\\Documents\\teacherImages";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phone_no");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String dojStr = request.getParameter("date_of_joining"); // YYYY-MM-DD

        // Department selection
        int deptId = 0;
        try {
            deptId = Integer.parseInt(request.getParameter("dept"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Convert Date
        Date dateOfJoining = null;
        if (dojStr != null && !dojStr.isEmpty()) {
            dateOfJoining = Date.valueOf(dojStr);
        }

        // Handle file upload
        Part filePart = request.getPart("photo");
        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName(); // unique name
            File uploads = new File(UPLOAD_DIR);
            if (!uploads.exists()) uploads.mkdirs(); // create folder if not exists
            File file = new File(uploads, fileName);

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath());
            }
        }

        // Create Teacher object
        Teacher teacher = new Teacher();
        teacher.setName(name);
        teacher.setEmail(email);
        teacher.setPhoneNo(phoneNo);
        teacher.setGender(gender);
        teacher.setPassword(password);
        teacher.setDateOfJoining(dateOfJoining);
        teacher.setDeptId(deptId);   // set selected department
        teacher.setSubId(0);          // default for now
        teacher.setPhoto("teacherImages/" + fileName); // store relative path

        // Save to DB
        Connection conn = DBConnect.getConn();
        TeacherLoginDAO dao = new TeacherLoginDAO(conn);
        boolean saved = dao.registerTeacher(teacher);

        // Session feedback
        HttpSession session = request.getSession();
        if (saved) {
            session.setAttribute("reg-success", "Teacher Registration Successful!");
        } else {
            session.setAttribute("failed-msg", "Oops! Something went wrong.");
        }

        response.sendRedirect("registerTeacher.jsp");
    }
}
