package com.xworkz.bike_showroom.dto;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

@Data

public class FollowUpDto {
    private int id;
    private String name;
    private LocalDate date;
    private LocalTime time;
    private String status;
    private String message;
}
