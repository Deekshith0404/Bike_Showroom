package com.xworkz.bike_showroom.controller;

import com.xworkz.bike_showroom.dto.BikeDto;
import com.xworkz.bike_showroom.dto.BranchDto;
import com.xworkz.bike_showroom.dto.FollowUpDto;
import com.xworkz.bike_showroom.dto.UserRegisterDto;
import com.xworkz.bike_showroom.entity.*;
import com.xworkz.bike_showroom.service.OwnerService;
import com.xworkz.bike_showroom.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;

@Controller
@RequestMapping("/")
public class LoginController {
    @Autowired
    OwnerService ownerLogin;

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(String email, String password, Model model) {
        OwnerLoginEntity result = ownerLogin.checkemail(email);
        if (result != null) {
            if (result.getPassword().equals(password)) {
                return this.dashboard(model);
            } else {
                model.addAttribute("result", "password mismatch");
                return "ownerLogin";
            }
        }
        model.addAttribute("result", "email not exist");
        return "ownerLogin";
    }

    @RequestMapping("/addbranch")
    public String addnewbranch(BranchDto branchDto, Model model) throws IOException {
        byte[] bytes = branchDto.getPic().getBytes();
        Path path = Paths.get("E:\\commons\\Branches\\" + branchDto.getName() + System.currentTimeMillis());
        String frontfile = path.getFileName().toString();
        branchDto.setProfile(frontfile);
        boolean result = ownerLogin.addBranch(branchDto, model);
        if (result) {
            Files.write(path, bytes);
            model.addAttribute("branchresult", "Branch added");
        } else {
            model.addAttribute("branchresult", "Branch was not able to add");
        }
        return this.dashboard(model);

    }

    @RequestMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("bike", ownerLogin.bikecount());
        model.addAttribute("branch", ownerLogin.branchcount());
        model.addAttribute("user", ownerLogin.usercount());
        model.addAttribute("branchesList", ownerLogin.allbranchdata());
        model.addAttribute("justbike", ownerLogin.allbikedata());
        model.addAttribute("unSelBike", ownerLogin.unselectedBike());
        model.addAttribute("notfullbranch", ownerLogin.notFullBranch());
        model.addAttribute("followIt", ownerLogin.getalluser());
        return "dashboard";
    }

    //    byte[] bytes=regFormDto.getMultipartFile().getBytes();
