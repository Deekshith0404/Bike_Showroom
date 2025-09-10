package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.LoginEntity;
import com.xworkz.bike_showroom.entity.UserReristerEntity;

import java.util.List;

public interface UserRepo {
    Long emailoccurence(String email);
    List<String> getbikeonbranch(String branchname);
    boolean numberexist(long number);
    boolean dlnumber(String dlnum);
    boolean nameExist(String name);

        LoginEntity login(String email);
    boolean logincountincrement(String email);

    void timeout(String email);

    void loginrest(String email);

    boolean setpassword(String email, String password);

    UserReristerEntity getUserByEmail(String email);

    Boolean updateuser(UserReristerEntity userReristerEntity);

    LoginEntity getlogindataByEmail(String email);
}
