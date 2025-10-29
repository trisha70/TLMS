package com.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.DAO.NoticeDAO;

@WebServlet("/viewNotices")
public class ViewNoticeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        NoticeDAO dao = new NoticeDAO();
        req.setAttribute("notices", dao.getAllNotices());
        req.getRequestDispatcher("/notice/noticeBoard.jsp").forward(req, resp);
    }
}