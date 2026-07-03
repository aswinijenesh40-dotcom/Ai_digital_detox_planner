package controller;

import java.io.IOException;
import java.sql.Date;

import dao.DetoxPlanDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DetoxPlan;
import model.User;

@WebServlet("/PlannerServlet")
public class PlannerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        double targetHours = Double.parseDouble(
                request.getParameter("targetHours"));

        Date startDate = Date.valueOf(
                request.getParameter("startDate"));

        Date endDate = Date.valueOf(
                request.getParameter("endDate"));

        DetoxPlan plan = new DetoxPlan();

        plan.setUserId(user.getUserId());
        plan.setTargetHours(targetHours);
        plan.setStartDate(startDate);
        plan.setEndDate(endDate);
        plan.setStatus("Pending");

        DetoxPlanDAO dao = new DetoxPlanDAO();

        boolean status = dao.savePlan(plan);

        if (status) {

            // Redirect to Screen Time page
            response.sendRedirect("ScreenTime.jsp");

        } else {

            request.setAttribute("error", "Unable to save plan.");
            request.getRequestDispatcher("planner.jsp")
                   .forward(request, response);
        }
    }
}