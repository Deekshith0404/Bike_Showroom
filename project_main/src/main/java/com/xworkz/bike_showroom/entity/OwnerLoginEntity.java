package com.xworkz.bike_showroom.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "owner_login")
@NamedQuery(name = "checklogin",query = "select e from OwnerLoginEntity e where e.email=:email ")
@NamedQuery(name = "updatepassword",query = "UPDATE OwnerLoginEntity u SET u.password =:password WHERE u.email =:email")
public class OwnerLoginEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String email;
    private String password;
}
