package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Goal;
import util.DBConnection;

public class GoalDAO {

    private Connection con;

    public GoalDAO() {
        try {
            con = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Add Goal
    public boolean addGoal(Goal goal) {

        boolean rowInserted = false;

        try {

            String sql = "INSERT INTO goals(user_id, goal_name, target_value, status) VALUES(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, goal.getUserId());
            ps.setString(2, goal.getGoalName());
            ps.setString(3, goal.getTargetValue());
            ps.setString(4, goal.getStatus());

            rowInserted = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowInserted;
    }

    // View Goals by User
    public List<Goal> getGoalsByUser(int userId) {

        List<Goal> list = new ArrayList<>();

        try {

            String sql = "SELECT * FROM goals WHERE user_id=? ORDER BY goal_id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Goal goal = new Goal();

                goal.setGoalId(rs.getInt("goal_id"));
                goal.setUserId(rs.getInt("user_id"));
                goal.setGoalName(rs.getString("goal_name"));
                goal.setTargetValue(rs.getString("target_value"));
                goal.setStatus(rs.getString("status"));

                list.add(goal);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Update Goal Status
    public boolean updateGoalStatus(int goalId, String status) {

        boolean updated = false;

        try {

            String sql = "UPDATE goals SET status=? WHERE goal_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setInt(2, goalId);

            updated = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

    // Delete Goal
    public boolean deleteGoal(int goalId) {

        boolean deleted = false;

        try {

            String sql = "DELETE FROM goals WHERE goal_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, goalId);

            deleted = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return deleted;
    }
}