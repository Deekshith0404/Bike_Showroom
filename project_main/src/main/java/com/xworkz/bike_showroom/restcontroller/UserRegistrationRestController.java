package com.xworkz.bike_showroom.restcontroller;

import com.xworkz.bike_showroom.service.OwnerService;
import com.xworkz.bike_showroom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class UserRegistrationRestController {

    @Autowired
    UserService userService;


    @GetMapping(value = "/email")
    public String onEmail(@RequestParam("email") String email ){
        System.out.println("invoking in the onEmail............");
        Long count= userService.emailoccurence(email);
        if (count==0){
            return "";
        }
        return "email already exist";

    }

}
