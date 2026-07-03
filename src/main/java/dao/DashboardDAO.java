package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.DashboardData;
import util.DBConnection;

public class DashboardDAO {

    public DashboardData getDashboardData(int userId) {

        DashboardData data = new DashboardData();

        Connection con = null;

        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        PreparedStatement ps4 = null;
        PreparedStatement ps5 = null;

        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        ResultSet rs4 = null;
        ResultSet rs5 = null;

        try {
            con = DBConnection.getConnection();

            // ---------------- USER NAME ----------------
            String userSql = "SELECT name FROM users WHERE user_id=?";
            ps1 = con.prepareStatement(userSql);
            ps1.setInt(1, userId);
            rs1 = ps1.executeQuery();

            if (rs1.next()) {
                data.setUserName(rs1.getString("name"));
            }

            // ---------------- SCREEN TIME ----------------
            String screenSql = "SELECT total_hours FROM screen_time WHERE user_id=? ORDER BY usage_date DESC LIMIT 1";
            ps2 = con.prepareStatement(screenSql);
            ps2.setInt(1, userId);
            rs2 = ps2.executeQuery();

            if (rs2.next()) {
                data.setScreenTime(rs2.getDouble("total_hours"));
            } else {
                data.setScreenTime(0);
            }

            // ---------------- FOCUS SCORE ----------------
            String progressSql = "SELECT score FROM progress WHERE user_id=? ORDER BY progress_date DESC LIMIT 1";
            ps3 = con.prepareStatement(progressSql);
            ps3.setInt(1, userId);
            rs3 = ps3.executeQuery();

            if (rs3.next()) {
                data.setFocusScore(rs3.getInt("score"));
            } else {
                data.setFocusScore(0);
            }

            // ---------------- DETOX PLAN ----------------
            String planSql = "SELECT target_hours FROM detox_plan WHERE user_id=? ORDER BY plan_id DESC LIMIT 1";
            ps4 = con.prepareStatement(planSql);
            ps4.setInt(1, userId);
            rs4 = ps4.executeQuery();

            if (rs4.next()) {
                data.setTargetHours(rs4.getDouble("target_hours"));
            } else {
                data.setTargetHours(0);
            }

            // ---------------- GOAL ----------------
            String goalSql = "SELECT goal_name, status FROM goals WHERE user_id=? ORDER BY goal_id DESC LIMIT 1";
            ps5 = con.prepareStatement(goalSql);
            ps5.setInt(1, userId);
            rs5 = ps5.executeQuery();

            if (rs5.next()) {
                data.setGoalName(rs5.getString("goal_name"));
                data.setGoalStatus(rs5.getString("status"));
            } else {
                data.setGoalName("No Goal");
                data.setGoalStatus("Not Set");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try { if (rs1 != null) rs1.close(); } catch (Exception e) {}
            try { if (rs2 != null) rs2.close(); } catch (Exception e) {}
            try { if (rs3 != null) rs3.close(); } catch (Exception e) {}
            try { if (rs4 != null) rs4.close(); } catch (Exception e) {}
            try { if (rs5 != null) rs5.close(); } catch (Exception e) {}

            try { if (ps1 != null) ps1.close(); } catch (Exception e) {}
            try { if (ps2 != null) ps2.close(); } catch (Exception e) {}
            try { if (ps3 != null) ps3.close(); } catch (Exception e) {}
            try { if (ps4 != null) ps4.close(); } catch (Exception e) {}
            try { if (ps5 != null) ps5.close(); } catch (Exception e) {}

            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return data;
    }
}