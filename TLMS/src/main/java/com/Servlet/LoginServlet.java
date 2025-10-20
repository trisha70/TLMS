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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Trying Login: " + email + " / " + password + " as " + role);

        try (Connection con = DBConnect.getConn()) {

            String query = null;

            if ("student".equals(role)) {
                query = "SELECT * FROM student WHERE email=? AND password=?";
            } 
            else if ("teacher".equals(role)) {
                query = "SELECT * FROM teacher WHERE email=? AND password=?";
            } 
            else if ("admin".equals(role)) {
                if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", email);
                    session.setAttribute("role", "Admin");
                    response.sendRedirect("admin_home.jsp");
                    return;
                } else {
                    response.sendRedirect("login.jsp?error=Invalid Admin Credentials");
                    return;
                }
            }

            if (query == null) {
                response.sendRedirect("login.jsp?error=Invalid Role");
                return;
            }

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            System.out.println("Query: " + query + " | Email: " + email + " | Password: " + password);

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", email);
                session.setAttribute("role", role);

                if ("student".equals(role)) {
                    response.sendRedirect("student_home.jsp");
                } else if ("teacher".equals(role)) {
                    response.sendRedirect("teacher_home.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Server Error");
        }
    }
}
