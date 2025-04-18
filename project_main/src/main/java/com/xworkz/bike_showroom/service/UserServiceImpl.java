package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserRepo userRepo;
    @Override
    public Long emailoccurence(String email) {
        return userRepo.emailoccurence(email);
    }

    @Override
    public List<String> getbikeonbranch(String branchid) {
        return userRepo.getbikeonbranch(branchid);
    }

    @Override
    public boolean numberexist(long number) {
        return userRepo.numberexist(number);
    }

    @Override
    public boolean dlnumber(String dlnum) {
        return userRepo.dlnumber(dlnum);
    }

    @Override
    public boolean nameExist(String name) {
        return userRepo.nameExist(name);
    }
}
