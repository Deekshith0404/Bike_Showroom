package com.xworkz.bike_showroom.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BranchDto {
    private Integer id;
    private String name;
    private String location;
    private Long number;
    private String email;
    private String managerName;
    private String status;
    private MultipartFile pic;
    private String profile;
}
