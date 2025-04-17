package com.xworkz.bike_showroom.restcontroller;

import com.xworkz.bike_showroom.emailSender.EmailSender;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;
import com.xworkz.bike_showroom.passwordGen.PasswordGenerator;
import com.xworkz.bike_showroom.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class OwnerLoginRestController {
    @Autowired
    OwnerService ownerService;

    @RequestMapping(value = "/email")
    public String onemail(@RequestParam("email") String email, Model model){
        OwnerLoginEntity result= ownerService.checkemail(email);
        if (result!=null){
            String password=PasswordGenerator.generatePassword(6);
            boolean rest= ownerService.addpassword(email,password);
            System.out.println(rest);
            Boolean result1= EmailSender.emailSender(email,password);
            if (result1){
                return "password send to Mail";
            }else {
                 return "email not send,try again";
            }

        }else {
             return "email not found";
        }

    }

    @RequestMapping("/valmodel")
    public String valmodel(@RequestParam("modelname")String modelname){
        boolean result=ownerService.checkmodelexist(modelname);
        if (result){
            return "Model already exist";
        }else {
            return "";
        }
    }
}
