package Models;

import Utilties.DBUtils;
import beans.Condition;
import org.sql2o.Connection;

import java.util.List;

public class ConditionModel {
    public static List<Condition> getAllCondition(){
        final String sql = "Select * from `condition`";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql).executeAndFetch(Condition.class);
        }
    }
    public static String getConditionNameByConID(String id){
        final String sql = "select conName from `condition` where conID=:conID";
        try(Connection con = DBUtils.getConnection()){
            return  con.createQuery(sql)
                    .addParameter("conID",id)
                    .executeScalar(String.class);
        }
    }
}
