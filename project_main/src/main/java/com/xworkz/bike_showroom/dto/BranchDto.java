package com.xworkz.bike_showroom.dto;

import lombok.Data;

@Data
public class BranchDto {
    private Integer id;
    private String name;
    private String location;
    private Long number;
    private String email;
    private String managerName;
    private String status;
}
