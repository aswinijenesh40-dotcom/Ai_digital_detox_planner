package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        boolean status = dao.updatePassword(email, password);

        if (status) {

            response.getWriter().println(
                    "<h2>Password Updated Successfully</h2>"
                    + "<a href='login.jsp'>Login Now</a>");

        } else {

            response.getWriter().println(
                    "<h2>Password Update Failed</h2>");

        }

    }

}