package com.xworkz.bike_showroom.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.security.PrivateKey;
@Data
public class BikeDto {
    private  Integer id;
    private String model;
    private String milage;
    private String bikename;
    private Long price;
    private MultipartFile front;
    private String frontview;
    private MultipartFile back;
    private String backview;
    private MultipartFile left;
    private String leftview;
    private MultipartFile right;
    private String rightview;
}
