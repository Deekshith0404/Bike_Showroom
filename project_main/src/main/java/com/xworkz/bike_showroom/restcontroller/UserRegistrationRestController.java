package com.xworkz.bike_showroom.restcontroller;

import com.xworkz.bike_showroom.service.OwnerService;
import com.xworkz.bike_showroom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
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
        System.out.println("hitting the rest or getbranchbike"+branchname);
        List<String> bikes=  userService.getbikeonbranch(branchname);
        System.out.println(bikes);
        return bikes;
    }

    @RequestMapping(value = "/regnumberVal")
    public String valOnNumber(@RequestParam("number") String number){
        boolean result=userService.numberexist(Long.parseLong(number));
        if (result){
            return "number exist!! please change";
        }else {
            return "";
        }
    }

    @RequestMapping("/regdlnum")
    public String valondlnumber(@RequestParam("dlnum")String dlnum){
        boolean result=userService.dlnumber(dlnum);
        if (result){
            return "dl number already exist";
        }else {
            return "";
        }
    }

    @RequestMapping("/valnamereg")
    public String valname(@RequestParam("name") String name){
        boolean result=userService.nameExist(name);
        if (result){
            return "user name already exist";
        }else {
            return "";
        }
    }

    @GetMapping("/loginemail")
    public String loginmailexist(@RequestParam("email")String email){
            Long result=userService.emailoccurence(email);
            if (result!=0){
                return "";
            }
            return "Email not exist! contact Admin";
    }
}
