package model;

public class Goal {

    private int goalId;
    private int userId;
    private String goalName;
    private String targetValue;
    private String status;

    // Default Constructor
    public Goal() {
    }

    // Parameterized Constructor
    public Goal(int goalId, int userId, String goalName, String targetValue, String status) {
        this.goalId = goalId;
        this.userId = userId;
        this.goalName = goalName;
        this.targetValue = targetValue;
        this.status = status;
    }

    // Getters and Setters

    public int getGoalId() {
        return goalId;
    }

    public void setGoalId(int goalId) {
        this.goalId = goalId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getGoalName() {
        return goalName;
    }

    public void setGoalName(String goalName) {
        this.goalName = goalName;
    }

    public String getTargetValue() {
        return targetValue;
    }

    public void setTargetValue(String targetValue) {
        this.targetValue = targetValue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}