package com.xworkz.bike_showroom.dto;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data

public class FollowUpDto {
    private int id;
    private String name;
    private Date date;
    private Time time;
    private String status;
    private String message;
}
