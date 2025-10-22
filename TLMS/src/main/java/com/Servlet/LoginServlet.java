package com.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        try (Connection con = DBConnect.getConn()) {

            String query = null;

            // Determine SQL query based on role
            if ("student".equalsIgnoreCase(role)) {
                query = "SELECT * FROM student WHERE email=? AND password=?";
            } else if ("teacher".equalsIgnoreCase(role)) {
                query = "SELECT * FROM teacher WHERE email=? AND password=?";
            } else if ("admin".equalsIgnoreCase(role)) {
                // Admin credentials check
                if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
                    session.setAttribute("userEmail", email);
                    session.setAttribute("role", "Admin");
                    session.setAttribute("login-success", "Welcome Admin!");
                    response.sendRedirect("admin_home.jsp");
                    return;
                } else {
                    session.setAttribute("login-failed", "Invalid Admin Credentials!");
                    response.sendRedirect("login.jsp");
                    return;
                }
            }

            if (query == null) {
                session.setAttribute("login-failed", "Invalid Role Selected!");
                response.sendRedirect("login.jsp");
                return;
            }

            // Prepare SQL statement
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login
                session.setAttribute("userEmail", email);
                session.setAttribute("role", role);
                session.setAttribute("login-success", "Login Successful!");

                if ("student".equalsIgnoreCase(role)) {
                    response.sendRedirect("student_home.jsp");
                } else if ("teacher".equalsIgnoreCase(role)) {
                    response.sendRedirect("teacher_home.jsp");
                }
            } else {
                // Login failed
                session.setAttribute("login-failed", "Invalid Email or Password!");
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("login-failed", "Server Error. Please try again later!");
            response.sendRedirect("login.jsp");
        }
    }
}
