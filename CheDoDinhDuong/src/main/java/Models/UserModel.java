package Models;

import Utilties.DBUtils;
import beans.*;
import org.sql2o.Connection;

import java.util.List;
import java.util.Optional;

public class UserModel {

    public static Optional<User> findByUserName(String username) {
        final String sql = "select * from user where userName = :username";
        try (Connection con = DBUtils.getConnection()) {
            List<User> list = con.createQuery(sql)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }

    public static List<History> getHistorybyUserId(int id){
        final String sql = "SELECT *\n" +
                "FROM historyuserbmi as h\n" +
                "where h.userId = :id";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetch(History.class);

        }
    }


    public static void add(User user) {
        final String sql = "Call sp_addNewUser(:username,:password,:role,:name,:age,:height,:weight,:sex,:urlimage)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("username", user.getUserName())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getFullName())
                    .addParameter("role", user.getRole())
                    .addParameter("age", user.getAge())
                    .addParameter("height", user.getHeight())
                    .addParameter("weight", user.getWeight())
                    .addParameter("sex", user.isSex())
                    .addParameter("urlimage", user.getUrlImage())
                    .executeUpdate();
        }
    }

    public static void addHistorytodb(History h) {
        final String sql = "INSERT INTO historyuserbmi (userID, weight, height, dateUpdate) VALUES (:userID,:weight,:height,CONVERT(:dateUpdate,datetime) )";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)

                    .addParameter("userID", h.getUserID())
                    .addParameter("weight", h.getWeight())
                    .addParameter("height", h.getHeight())
                    .addParameter("dateUpdate",  h.getDateUpdate() )

                    .executeUpdate();
        }
    }

    public static void update(String userName,String fullName, int age,double height,double weight,boolean sex ) {
        final String sql = "update user set fullName = :fullName, age = :age, height=:height,weight=:weight,sex=:sex where userName = :userName";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userName", userName)
                    .addParameter("fullName", fullName)
                    .addParameter("age", age)
                    .addParameter("height", height)
                    .addParameter("weight", weight)
                    .addParameter("sex", sex)
                    .executeUpdate();
        }
    }

    public static void updatePassword(String userName,String password) {
        final String sql = "update user set password =:password where userName = :userName";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userName", userName)
                    .addParameter("password", password)

                    .executeUpdate();
        }
    }

    public static void updateImage(String userName,String url) {
        final String sql = "update user set urlImage =:url where userName = :userName";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("userName", userName)
                    .addParameter("url", url)

                    .executeUpdate();
        }
    }

    public static List<User> getAllUser(){
        final String sql = "select * from user where role=1";
        try(Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .executeAndFetch(User.class);
        }
    }

    public static void delete_activeUser(String username){
        final String sql = "call delete_active_User(:username)";
        try(Connection con = DBUtils.getConnection()){
            con.createQuery(sql).addParameter("username",username).executeUpdate();
        }
    }
}
