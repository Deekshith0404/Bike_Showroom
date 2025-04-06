package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;

public interface OwnerService {
    OwnerLoginEntity checkemail(String email);
    Boolean addpassword(String email,String password);
    boolean addBranch(BranchDto branchDto);
    int usercount();
    int bikecount();
    int branchcount();
}
