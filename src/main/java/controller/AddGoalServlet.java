package controller;

import java.io.IOException;

import dao.GoalDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Goal;
import model.User;

@WebServlet("/AddGoalServlet")
public class AddGoalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AddGoalServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        String goalName = request.getParameter("goalName");
        String targetValue = request.getParameter("targetValue");

        Goal goal = new Goal();
        goal.setUserId(user.getUserId());
        goal.setGoalName(goalName);
        goal.setTargetValue(targetValue);
        goal.setStatus("Pending");

        GoalDAO dao = new GoalDAO();

        boolean success = dao.addGoal(goal);

        if (success) {
            response.sendRedirect("goal.jsp");
        } else {
            request.setAttribute("error", "Failed to add goal.");
            request.getRequestDispatcher("goal.jsp").forward(request, response);
        }
    }
}