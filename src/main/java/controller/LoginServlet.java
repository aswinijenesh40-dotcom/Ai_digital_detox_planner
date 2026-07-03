package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get login details
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Email and Password are required.");
            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);
            return;
        }

        // Check user in database
        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, password);

        if (user != null) {

            // Create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");

        } else {

            // Login failed
            request.setAttribute("error", "Invalid Email or Password");
            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Redirect GET requests to login page
        response.sendRedirect("login.jsp");
    }
}