package com.xworkz.bike_showroom.controller;

import com.xworkz.bike_showroom.dto.BikeDto;
import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;
import com.xworkz.bike_showroom.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    OwnerService ownerLogin;

    @RequestMapping("/login")
    public String login(String email, String password, Model model){
        OwnerLoginEntity result=ownerLogin.checkemail(email);
        if (result!=null){
            if (result.getPassword().equals(password)){
                return "dashboard";
            }else {
                model.addAttribute("result","password mismatch");
                return "ownerLogin.jsp";
            }
        }
        model.addAttribute("result","email not exist");
        return "ownerLogin.jsp";
    }

    @RequestMapping("/addbranch")
    public String addnewbranch(BranchDto branchDto,Model model){
        boolean result=ownerLogin.addBranch(branchDto);
        if (result){
            model.addAttribute("branchresult","Branch added");
        }else {
            model.addAttribute("branchresult","Branch was not able to add");
        }
        return "dashboard";

    }

    @RequestMapping("/dashboard")
    public String dashboard(Model model){
        model.addAttribute("bike",ownerLogin.bikecount());
        model.addAttribute("branch",ownerLogin.branchcount());
        model.addAttribute("user",ownerLogin.usercount());
        model.addAttribute("branchesList",ownerLogin.allbranchdata());
        model.addAttribute("justbike",ownerLogin.allbikedata());

        return "dashboard.jsp";
    }

//    byte[] bytes=regFormDto.getMultipartFile().getBytes();
//    Path path= Paths.get("E:\\commons\\"+regFormDto.getName() +System.currentTimeMillis());
//        Files.write(path,bytes);
//    String filename=path.getFileName().toString();
//        regFormDto.setProfile(filename);
//        System.out.println("this is file===========");
    @PostMapping("/addbike")
    public String addnewbike(BikeDto bikeDto, Model model) throws IOException {
    byte[] bytes=bikeDto.getFront().getBytes();
    Path path=Paths.get("E:\\commons\\front\\"+bikeDto.getBikename()+System.currentTimeMillis());
    Files.write(path,bytes);
    String frontfile=path.getFileName().toString();
    bikeDto.setFrontview(frontfile);

        byte[] bytes1=bikeDto.getLeft().getBytes();
        Path path1=Paths.get("E:\\commons\\left\\"+bikeDto.getBikename()+System.currentTimeMillis());
        Files.write(path1,bytes1);
        String leftfile=path1.getFileName().toString();
        bikeDto.setLeftview(leftfile);

        byte[] bytes2=bikeDto.getRight().getBytes();
        Path path2=Paths.get("E:\\commons\\right\\"+bikeDto.getBikename()+System.currentTimeMillis());
        Files.write(path2,bytes2);
        String rightfile=path2.getFileName().toString();
        bikeDto.setRightview(rightfile);

        byte[] bytes3=bikeDto.getBack().getBytes();
        Path path3=Paths.get("E:\\commons\\back\\"+bikeDto.getBikename()+System.currentTimeMillis());
        Files.write(path3,bytes3);
        String backfile=path3.getFileName().toString();
        bikeDto.setBackview(backfile);

        boolean result=ownerLogin.addBike(bikeDto);
        if (result){
            model.addAttribute("bikeresult","Bike added");
        }else {
            model.addAttribute("bikeresult","Bike was not able to add");
        }
        return "dashboard";

    }

    @RequestMapping("/register")
    public String registration(Model model, UserRegisterDto userRegisterDto){
        boolean result= ownerLogin.register(userRegisterDto);
        if (result){
            model.addAttribute("result","Registration success!! now Login");

        }else {
            model.addAttribute("result","Registration faild");
        }
        return "userRegister.jsp";
    }
}
