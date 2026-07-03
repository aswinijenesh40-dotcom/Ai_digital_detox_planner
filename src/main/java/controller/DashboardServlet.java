package controller;

import java.io.IOException;

import dao.DashboardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.DashboardData;
import model.User;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();

        DashboardDAO dao = new DashboardDAO();
        DashboardData data = dao.getDashboardData(userId);

        request.setAttribute("dashboard", data);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}