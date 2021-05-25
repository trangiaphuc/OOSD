package Models;

import Utilties.DBUtils;
import org.sql2o.Connection;

public class TestDBModel {
    public static String getTestString(){
        String a;
        String sql = "select urlImage from food where foodID = 1";
        try(Connection con = DBUtils.getConnection()) {
            a = con.createQuery(sql).executeScalar(String.class);
        }
        return a;
    }
}
