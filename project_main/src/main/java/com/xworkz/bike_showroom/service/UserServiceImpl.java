package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserRepo userRepo;
    @Override
    public Long emailoccurence(String email) {
        return userRepo.emailoccurence(email);
    }
}
