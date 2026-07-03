package controller;

import java.io.IOException;

import dao.ProgressDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ProgressData;
import model.User;

@WebServlet("/ProgressServlet")
public class ProgressServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        User user = (User) session.getAttribute("user");

        ProgressDAO dao = new ProgressDAO();

        ProgressData progressData = dao.getProgressData(user.getUserId());

        request.setAttribute("progressData", progressData);

        request.getRequestDispatcher("progress.jsp")
               .forward(request, response);

    }

}