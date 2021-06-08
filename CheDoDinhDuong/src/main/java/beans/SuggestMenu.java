package beans;

import Models.FoodModel;
import template.TemplateMethodModel;

public class SuggestMenu {
    private int id;
    private int conID;
    private String dayofweek;
    private String foodName;
    private int number;
    private String session;

    public SuggestMenu(int id, int conID, String dayofweek, String foodName, int number, String session) {
        this.id = id;
        this.conID = conID;
        this.dayofweek = dayofweek;
        this.foodName = foodName;
        this.number = number;
        this.session = session;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setConID(int conID) {
        this.conID = conID;
    }

    public void setDayofweek(String dayofweek) {
        this.dayofweek = dayofweek;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public int getId() {
        return id;
    }

    public int getConID() {
        return conID;
    }

    public String getDayofweek() {
        return dayofweek;
    }

    public String getFoodName() {
        return foodName;
    }

    public int getNumber() {
        return number;
    }

    public String getSession() {
        return session;
    }

    public int getFoodIDByName(){
        TemplateMethodModel templateMethodModel = new FoodModel();
        return templateMethodModel.executeQ(foodName);
    }
}
