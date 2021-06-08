package Models;

import beans.Food;
import org.sql2o.Connection;
import Utilties.DBUtils;
import template.TemplateMethodModel;

import java.util.List;
import java.util.Optional;

public class FoodModel extends TemplateMethodModel {
    public static List<Food> getAll() {
        String sql = "select * from food";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Food.class);
        }
    }

    public static List<Food> findByCatID(int catID) {
        String sql = "select * from food where catID = :catID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("catID", catID)
                    .executeAndFetch(Food.class);
        }
    }
    public static List<Food> findByCatIDwithisDelete(int catID) {
        String sql = "select * from food where catID = :catID and isDelete =0";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("catID", catID)
                    .executeAndFetch(Food.class);
        }
    }
    public static List<Food> findByCatIDWithLimit(int catID, int LIMIT, int OFFSET) {
        String sql = "select * from food where catID = :catID LIMIT :LIMIT OFFSET :OFFSET";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("catID", catID)
                    .addParameter("LIMIT",LIMIT)
                    .addParameter("OFFSET",OFFSET)
                    .executeAndFetch(Food.class);
        }
    }
    public static int countfoodByCat(int id) {
        final String sql = "Select count(*) from food WHERE food.catID=:cat_id";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("cat_id", id)
                    .executeScalar(Integer.class);

        }
    }

    public static List<Food> getFoodByStringWithLimit(String search,int LIMIT, int OFFSET) {
        final String sql = "select *"
                + " from food"
                + " where ( match(foodName) against (:search IN NATURAL LANGUAGE MODE) or foodName LIKE :search )"
                + " group by foodID LIMIT :LIMIT OFFSET :OFFSET ";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("search", "%"+ search + "%")
                    .addParameter("LIMIT",LIMIT)
                    .addParameter("OFFSET",OFFSET)
                    .executeAndFetch(Food.class);

        }

    }
    public static List<Food> getFoodByString(String search) {
        final String sql = "select *"
                + " from food"
                + " where ( match(foodName) against (:search IN NATURAL LANGUAGE MODE) or foodName LIKE :search )"
                + " group by foodID";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("search", "%"+ search + "%")
                    .executeAndFetch(Food.class);

        }

    }

    public static int getFoodIDByName(String name){
        final String sql="select foodID from food where foodName=:foodName";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("foodName",name)
                    .executeScalar(int.class);
        }
    }

    public static List<Food> getListFoodHaveIngredient() {
        final String sql = "SELECT food.foodID,food.foodName,food.catID,food.glucozo,food.kcal,food.protein,food.lipit,food.vitA,food.vitB,food.vitC,food.vitD,food.vitE,food.kali,food.na,food.fe,food.urlImage,food.isDelete\n" +
                "FROM (SELECT foodID as LFID\n" +
                "\t\t\t\t\tFrom ingredient\n" +
                "\t\t\t\t\tGROUP BY foodID) as LFood\n" +
                "LEFT JOIN food ON LFood.LFID = food.foodID";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .executeAndFetch(Food.class);

        }
    }



    public static Optional<Food> findByID(int id) {
        String sql = "select * from food where foodID = :foodID";
        try (Connection con = DBUtils.getConnection()) {
            List<Food> list = con.createQuery(sql)
                    .addParameter("foodID", id)
                    .executeAndFetch(Food.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }


    public  static  String getCatNameByCatID(int id){
        String sql="select catName from category where catID = :catID";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).addParameter("catID",id)
                    .executeScalar(String.class);
        }
    }

    public static void addNewFood(String foodName, int catID, String glu, String kcal, String lipit, String protein,
                                  String vitA, String vitB, String vitC, String vitD, String vitE, String kali,
                                  String fe, String natri, String url){
        String sql = "call sp_addNewFood(:foodName,:catID,:glu,:kcal,:lipit,:protein,:vitA,:vitB,:vitC,:vitD,:vitE,:kali,:fe,:natri,:url)";
        try (Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodName",foodName)
                    .addParameter("catID",catID)
                    .addParameter("glu",glu)
                    .addParameter("kcal",kcal)
                    .addParameter("lipit",lipit)
                    .addParameter("protein",protein)
                    .addParameter("vitA",vitA)
                    .addParameter("vitB",vitB)
                    .addParameter("vitC",vitC)
                    .addParameter("vitD",vitD)
                    .addParameter("vitE",vitE)
                    .addParameter("kali",kali)
                    .addParameter("fe",fe)
                    .addParameter("natri",natri)
                    .addParameter("url",url)
                    .executeUpdate();
        }
    }

    public static void deleteFood(String foodID){
        String sql = " UPDATE food set isDelete=1 where foodID=:foodID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodID",foodID)
                    .executeUpdate();
        }
    }

    public static void restoreFood(String foodID){
        String sql = " UPDATE food set isDelete=0 where foodID=:foodID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodID",foodID)
                    .executeUpdate();
        }
    }

    public static void deleteFoodRB(String foodID){
        String sql = "call sp_deleteFood(:foodID)";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodID",foodID)
                    .executeUpdate();
        }
    }

    public static void updateFood(String foodID, String foodName, int catID, String glu, String kcal, String lipit, String protein,
                                  String vitA, String vitB, String vitC, String vitD, String vitE, String kali,
                                  String fe, String natri, String url){
        String sql = "UPDATE food set foodName=:foodName,catID=:catID, glucozo=:glucozo, kcal=:kcal, protein=:protein, lipit=:lipit, vitA=:vitA, vitB=:vitB,vitC=:vitC,vitD=:vitD, vitE=:vitE, na=:natri,kali=:kali,urlImage=:url,fe=:fe where foodID=:foodID";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodName",foodName)
                    .addParameter("catID",catID)
                    .addParameter("glucozo",glu)
                    .addParameter("kcal",kcal)
                    .addParameter("lipit",lipit)
                    .addParameter("protein",protein)
                    .addParameter("vitA",vitA)
                    .addParameter("vitB",vitB)
                    .addParameter("vitC",vitC)
                    .addParameter("vitD",vitD)
                    .addParameter("vitE",vitE)
                    .addParameter("kali",kali)
                    .addParameter("fe",fe)
                    .addParameter("natri",natri)
                    .addParameter("url",url)
                    .addParameter("foodID",foodID)
                    .executeUpdate();
        }
    }



    public static String getFoodNameByID(String id){
        final String sql="select foodName from food where foodID=:foodID";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("foodID",id)
                    .executeScalar(String.class);
        }
    }

    @Override
    protected int getIdByName(String name) {
        final String sql="select foodID from food where foodName=:foodName";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("foodName",name)
                    .executeScalar(int.class);
        }
    }
}
