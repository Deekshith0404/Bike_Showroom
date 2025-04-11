package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.*;

import java.util.List;
import java.util.Map;

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
    boolean addbiketobranch(int branchid,int bikeid);
    List<BikeEntity> unselectedBike();
    List<BikeEntity> notFullBranch();
    List<String> branchnames();
    boolean followUp(FollowUpEntity followUpEntity);
    List<UserReristerEntity> getalluser();

}
