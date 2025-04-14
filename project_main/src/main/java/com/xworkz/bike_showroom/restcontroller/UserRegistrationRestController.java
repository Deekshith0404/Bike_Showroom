package com.xworkz.bike_showroom.restcontroller;

import com.xworkz.bike_showroom.service.OwnerService;
import com.xworkz.bike_showroom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
public class UserRegistrationRestController {

    @Autowired
    UserService userService;


    @GetMapping(value = "/emailval")
    public String onEmail(@RequestParam("email") String email ){
        System.out.println("invoking in the onEmail............");
        Long count= userService.emailoccurence(email);
        if (count==0){
            return "";
        }
        return "email already exist";

    }

    @RequestMapping(value = "/getbranchbike")
    @ResponseBody
    public List<String> getbikeonbranch(@RequestParam("branchname") String branchname){
        System.out.println("hitting the rest or getbranchbike");
        List<String> bikes=  userService.getbikeonbranch(branchname);
        System.out.println(bikes);
        return bikes;
    }


}
