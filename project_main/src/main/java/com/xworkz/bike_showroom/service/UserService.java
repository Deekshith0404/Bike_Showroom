package com.xworkz.bike_showroom.service;

import java.util.List;

public interface UserService {
    Long emailoccurence(String email);
    List<String> getbikeonbranch(String branchid);
    boolean numberexist(long number);
    boolean dlnumber(String dlnum);
    boolean nameExist(String name);




}
