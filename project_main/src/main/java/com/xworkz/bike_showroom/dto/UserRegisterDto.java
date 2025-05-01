package com.xworkz.bike_showroom.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class UserRegisterDto {

    private Integer id;
    private String name;
    private Integer age;
    private String dlNumber;
    private String address;
    private Long phoneNumber;
    private String rideOption;
    private String email;
    private String showroom;
    private String bikeModel;
    private MultipartFile profilefile;
    private String profile;
    private String userStatus;
    private String rideDate;
    private String rideTime;

}
