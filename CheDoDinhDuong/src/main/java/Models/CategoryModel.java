package Models;

import beans.Category;
import org.sql2o.Connection;
import Utilties.DBUtils;
import template.TemplateMethodModel;

import java.util.List;
import java.util.Optional;

public class CategoryModel extends TemplateMethodModel {


    public static List<Category> getAll() {
        final String sql = "select * from category";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(sql).executeAndFetch(Category.class);
        }
    }

    public static Optional<Category> findById(int id) {
        final String sql = "select * from category where catID = :catID";
        try (Connection con = DBUtils.getConnection()) {
            List<Category> list = con.createQuery(sql)
                    .addParameter("catID", id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return Optional.empty();
            }

            return Optional.ofNullable(list.get(0));
        }
    }

    public static void add(Category c) {
        final String sql = "INSERT INTO category (catName) VALUES (:catName)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("catName", c.getCatName())
                    .executeUpdate();
        }
    }

    public static void delete(int id) {
        final String sql = "delete from category where CatID = :CatID";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("catID", id)
                    .executeUpdate();
        }
    }

    public static void update(Category c) {
        final String sql = "update category set catName = :catName where catID = :catID";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("catID", c.getCatID())
                    .addParameter("catName", c.getCatName())
                    .executeUpdate();
        }
    }

    public static int getCatIDByCatName(String catName){
        final String sql = "select catID from category where catName=:catName";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catName",catName)
                    .executeScalar(int.class);
        }
    }

    @Override
    protected int getIdByName(String name) {
        final String sql = "select catID from category where catName=:catName";
        try (Connection con = DBUtils.getConnection()){
            return con.createQuery(sql)
                    .addParameter("catName",name)
                    .executeScalar(int.class);
        }
    }
}
