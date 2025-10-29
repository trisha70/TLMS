package com.Servlet;

import com.DAO.TeacherDAO;
import com.Db.DBConnect;
import com.User.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/updateTeacher")
public class EditTeacherServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("teacherId"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phoneNo");
        String gender = req.getParameter("gender");
        Date doj = Date.valueOf(req.getParameter("dateOfJoining"));
        int deptId = Integer.parseInt(req.getParameter("deptId"));
        int subId = Integer.parseInt(req.getParameter("subId"));

        Teacher t = new Teacher();
        t.setTeacherId(id);
        t.setName(name);
        t.setEmail(email);
        t.setPhoneNo(phone);
        t.setGender(gender);
        t.setDateOfJoining(doj);
        t.setDeptId(deptId);
        t.setSubId(subId);

        TeacherDAO dao = new TeacherDAO(DBConnect.getConn());
        boolean success = dao.updateTeacher(t);

        if (success) {
            req.getSession().setAttribute("succMsg", "Teacher updated successfully!");
        } else {
            req.getSession().setAttribute("errorMsg", "Failed to update teacher!");
        }

        resp.sendRedirect("deleteTeacher.jsp");
    }
}
