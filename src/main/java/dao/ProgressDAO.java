package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.ProgressData;
import util.DBConnection;

public class ProgressDAO {

    public ProgressData getProgressData(int userId) {

        ProgressData data = new ProgressData();

        try {

            Connection con = DBConnection.getConnection();

            // Latest Progress
            String progressSql =
                    "SELECT hours_used, score FROM progress WHERE user_id=? ORDER BY progress_date DESC LIMIT 1";

            PreparedStatement ps1 = con.prepareStatement(progressSql);
            ps1.setInt(1, userId);

            ResultSet rs1 = ps1.executeQuery();

            if(rs1.next()){

                data.setHoursUsed(rs1.getDouble("hours_used"));
                data.setScore(rs1.getInt("score"));

            }

            // Goal

            String goalSql =
                    "SELECT goal_name,status FROM goals WHERE user_id=? ORDER BY goal_id DESC LIMIT 1";

            PreparedStatement ps2 = con.prepareStatement(goalSql);

            ps2.setInt(1,userId);

            ResultSet rs2 = ps2.executeQuery();

            if(rs2.next()){

                data.setGoalName(rs2.getString("goal_name"));
                data.setGoalStatus(rs2.getString("status"));

            }

            // Target Hours

            String targetSql =
                    "SELECT target_hours FROM detox_plan WHERE user_id=? ORDER BY plan_id DESC LIMIT 1";

            PreparedStatement ps3 = con.prepareStatement(targetSql);

            ps3.setInt(1,userId);

            ResultSet rs3 = ps3.executeQuery();

            if(rs3.next()){

                data.setTargetHours(rs3.getDouble("target_hours"));

            }

            // Progress %

            if(data.getTargetHours()>0){

            	int percent = (int)(((data.getTargetHours() - data.getHoursUsed()) / data.getTargetHours()) * 100);

            	if(percent < 0)
            	    percent = 0;

            	if(percent > 100)
            	    percent = 100;

            	data.setProgressPercentage(percent);

            }

            con.close();

        } catch(Exception e){

            e.printStackTrace();

        }

        return data;

    }

}