package com.xworkz.bike_showroom.dto;

import lombok.Data;

import javax.persistence.Entity;

@Data
public class OwnerLoginDto {
    private Integer id;
    private String name;
    private String email;
    private String password;
}
