package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.entity.LoginEntity;
import com.xworkz.bike_showroom.entity.UserReristerEntity;
import com.xworkz.bike_showroom.repository.UserRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
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

    @Override
    public int login(String email, String password, Model model) {
        LoginEntity entity= userRepo.login(email);
        if (entity!=null) {
            if (entity.getLogincount() == -1) {
                if (entity.getPassword().equals(password)){
                    return -1;
                }else {
                    model.addAttribute("result","password wrong check email and Re enter");
                }
            } else if (entity.getLogincount()==3) {
                model.addAttribute("result","your 3 chances completed try after 24hrs");
                userRepo.logincountincrement(entity.getEmail());
                userRepo.timeout(entity.getEmail());
                return 0;
            } else if (entity.getLogincount()>3) {
                LocalDateTime a= entity.getTimeout();
                LocalDateTime b=a.plusMinutes(2);
                LocalDateTime local=LocalDateTime.now();
                if (local.isAfter(b)){
                    userRepo.loginrest(email);
                    model.addAttribute("pass","try now");
                }else {
                    model.addAttribute("pass","please try after the time out\t"+b);
                }
                return 6;
            } else if (entity.getPassword().equals(password)) {
                userRepo.loginrest(entity.getEmail());
                return 1;
            }else if (!entity.getPassword().equals(password)){
                model.addAttribute("result","password is not same");
                userRepo.logincountincrement(entity.getEmail());
                return 3;
            }
        }else {
                model.addAttribute("result","user not exist");
                return 10;
            }
            return 2;
        }

    @Override
    public void loginrest(String email) {
         userRepo.loginrest(email);
    }

    @Override
    public boolean setpassword(String email, String password) {
        return userRepo.setpassword(email,password);
    }

    @Override
    public UserReristerEntity getUserByEmail(String email) {
        return userRepo.getUserByEmail(email);
    }

    @Override
    public Boolean updateUser(UserRegisterDto userRegisterDto) {
        UserReristerEntity userReristerEntity=new UserReristerEntity();
        BeanUtils.copyProperties(userRegisterDto,userReristerEntity);
        return userRepo.updateuser(userReristerEntity);
    }

    @Override
    public LoginEntity getlogindatabyEmail(String email) {
        return userRepo.getlogindataByEmail(email);
    }
}

