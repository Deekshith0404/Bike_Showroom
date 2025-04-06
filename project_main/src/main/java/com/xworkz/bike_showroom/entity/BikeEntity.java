package com.xworkz.bike_showroom.entity;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@Entity
@Data
@NamedQuery(name = "bikecount",query = "SELECT COUNT(b.id) FROM BikeEntity b")
public class BikeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  Integer id;
    private String model;
    private String milage;
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
