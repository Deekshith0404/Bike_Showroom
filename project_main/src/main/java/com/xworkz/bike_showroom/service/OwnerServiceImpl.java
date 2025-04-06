package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.entity.BranchEntity;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;
import com.xworkz.bike_showroom.repository.OwnerRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerServiceImpl implements OwnerService {

    @Autowired
    OwnerRepo ownerRepo;

    @Override
    public OwnerLoginEntity checkemail(String email) {
        return ownerRepo.checkemail(email);
    }

    @Override
    public Boolean addpassword(String email, String password) {
        return ownerRepo.addPassword(email,password);
    }

    @Override
    public boolean addBranch(BranchDto branchDto) {
        BranchEntity branchEntity=new BranchEntity();
        BeanUtils.copyProperties(branchDto,branchEntity);
        return ownerRepo.addBranch(branchEntity);
    }

    @Override
    public int usercount() {
        return ownerRepo.usercount();
    }

    @Override
    public int bikecount() {
        return ownerRepo.bikecount();
    }

    @Override
    public int branchcount() {
        return ownerRepo.branchcount();
    }
}
