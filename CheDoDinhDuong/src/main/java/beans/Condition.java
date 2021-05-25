package beans;

public class Condition {
    private int conID;
    private String conName;
    private float bmiStart;
    private float bmiEnd;

    public Condition(int conID, String conName, float bmiStart, float bmiEnd) {
        this.conID = conID;
        this.conName = conName;
        this.bmiStart = bmiStart;
        this.bmiEnd = bmiEnd;
    }

    public int getConID() {
        return conID;
    }

    public String getConName() {
        return conName;
    }

    public float getBmiStart() {
        return bmiStart;
    }

    public float getBmiEnd() {
        return bmiEnd;
    }

    public void setConID(int conID) {
        this.conID = conID;
    }

    public void setConName(String conName) {
        this.conName = conName;
    }

    public void setBmiStart(float bmiStart) {
        this.bmiStart = bmiStart;
    }

    public void setBmiEnd(float bmiEnd) {
        this.bmiEnd = bmiEnd;
    }
}
