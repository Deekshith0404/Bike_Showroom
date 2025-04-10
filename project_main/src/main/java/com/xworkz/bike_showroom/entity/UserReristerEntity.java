package com.xworkz.bike_showroom.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@NamedQuery(name = "usercount",query = "SELECT COUNT(b.id) FROM UserReristerEntity b")
@NamedQuery(name = "emailcheck",query = "SELECT COUNT(e.email) FROM UserReristerEntity e WHERE e.email = :email")

public class UserReristerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private Integer age;
    private String dlNumber;
    private String address;
    private Long number;
    private String email;
    private String showroom;
    private String bikemodel;
}
