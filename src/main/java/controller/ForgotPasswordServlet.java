package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();

        boolean result = dao.emailExists(email);

        if (result) {

            // Pass the email to the next page
            request.setAttribute("email", email);

            // Open reset password page
            request.getRequestDispatcher("resetPassword.jsp")
                   .forward(request, response);

        } else {

            response.getWriter().println(
                    "<h2>Email Not Registered</h2>");

        }

    }

}