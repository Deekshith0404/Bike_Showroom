package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.BikeEntity;
import com.xworkz.bike_showroom.entity.BranchEntity;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;
import com.xworkz.bike_showroom.entity.UserReristerEntity;

import java.util.List;

public interface OwnerRepo {
    OwnerLoginEntity checkemail(String email);
    boolean addPassword(String email,String password);
    boolean addBranch(BranchEntity branchEntity);
    boolean addBike(BikeEntity bikeEntity);
    int bikecount();
    int branchcount();
    int usercount();
    List<BranchEntity> allbranchdata();
    List<BikeEntity> allbikedata();
    boolean register(UserReristerEntity userReristerEntity);
}
