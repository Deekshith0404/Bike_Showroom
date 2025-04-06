package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.BranchEntity;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;

public interface OwnerRepo {
    OwnerLoginEntity checkemail(String email);
    boolean addPassword(String email,String password);
    boolean addBranch(BranchEntity branchEntity);
    int bikecount();
    int branchcount();
    int usercount();
}
