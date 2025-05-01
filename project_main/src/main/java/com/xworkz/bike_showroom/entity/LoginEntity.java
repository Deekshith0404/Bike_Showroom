package com.xworkz.bike_showroom.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Data
@Entity
@NamedQuery(name = "setpassword",query = "update LoginEntity u set u.password =:password  where u.email =:email")
@NamedQuery(name = "loginreset",query = "update LoginEntity u SET u.logincount = 0  WHERE u.email =:email")
@NamedQuery(name = "timelock",query = "update LoginEntity u SET u.timeout =:time  WHERE u.email =:email")
@NamedQuery(name = "logincountincrement",query = "UPDATE LoginEntity u SET u.logincount = u.logincount +1  WHERE u.email =:email")
@NamedQuery(name = "getuserdata",query = "select u from LoginEntity u where u.email =:email")
public class LoginEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String email;
    private String password;
    private int logincount;
    private LocalDateTime timeout;
}
