package Models;

import Utilties.DBUtils;
import beans.SuggestMenu;
import org.sql2o.Connection;

import java.util.List;
import java.util.Optional;

public class MenuModel {
    public static List<SuggestMenu> getSuggestMenuByDay(String conID, String day){
        final String sql = "select * from suggestmenu where conID=:conID and dayofweek=:day ";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("conID",conID)
                    .addParameter("day",day)
                    .executeAndFetch(SuggestMenu.class);
        }
    }

    public static void addNewSuggestMenu(String conID, String day, String foodname, String  number, String session){
        final String sql = "INSERT into suggestmenu (conID,dayofweek,foodName,number,session)  VALUES (:conID,:day,:foodname,:number,:session)";
        try(Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("conID",conID)
                    .addParameter("day",day)
                    .addParameter("foodname",foodname)
                    .addParameter("number",number)
                    .addParameter("session",session)
                    .executeUpdate();
        }
    }

    public static void deleteSuggestMenuByID(String ID){
        final String sql = "Delete from suggestmenu where id = :id";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("id",ID)
                    .executeUpdate();
        }
    }

    public static Optional<SuggestMenu> getSuggestMenuByID(String ID){
        final String sql = "select * from suggestmenu where id = :id";
        try(Connection con = DBUtils.getConnection()){
            List<SuggestMenu> lstMenu = con.createQuery(sql).addParameter("id",ID).executeAndFetch(SuggestMenu.class);
            if (lstMenu.size() == 0) {
                return Optional.empty();
            }
            return Optional.ofNullable(lstMenu.get(0));
        }
    }

    public static void updateSuggestMenu(String foodname, String number, String id){
        final String sql="UPDATE suggestmenu set foodName=:foodName,number=:number WHERE id=:id";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql)
                    .addParameter("foodName",foodname)
                    .addParameter("number",number)
                    .addParameter("id",id)
                    .executeUpdate();
        }
    }
}
