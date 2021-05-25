package beans;

import Models.FoodModel;

import java.util.Date;

public class CustomMenu {
    private int userID;
    private int foodID;
    private Date datetime;
    private int number;

    public CustomMenu(int userID, int foodID, Date datetime, int number) {
        this.userID = userID;
        this.foodID = foodID;
        this.datetime = datetime;
        this.number = number;
    }

    public CustomMenu(int userID, Date datetime) {
        this.userID = userID;
        this.datetime = datetime;
    }

    public CustomMenu(Date datetime) {
        this.datetime = datetime;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "CustomMenu{" +
                "userID=" + userID +
                ", foodID=" + foodID +
                ", datetime=" + datetime +
                ", number=" + number +
                '}';
    }
    public String getFoodNamebyFoodID(){ return FoodModel.getFoodNameByID(String.valueOf(this.foodID));}
}
