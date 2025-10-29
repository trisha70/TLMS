package com.Servlet;

import com.DAO.StudentDAO;
import com.Db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(req.getParameter("id"));
        StudentDAO dao = new StudentDAO(DBConnect.getConn());
        boolean success = dao.deleteStudent(studentId);

        if (success) {
            req.getSession().setAttribute("succMsg", "Student deleted successfully!");
        } else {
            req.getSession().setAttribute("errorMsg", "Failed to delete student.");
        }

        resp.sendRedirect("deleteStudent.jsp");
    }
}
