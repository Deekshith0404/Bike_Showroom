package com.xworkz.bike_showroom.service;

import com.xworkz.bike_showroom.dto.BikeDto;
import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.dto.FollowUpDto;
import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.emailSender.EmailSender;
import com.xworkz.bike_showroom.entity.*;
import com.xworkz.bike_showroom.passwordGen.PasswordGenerator;
import com.xworkz.bike_showroom.repository.OwnerRepo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

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
    public boolean addBranch(BranchDto branchDto, Model model) {
        BranchEntity branchEntity=new BranchEntity();
        BeanUtils.copyProperties(branchDto,branchEntity);
        boolean result=ownerRepo.checkbranchExist(branchDto.getName());
        if (result){
            model.addAttribute("result","Branch Name already exist plz change");
            return false;
        }
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

    @Override
    public boolean addBike(BikeDto bikeDto) {
        BikeEntity bikeEntity=new BikeEntity();
        BeanUtils.copyProperties(bikeDto,bikeEntity);
        return ownerRepo.addBike(bikeEntity);
    }

    @Override
    public List<BranchEntity> allbranchdata() {
        return ownerRepo.allbranchdata();
    }

    @Override
    public List<BikeEntity> allbikedata() {
        return ownerRepo.allbikedata();
    }

    @Override
    public boolean register(UserRegisterDto userRegisterDto) {
        UserReristerEntity userReristerEntity=new UserReristerEntity();
        BeanUtils.copyProperties(userRegisterDto,userReristerEntity);
        LoginEntity loginEntity=new LoginEntity();
        loginEntity.setEmail(userRegisterDto.getEmail());
        String password=PasswordGenerator.generatePassword(8);
        loginEntity.setPassword(password);
        EmailSender.emailSender(userRegisterDto.getEmail(),password);
        loginEntity.setLogincount(-1);

        ownerRepo.saveloign(loginEntity);
        return ownerRepo.register(userReristerEntity);
    }

    @Override
    public boolean addbiketobranch(int branchid, int bikeid) {
        return ownerRepo.addbiketobranch(branchid,bikeid);
    }

    @Override
    public List<BikeEntity> unselectedBike() {
        return ownerRepo.unselectedBike();
    }

    @Override
    public List<BikeEntity> notFullBranch() {
        return ownerRepo.notFullBranch();
    }

    @Override
    public List<String> branchnames() {
        return ownerRepo.branchnames();
    }

    @Override
    public boolean followUp(FollowUpDto followUpDto) {
        FollowUpEntity followUp=new FollowUpEntity();
        BeanUtils.copyProperties(followUpDto,followUp);
         return ownerRepo.followUp(followUp);
    }

    @Override
    public List<UserReristerEntity> getalluser() {
        return ownerRepo.getalluser();
    }

    @Override
    public UserReristerEntity getalluserbyname(String name) {
        return ownerRepo.getalluserbyname(name);
    }

    @Override
    public boolean editfollowupsubmit(FollowUpDto followUpDto) {
        FollowUpEntity followUp=new FollowUpEntity();
        BeanUtils.copyProperties(followUpDto,followUp);
        return ownerRepo.editfollowupsubmit(followUp);
    }

    @Override
    public List<FollowUpEntity> getallbyname(String name) {
        return ownerRepo.getallbyname(name);
    }

    @Override
    public boolean checkmodelexist(String model) {
        return ownerRepo.checkmodelexist(model);
    }

    @Override
    public List<BikeEntity> bikes() {
        return ownerRepo.bikes();
    }

    @Override
    public BikeEntity bikebyId(int id) {
        return ownerRepo.bikebyId(id);
    }

}
