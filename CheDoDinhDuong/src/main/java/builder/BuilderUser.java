package builder;

import beans.User;

public interface BuilderUser {
    BuilderUser buildUID(int uid);
    BuilderUser buildUName(String uName);
    BuilderUser buildPass(String pass);
    BuilderUser buildName(String name);
    BuilderUser buildRole(int role);
    BuilderUser buildAge(int age);
    BuilderUser buildHeight(double height);
    BuilderUser buildWeight(double weight);
    BuilderUser buildSex(boolean sex);
    BuilderUser buildImg(String urlImg);
    BuilderUser buildIsDelete(boolean isDelete);

    User build();
}
