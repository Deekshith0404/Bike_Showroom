package com.xworkz.bike_showroom.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@NamedQuery(name = "usercount",query = "SELECT COUNT(b.id) FROM UserReristerEntity b")
public class UserReristerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private Integer age;
    private String dlNumber;
    private String address;
    private Long phoneNumber;
    private String email;
    private String showroom;
    private String bikeModel;
}
