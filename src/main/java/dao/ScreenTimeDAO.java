package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.ScreenTime;
import util.DBConnection;

public class ScreenTimeDAO {

    // Save Screen Time
    public boolean saveScreenTime(ScreenTime screenTime) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO screen_time(user_id, usage_date, total_hours, social_media_hours, gaming_hours, entertainment_hours) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, screenTime.getUserId());
            ps.setDate(2, screenTime.getUsageDate());
            ps.setDouble(3, screenTime.getTotalHours());
            ps.setDouble(4, screenTime.getSocialMediaHours());
            ps.setDouble(5, screenTime.getGamingHours());
            ps.setDouble(6, screenTime.getEntertainmentHours());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get Screen Time by User
    public ScreenTime getScreenTime(int userId) {

        ScreenTime screenTime = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM screen_time WHERE user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                screenTime = new ScreenTime();

                screenTime.setScreenTimeId(rs.getInt("screen_time_id"));
                screenTime.setUserId(rs.getInt("user_id"));
                screenTime.setUsageDate(rs.getDate("usage_date"));
                screenTime.setTotalHours(rs.getDouble("total_hours"));
                screenTime.setSocialMediaHours(rs.getDouble("social_media_hours"));
                screenTime.setGamingHours(rs.getDouble("gaming_hours"));
                screenTime.setEntertainmentHours(rs.getDouble("entertainment_hours"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return screenTime;
    }

}