package com.xworkz.bike_showroom.entity;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Data
@NamedQuery(name = "usercount",query = "SELECT COUNT(b.id) FROM UserReristerEntity b")
@NamedQuery(name = "emailcheck",query = "SELECT COUNT(e.email) FROM UserReristerEntity e WHERE e.email = :email")
@NamedQuery(name = "getalluser",query = "Select u from UserReristerEntity u")
@NamedQuery(name = "getalluserbyname",query = "Select u from UserReristerEntity u where u.name =:name")
@NamedQuery(name = "numberexist",query = "select e from UserReristerEntity e where e.phoneNumber =: number")
@NamedQuery(name = "dlnumexist",query = "select e from UserReristerEntity e where e.dlNumber =: dlnum")
@NamedQuery(name = "nameexist",query = "select e from UserReristerEntity e where e.name =: name")
@NamedQuery(name = "getbyemail",query = "select e from UserReristerEntity e where e.email=:email")
public class UserReristerEntity extends AbstractAuditEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private Integer age;
    private String dlNumber;
    private String address;
    private Long phoneNumber;
    private String rideOption;
    private String email;
    private String showroom;
    private String bikeModel;
    private String profile;
    private String userStatus;
    private String rideDate;
    private String rideTime;
}
