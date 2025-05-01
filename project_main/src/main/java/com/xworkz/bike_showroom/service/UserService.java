package com.xworkz.bike_showroom.service;

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
}
