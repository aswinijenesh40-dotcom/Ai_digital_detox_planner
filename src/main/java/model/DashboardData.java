package model;

public class DashboardData {

    private String userName;
    private double screenTime;
    private int focusScore;
    private double targetHours;
    private String goalName;
    private String goalStatus;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public double getScreenTime() {
        return screenTime;
    }

    public void setScreenTime(double screenTime) {
        this.screenTime = screenTime;
    }

    public int getFocusScore() {
        return focusScore;
    }

    public void setFocusScore(int focusScore) {
        this.focusScore = focusScore;
    }

    public double getTargetHours() {
        return targetHours;
    }

    public void setTargetHours(double targetHours) {
        this.targetHours = targetHours;
    }

    public String getGoalName() {
        return goalName;
    }

    public void setGoalName(String goalName) {
        this.goalName = goalName;
    }

    public String getGoalStatus() {
        return goalStatus;
    }

    public void setGoalStatus(String goalStatus) {
        this.goalStatus = goalStatus;
    }
}