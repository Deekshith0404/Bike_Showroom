package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.entity.LoginEntity;
import com.xworkz.bike_showroom.entity.UserReristerEntity;
import org.springframework.ui.Model;

import java.util.List;

public interface UserService {
    Long emailoccurence(String email);
    List<String> getbikeonbranch(String branchid);
    boolean numberexist(long number);
    boolean dlnumber(String dlnum);
    boolean nameExist(String name);
    int login(String email, String password, Model model);

    void loginrest(String email);

    boolean setpassword(String email, String password);

    UserReristerEntity getUserByEmail(String email);

    Boolean updateUser(UserRegisterDto userRegisterDto);

    LoginEntity getlogindatabyEmail(String email);
}
