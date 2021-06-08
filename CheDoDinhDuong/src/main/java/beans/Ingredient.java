package beans;

public class Ingredient {
    private int foodID;
    private int ingredientID;
    private double gram;
    private String ingredientName;

    public Ingredient(int foodID, int ingredientID, double gram, String ingredientName) {
        this.foodID = foodID;
        this.ingredientID = ingredientID;
        this.gram = gram;
        this.ingredientName = ingredientName;
    }

    public Ingredient(int ingredientID, double gram, String ingredientName) {
        this.ingredientID = ingredientID;
        this.gram = gram;
        this.ingredientName = ingredientName;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public int getIngredientID() {
        return ingredientID;
    }

    public void setIngredientID(int ingredientID) {
        this.ingredientID = ingredientID;
    }

    public double getGram() {
        return gram;
    }

    public void setGram(double gram) {
        this.gram = gram;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }
}
