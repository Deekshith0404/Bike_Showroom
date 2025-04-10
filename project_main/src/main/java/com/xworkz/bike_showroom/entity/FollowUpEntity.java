package com.xworkz.bike_showroom.entity;

import lombok.Data;

import javax.persistence.Entity;
import java.sql.Date;
import java.sql.Time;
@Data
@Entity
public class FollowUpEntity {
    private int id;
    private String name;
    private Date date;
    private Time time;
    private String status;
    private String message;
}
