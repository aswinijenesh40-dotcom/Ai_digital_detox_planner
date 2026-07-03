package model;

import java.sql.Date;

public class ScreenTime {

    private int screenTimeId;
    private int userId;
    private Date usageDate;
    private double totalHours;
    private double socialMediaHours;
    private double gamingHours;
    private double entertainmentHours;

    public ScreenTime() {

    }

    public int getScreenTimeId() {
        return screenTimeId;
    }

    public void setScreenTimeId(int screenTimeId) {
        this.screenTimeId = screenTimeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getUsageDate() {
        return usageDate;
    }

    public void setUsageDate(Date usageDate) {
        this.usageDate = usageDate;
    }

    public double getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(double totalHours) {
        this.totalHours = totalHours;
    }

    public double getSocialMediaHours() {
        return socialMediaHours;
    }

    public void setSocialMediaHours(double socialMediaHours) {
        this.socialMediaHours = socialMediaHours;
    }

    public double getGamingHours() {
        return gamingHours;
    }

    public void setGamingHours(double gamingHours) {
        this.gamingHours = gamingHours;
    }

    public double getEntertainmentHours() {
        return entertainmentHours;
    }

    public void setEntertainmentHours(double entertainmentHours) {
        this.entertainmentHours = entertainmentHours;
    }

}