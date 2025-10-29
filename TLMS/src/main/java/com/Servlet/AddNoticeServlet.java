package com.Servlet;

import com.DAO.NoticeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/addNotice")
public class AddNoticeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String text = req.getParameter("noticeText");
        NoticeDAO dao = new NoticeDAO();
        boolean success = dao.addNotice(text);

        HttpSession session = req.getSession();
        if (success) {
            session.setAttribute("msg", "Notice added successfully!");
        } else {
            session.setAttribute("msg", "Failed to add notice!");
        }
        resp.sendRedirect("addNotice.jsp");
    }
}
