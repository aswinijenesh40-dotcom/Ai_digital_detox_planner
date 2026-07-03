package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import dao.ScreenTimeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ScreenTime;
import model.User;

@WebServlet("/ScreenTimeServlet")
public class ScreenTimeServlet extends HttpServlet {

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

        Date usageDate = Date.valueOf(request.getParameter("usageDate"));

        double totalHours = Double.parseDouble(request.getParameter("totalHours"));
        double socialMediaHours = Double.parseDouble(request.getParameter("socialMediaHours"));
        double gamingHours = Double.parseDouble(request.getParameter("gamingHours"));
        double entertainmentHours = Double.parseDouble(request.getParameter("entertainmentHours"));

        ScreenTime screenTime = new ScreenTime();

        screenTime.setUserId(user.getUserId());
        screenTime.setUsageDate(usageDate);
        screenTime.setTotalHours(totalHours);
        screenTime.setSocialMediaHours(socialMediaHours);
        screenTime.setGamingHours(gamingHours);
        screenTime.setEntertainmentHours(entertainmentHours);

        ScreenTimeDAO dao = new ScreenTimeDAO();

        boolean status = dao.saveScreenTime(screenTime);

        if (status) {

            List<String> suggestions = new ArrayList<>();

            // Total Screen Time
            if (totalHours >= 8) {
                suggestions.add("Reduce your total screen time to less than 4 hours per day.");
                suggestions.add("Take a 15-minute break after every hour of screen usage.");
            } else if (totalHours >= 5) {
                suggestions.add("Try reducing your screen time by 1 hour every day.");
            } else {
                suggestions.add("Great job! Your screen time is within a healthy range.");
            }

            // Social Media
            if (socialMediaHours >= 3) {
                suggestions.add("Limit social media usage to 1 hour per day.");
            }

            // Gaming
            if (gamingHours >= 2) {
                suggestions.add("Reduce gaming time and spend more time on outdoor activities.");
            }

            // Entertainment
            if (entertainmentHours >= 2) {
                suggestions.add("Watch educational or productive content instead of binge watching.");
            }

            suggestions.add("Avoid using your phone one hour before bedtime.");
            suggestions.add("Read a book for at least 30 minutes daily.");
            suggestions.add("Practice meditation for 15 minutes every day.");
            suggestions.add("Spend more time with family and friends.");

            request.setAttribute("suggestions", suggestions);

            request.getRequestDispatcher("Suggestions.jsp")
                   .forward(request, response);

        } else {

            request.setAttribute("error", "Unable to save screen time.");
            request.getRequestDispatcher("ScreenTime.jsp")
                   .forward(request, response);
        }
    }
}