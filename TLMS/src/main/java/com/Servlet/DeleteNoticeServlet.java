package com.Servlet;

import com.DAO.NoticeDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteNotice")
public class DeleteNoticeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        NoticeDAO dao = new NoticeDAO();
        boolean success = dao.deleteNoticeById(id);

        HttpSession session = req.getSession();
        if (success) {
            session.setAttribute("msg", "✅ Notice deleted successfully!");
        } else {
            session.setAttribute("msg", "❌ Failed to delete notice.");
        }
        resp.sendRedirect("addNotice.jsp");
    }
}
