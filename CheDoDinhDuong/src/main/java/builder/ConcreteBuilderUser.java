package builder;

import beans.User;

public class ConcreteBuilderUser implements BuilderUser{

    private int userID,role,age;
    private String userName,password, fullname;
    private double height,weight;
    private boolean sex, isDelete;
    private String urlImage;

    @Override
    public BuilderUser buildUID(int uid) {
        this.userID = uid;
        return  this;
    }

    @Override
    public BuilderUser buildUName(String uName) {
        this.userName = uName;
        return  this;
    }

    @Override
    public BuilderUser buildPass(String pass) {
        this.password = pass;
        return  this;
    }

    @Override
    public BuilderUser buildName(String name) {
        this.fullname = name;
        return  this;
    }

    @Override
    public BuilderUser buildRole(int role) {
        this.role = role;
        return  this;
    }

    @Override
    public BuilderUser buildAge(int age) {
        this.age = age;
        return  this;
    }

    @Override
    public BuilderUser buildHeight(double height) {
        this.height = height;
        return  this;
    }

    @Override
    public BuilderUser buildWeight(double weight) {
        this.weight = weight;
        return  this;
    }

    @Override
    public BuilderUser buildSex(boolean sex) {
        this.sex = sex;
        return  this;
    }

    @Override
    public BuilderUser buildImg(String urlImg) {
        this.urlImage = urlImg;
        return  this;
    }

    @Override
    public BuilderUser buildIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
        return this;
    }

    //
//    int userID, int role, int age, String userName, String password, String fullName, double height, double weight, boolean sex, String urlImage
    @Override
    public User build() {
        return new User(userID,role, age, userName, password, fullname, height, weight, sex, urlImage, isDelete);
    }
}
