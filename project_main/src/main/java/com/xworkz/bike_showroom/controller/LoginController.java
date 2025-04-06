package com.xworkz.bike_showroom.controller;

import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;
import com.xworkz.bike_showroom.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
                ownerLogin.addpassword(email,password);
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
        return "dashboard.jsp";
    }
}