//    Path path= Paths.get("E:\\commons\\"+regFormDto.getName() +System.currentTimeMillis());
//        Files.write(path,bytes);
//    String filename=path.getFileName().toString();
//        regFormDto.setProfile(filename);
//        System.out.println("this is file===========");
    @RequestMapping("/addbike")
    public String addnewbike(BikeDto bikeDto, Model model) throws IOException {
        System.out.println("---------------------------------------------------------------");
        byte[] bytes = bikeDto.getFront().getBytes();
        Path path = Paths.get("E:\\commons\\front\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String frontfile = path.getFileName().toString();
        bikeDto.setFrontview(frontfile);

        byte[] bytes1 = bikeDto.getLeft().getBytes();
        Path path1 = Paths.get("E:\\commons\\left\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String leftfile = path1.getFileName().toString();
        bikeDto.setLeftview(leftfile);

        byte[] bytes2 = bikeDto.getRight().getBytes();
        Path path2 = Paths.get("E:\\commons\\right\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String rightfile = path2.getFileName().toString();
        bikeDto.setRightview(rightfile);

        byte[] bytes3 = bikeDto.getBack().getBytes();
        Path path3 = Paths.get("E:\\commons\\back\\" + bikeDto.getBikename() + System.currentTimeMillis());

        String backfile = path3.getFileName().toString();
        bikeDto.setBackview(backfile);

        boolean result = ownerLogin.addBike(bikeDto);
        if (result) {
            Files.write(path, bytes);
            Files.write(path1, bytes1);
            Files.write(path2, bytes2);
            Files.write(path3, bytes3);
            model.addAttribute("bikeresult", "Bike added");
        } else {
            model.addAttribute("bikeresult", "Bike was not able to add");
        }
        return this.dashboard(model);

    }

    @RequestMapping("/register")
    public String registration(Model model, UserRegisterDto userRegisterDto, FollowUpDto followUpDto) {
        userRegisterDto.setUserStatus("Active");
        boolean result = ownerLogin.register(userRegisterDto);
        followUpDto.setDate(Date.valueOf(LocalDate.now()));
        followUpDto.setTime(Time.valueOf(LocalTime.now()));
        followUpDto.setMessage("registered");
        followUpDto.setStatus(userRegisterDto.getRideOption());
        ownerLogin.followUp(followUpDto);
        if (result) {
            model.addAttribute("result", "Registration success!! now Login");

        } else {
            model.addAttribute("result", "Registration faild");
        }
        return this.dashboard(model);
    }

    @RequestMapping("/addbiketoshowroom")
    public String addbiketobranch(@RequestParam("branch") String branchId, @RequestParam("bike") String bikeId, Model model) {
        int branchid = Integer.parseInt(branchId);
        int bikeid = Integer.parseInt(bikeId);
        Boolean result = ownerLogin.addbiketobranch(branchid, bikeid);
        if (result) {
            model.addAttribute("branchresult", "Bike added to branch");
        } else {
            model.addAttribute("branchresult", "bike cannot be added");
        }
        return this.dashboard(model);
    }


    @RequestMapping("/startRegister")
    public String startRegister(Model model) {
        model.addAttribute("branchdata", ownerLogin.branchnames());
        return "userRegister";
    }

    @RequestMapping("/followupedit")
    @ResponseBody
    public UserReristerEntity followupedit(@RequestParam("name") String name, Model model) {
        System.out.println("===========---------");
        System.out.println(ownerLogin.getalluserbyname(name));
        return ownerLogin.getalluserbyname(name);
    }

    @RequestMapping("/followupeditsubmit")
    public String editfollowup(FollowUpDto followUpDto, Model model) {

        followUpDto.setDate(Date.valueOf(LocalDate.now()));
        followUpDto.setTime(Time.valueOf(LocalTime.now()));
        Boolean result = ownerLogin.editfollowupsubmit(followUpDto);
        if (result) {
            model.addAttribute("result", "updated successfully");
        } else {
            model.addAttribute("result", "update faild !! try again");
        }
        return this.dashboard(model);
    }

    @RequestMapping("/followupview")
    @ResponseBody
    public List<FollowUpEntity> followupviewall(@RequestParam("name") String name, Model model) {
        List<FollowUpEntity> list = ownerLogin.getallbyname(name);
        return list;
    }

    @RequestMapping("/bikes")
    public String bikes( Model model){
        List<BikeEntity> list = ownerLogin.bikes();
        model.addAttribute("bikesList", list);

        return "bikes";
    }

    @RequestMapping("/getpic")
    public void getpic(@RequestParam("imges")String imges,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("E:\\commons\\right\\"+imges);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }
    @RequestMapping("/branches")
    public String viewbranches(Model model){
        List<BranchEntity> list=ownerLogin.allbranchdata();
        model.addAttribute("showroomsList",list);
        return "showroom";
    }

    @RequestMapping("/getpicofbranch")
    public void getpicofbranch(@RequestParam("imges")String imges,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("E:\\commons\\Branches\\"+imges);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();
    }

    @PostMapping("/userLogin")
    public String userlogin(String email,String password,Model model){
        int result1=userService.login(email,password,model);
        if (result1==-1){
            model.addAttribute("email",email);
            return "setpassword";
        }else if (result1==1){
            model.addAttribute("email",email);
            return viewpagebikes(model);
        }
        else {
            model.addAttribute("email",email);
            return "login";
        }
    }

    @RequestMapping("/updatePassword")
    public String setpassword(String email,String password,String confirmPassword,Model model){
        if (password.equals(confirmPassword)){
            userService.setpassword(email,password);
            userService.loginrest(email);
            model.addAttribute("result","password set login now");
            return "login";
        }else {
            model.addAttribute("result","password missmatch");
            model.addAttribute("email",email);
            return "setpassword";
        }
    }

    @RequestMapping("/viewpage")
    public String viewpagebikes(Model model){
        List<BikeEntity> list=ownerLogin.allbikedata();
        model.addAttribute("bikesList",list);
        return "viewpage";
    }

    @RequestMapping("/getpicleft")
    public void getpicleft(@RequestParam("imges")String imges,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("E:\\commons\\left\\"+imges);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }

    @RequestMapping("/getpicfront")
    public void getpicfront(@RequestParam("imges")String imges,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("E:\\commons\\front\\"+imges);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }


    @RequestMapping("/getpicback")
    public void getpicback(@RequestParam("imges")String imges,Model model,HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");
        File file=new File("E:\\commons\\back\\"+imges);
        InputStream in=new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream out = response.getOutputStream();
        IOUtils.copy(in,out);
        response.flushBuffer();

    }

    @RequestMapping("/deletebranch")
    public String deletebranch(@RequestParam("name")String name,Model model){
        System.out.println(name);
        boolean result=ownerLogin.deletebranchByid(name);
        if (result){
            model.addAttribute("result","Deleted successfully");
        }else {
            model.addAttribute("result","not able to delete try again!");
        }
        return dashboard(model);
    }
}
