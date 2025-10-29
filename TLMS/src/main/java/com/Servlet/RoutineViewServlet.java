package com.Servlet;

import com.DAO.RoutineDAO;
import com.Db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/RoutineViewServlet")
public class RoutineViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // *** FIX: Added doGet method to handle form submission (which defaults to GET) ***
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect the GET request to the doPost method to process the criteria.
        doPost(request, response);
    }
    // *********************************************************************************
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Connection conn = null;

        // 1️⃣ Get parameters from form
        String deptName = request.getParameter("dept_name");
        String academicYear = request.getParameter("academic_year");
        String section = request.getParameter("section");
        String semesterStr = request.getParameter("semester");

        // 2️⃣ Validate semester parameter
        int semester;
        if (semesterStr == null || semesterStr.trim().isEmpty()) {
            session.setAttribute("error-msg", "Please select a valid semester.");
            response.sendRedirect("admin_routine_view.jsp");
            return;
        }

        try {
            semester = Integer.parseInt(semesterStr);
        } catch (NumberFormatException e) {
            session.setAttribute("error-msg", "Invalid semester format. Please enter a number.");
            response.sendRedirect("admin_routine_view.jsp");
            return;
        }

        try {
            // 3️⃣ Connect to DB
            conn = DBConnect.getConn();
            RoutineDAO dao = new RoutineDAO(conn);

            // 4️⃣ Fetch routine file path
            String filePath = dao.getRoutineFilePath(deptName, academicYear, semester, section);

            if (filePath != null && !filePath.trim().isEmpty()) {
                // 5️⃣ Redirect to the file (ensures file path works across all environments)
                // Note: The file path must be relative to the webapp folder.
                String fullPath = request.getContextPath() + "/" + filePath;
                response.sendRedirect(fullPath);

            } else {
                // 6️⃣ Routine not found
                session.setAttribute("error-msg", "No routine found for the selected criteria.");
                response.sendRedirect("admin_routine_view.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error-msg", "An unexpected error occurred.");
            response.sendRedirect("admin_routine_view.jsp");

        } finally {
            // 7️⃣ Always close connection
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
