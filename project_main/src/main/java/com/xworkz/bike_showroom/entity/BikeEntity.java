package com.xworkz.bike_showroom.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
@Getter
@Setter
@Entity
@NamedQuery(name = "getnameonbranch" , query = "select b.bikename from BikeEntity b where b.branchEntity.id=:branchid")
@NamedQuery(name = "bikecount",query = "SELECT COUNT(b.id) FROM BikeEntity b")
@NamedQuery(name = "allbikedata",query = "SELECT u FROM BikeEntity u")
@NamedQuery(name = "addbranch",query = "UPDATE BikeEntity b SET b.branchEntity.id = :branchId WHERE b.id = :bikeId")
@NamedQuery(name = "notselectedbike",query = "select u from BikeEntity u where u.branchEntity.id IS NULL")

public class BikeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Integer id;
    private String model;
    private String milage;
    private String cc;
    private String bikename;
    private Long price;
    private String color;
    private String frontview;
    private String backview;
    private String leftview;
    private String rightview;

    @ManyToOne
    private BranchEntity branchEntity;
}
