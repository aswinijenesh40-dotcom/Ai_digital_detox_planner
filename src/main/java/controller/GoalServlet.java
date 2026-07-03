package controller;

import java.io.IOException;

import dao.GoalDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Goal;
import model.User;

@WebServlet("/GoalServlet")
public class GoalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private GoalDAO goalDAO;

    @Override
    public void init() throws ServletException {
        goalDAO = new GoalDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            String goalName = request.getParameter("goalName");
            String targetValue = request.getParameter("targetValue");

            Goal goal = new Goal();
            goal.setUserId(user.getUserId());
            goal.setGoalName(goalName);
            goal.setTargetValue(targetValue);
            goal.setStatus("Pending");

            goalDAO.addGoal(goal);

            response.sendRedirect("goal.jsp");
        }

        else if ("update".equals(action)) {

            int goalId = Integer.parseInt(request.getParameter("goalId"));
            String status = request.getParameter("status");

            goalDAO.updateGoalStatus(goalId, status);

            response.sendRedirect("goal.jsp");
        }

        else if ("delete".equals(action)) {

            int goalId = Integer.parseInt(request.getParameter("goalId"));

            goalDAO.deleteGoal(goalId);

            response.sendRedirect("goal.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
}