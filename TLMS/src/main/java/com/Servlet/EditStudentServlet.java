package com.Servlet;

import com.DAO.StudentDAO;
import com.Db.DBConnect;
import com.User.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateStudent")
public class EditStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("studentId"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNo");
        String gender = req.getParameter("gender");
        int semester = Integer.parseInt(req.getParameter("semester"));
        String section = req.getParameter("section");
        double attendance = Double.parseDouble(req.getParameter("attendance"));
        int deptId = Integer.parseInt(req.getParameter("deptId"));

        Student s = new Student();
        s.setStudentId(id);
        s.setName(name);
        s.setEmail(email);
        s.setPhoneNo(phone);
        s.setGender(gender);
        s.setSemester(semester);
        s.setSection(section);
        s.setAttendance(attendance);
        s.setDeptId(deptId);

        StudentDAO dao = new StudentDAO(DBConnect.getConn());
        boolean updated = dao.updateStudent(s);

        HttpSession session = req.getSession();
        if (updated) {
            session.setAttribute("succMsg", "Student updated successfully!");
        } else {
            session.setAttribute("errorMsg", "Failed to update student!");
        }

        resp.sendRedirect("deleteStudent.jsp");
    }
}
