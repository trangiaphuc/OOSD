package beans;

public class Category {
    private int CatID;
    private String CatName;

    public Category(int catID, String catName) {
        CatID = catID;
        CatName = catName;
    }

    public int getCatID() {
        return CatID;
    }

    public void setCatID(int catID) {
        CatID = catID;
    }

    public String getCatName() {
        return CatName;
    }

    public void setCatName(String catName) {
        CatName = catName;
    }

    @Override
    public String toString() {
        return "Category{" +
                "CatID=" + CatID +
                ", CatName='" + CatName + '\'' +
                '}';
    }
}
