package Models;

import Utilties.DBUtils;
import beans.Food;
import beans.Ingredient;
import org.sql2o.Connection;

import java.util.List;
import java.util.Optional;

public class IngredientModel {
    public static List<Ingredient> findIngredientByFoodID(int foodID) {
        String sql = "SELECT NL.ingredientID as foodID, NL.gram as gram,foodName as ingredientName " +
                " FROM food, ingredient,(SELECT ingredientID,gram " +
                " FROM food, ingredient " +
                " WHERE food.foodID = :foodID and food.foodID = ingredient.foodID) as NL " +
                " WHERE NL.ingredientID = food.foodID " +
                " GROUP BY NL.ingredientID ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("foodID", foodID)
                    .executeAndFetch(Ingredient.class);
        }
    }


    public static List<Ingredient> checkIngredient(String foodID, String ingreID){
        String sql="select * from ingredient where foodID = :foodID and ingredientID= :ingreID";
        try(Connection con = DBUtils.getConnection()){
             return con.createQuery(sql)
                    .addParameter("foodID",foodID)
                    .addParameter("ingreID", ingreID)
                    .executeAndFetch(Ingredient.class);
        }
    }

    public static void addNewIngre(String foodID, String ingreID, String gram){
        String sql="INSERT into ingredient VALUES(:foodID,:ingreID,:gram,:ingreName)";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodID", foodID)
                    .addParameter("ingreID", ingreID)
                    .addParameter("gram", gram)
                    .addParameter("ingreName","")
                    .executeUpdate();
        }
    }
}
