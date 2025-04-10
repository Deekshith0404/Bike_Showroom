package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.BikeDto;
import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.entity.BikeEntity;
import com.xworkz.bike_showroom.entity.BranchEntity;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;

import java.util.List;
import java.util.Map;

public interface OwnerService {
    OwnerLoginEntity checkemail(String email);
    Boolean addpassword(String email,String password);
    boolean addBranch(BranchDto branchDto);
    int usercount();
    int bikecount();
    int branchcount();
    boolean addBike(BikeDto bikeDto);
    List<BranchEntity> allbranchdata();
    List<BikeEntity> allbikedata();
    boolean register(UserRegisterDto userRegisterDto);
    boolean addbiketobranch(int branchid,int bikeid);
    List<BikeEntity> unselectedBike();
    List<BikeEntity> notFullBranch();
    Map<Integer,String> branchnames();


}
