package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.DetoxPlan;
import util.DBConnection;

public class DetoxPlanDAO {

    // Save Detox Plan
    public boolean savePlan(DetoxPlan plan) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO detox_plan(user_id,target_hours,start_date,end_date,status) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, plan.getUserId());
            ps.setDouble(2, plan.getTargetHours());
            ps.setDate(3, plan.getStartDate());
            ps.setDate(4, plan.getEndDate());
            ps.setString(5, plan.getStatus());

            int i = ps.executeUpdate();

            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get Detox Plan
    public DetoxPlan getPlan(int userId) {

        DetoxPlan plan = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM detox_plan WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                plan = new DetoxPlan();

                plan.setPlanId(rs.getInt("plan_id"));
                plan.setUserId(rs.getInt("user_id"));
                plan.setTargetHours(rs.getDouble("target_hours"));
                plan.setStartDate(rs.getDate("start_date"));
                plan.setEndDate(rs.getDate("end_date"));
                plan.setStatus(rs.getString("status"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return plan;
    }
}