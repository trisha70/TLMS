package com.Servlet;

import com.DAO.TeacherDAO;
import com.Db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteTeacher")
public class DeleteTeacherServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int teacherId = Integer.parseInt(req.getParameter("id"));
        TeacherDAO dao = new TeacherDAO(DBConnect.getConn());
        boolean success = dao.deleteTeacher(teacherId);

        if (success) {
            req.getSession().setAttribute("succMsg", "Teacher deleted successfully!");
        } else {
            req.getSession().setAttribute("errorMsg", "Failed to delete teacher.");
        }

        resp.sendRedirect("deleteTeacher.jsp");
    }
}
