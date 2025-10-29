package com.Servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Connection;
import java.util.UUID;

import com.DAO.StudentLoginDAO;
import com.Db.DBConnect;
import com.User.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/StudentRegister")
@MultipartConfig
public class StudentAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("mobile");
        String dobStr = request.getParameter("dob"); // "YYYY-MM-DD"
        String password = request.getParameter("password");
        String department = request.getParameter("department");
        String gender = request.getParameter("gender");

        // Convert DOB to java.sql.Date
        Date dob = null;
        if (dobStr != null && !dobStr.isEmpty()) {
            dob = Date.valueOf(dobStr);
        }

        // Map department string to dept_id
        int deptId = 0;
        switch (department.toLowerCase()) {
            case "cse": deptId = 1; break;
            case "IT" : deptId=2; break;
            case "ece": deptId = 3; break;
            case "eee": deptId = 4; break;
            case "mech": deptId = 5; break;
            case "civil": deptId = 6; break;
        }

        // 2️⃣ Handle file upload
        Part photoPart = request.getPart("photo");
        String photoFileName = null;
        if (photoPart != null && photoPart.getSize() > 0) {
            String originalFileName = new File(photoPart.getSubmittedFileName()).getName();
            String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            
            // Generate unique file name to avoid duplicates
            photoFileName = UUID.randomUUID().toString() + extension;

            // Permanent folder in Documents
            String uploadPath = System.getProperty("user.home") + File.separator + "Documents" + File.separator + "studentImages";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save the file
            photoPart.write(uploadPath + File.separator + photoFileName);
        }

        // 3️⃣ Create Student object
        Student s = new Student();
        s.setName(name);
        s.setEmail(email);
        s.setPhoneNo(phoneNo);
        s.setDob(dob);
        s.setPassword(password);
        s.setGender(gender);
        s.setDeptId(deptId);
        s.setSemester(1);
        s.setAttendance(0.0);
        s.setSection(null);
        s.setPhoto("studentImages/" + photoFileName); // relative path for DB

        // 4️⃣ DAO call
        Connection conn = DBConnect.getConn();
        StudentLoginDAO dao = new StudentLoginDAO(conn);
        boolean f = dao.registerStudent(s);

        // 5️⃣ Session feedback
        HttpSession session = request.getSession();
        if (f) {
            session.setAttribute("reg-success", "Registration Successful!");
        } else {
            session.setAttribute("failed-msg", "Oops! Something went wrong.");
        }

        // Redirect
        response.sendRedirect("register.jsp");
    }
}
