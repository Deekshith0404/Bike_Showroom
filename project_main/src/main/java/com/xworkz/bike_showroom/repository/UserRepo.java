package com.xworkz.bike_showroom.repository;

import java.util.List;

public interface UserRepo {
    Long emailoccurence(String email);
    List<String> getbikeonbranch(String branchname);
    boolean numberexist(long number);
    boolean dlnumber(String dlnum);
    boolean nameExist(String name);

}
