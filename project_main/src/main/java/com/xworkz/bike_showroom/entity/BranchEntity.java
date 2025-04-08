package com.xworkz.bike_showroom.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NamedQuery(name = "allbranchdata",query = "SELECT u FROM BranchEntity u")
@NamedQuery(name = "branchcount",query = "SELECT COUNT(b.id) FROM BranchEntity b")
@NamedQuery(
        name = "showroomsWithFewBikes",
        query = "SELECT b FROM BranchEntity b WHERE (SELECT COUNT(bk.id) FROM BikeEntity bk WHERE bk.branchEntity.id = b.id) < 5"
)
public class BranchEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String location;
    private String email;
    private Long number;
    private String managerName;
    private String status;

    @OneToMany(mappedBy = "branchEntity")
    private List<BikeEntity> bike = new ArrayList<>();
}
