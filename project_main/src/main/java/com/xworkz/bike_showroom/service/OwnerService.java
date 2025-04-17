package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.BikeDto;
import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.dto.FollowUpDto;
import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.entity.*;
import org.springframework.ui.Model;

import java.util.List;

public interface OwnerService {
    OwnerLoginEntity checkemail(String email);
    Boolean addpassword(String email,String password);
    boolean addBranch(BranchDto branchDto, Model model);
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
    List<String> branchnames();
    boolean followUp(FollowUpDto followUpDto);
    List<UserReristerEntity> getalluser();
    UserReristerEntity getalluserbyname(String name);
    boolean editfollowupsubmit(FollowUpDto followUpDto);
    List<FollowUpEntity> getallbyname(String name);
    boolean checkmodelexist(String model);






}
