package beans;

import java.sql.Date;
import java.time.LocalDate;

public class History {
    private int historyID, userID;
    private double weight,height;
    private Date dateUpdate;

    public History() {
    }

    public History(int historyID, int userID, double weight, Date dateUpdate) {
        this.historyID = historyID;
        this.userID = userID;
        this.weight = weight;
        this.dateUpdate = dateUpdate;
    }



    public History(int historyID, int userID, double weight, double height, Date dateUpdate) {
        this.historyID = historyID;
        this.userID = userID;
        this.weight = weight;
        this.height = height;
        this.dateUpdate = dateUpdate;
    }

    public int getHistoryID() {
        return historyID;
    }

    public void setHistoryID(int historyID) {
        this.historyID = historyID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public Date getDateUpdate() {
        return dateUpdate;
    }

    public void setDateUpdate(Date dateUpdate) {
        this.dateUpdate = dateUpdate;
    }

    @Override
    public String toString() {
        return "History{" +
                "historyID=" + historyID +
                ", userID=" + userID +
                ", weight=" + weight +
                ", height=" + height +
                ", dateUpdate=" + dateUpdate +
                '}';
    }
}
