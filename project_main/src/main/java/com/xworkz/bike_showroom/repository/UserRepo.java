package com.xworkz.bike_showroom.repository;

import java.util.List;

public interface UserRepo {
    Long emailoccurence(String email);
    List<String> getbikeonbranch(String branchname);

}
