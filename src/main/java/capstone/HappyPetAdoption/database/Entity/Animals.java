package capstone.HappyPetAdoption.database.Entity;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class Animals {

    private Integer animalID;

    private String animalName;

    private Integer animalAge;

    //TODO figure out how to do the select box in spring
    private String animalGender;

    private Double animalWeight;

    private Integer animalSpeciesID;

    private String animalDescription;

    private Boolean animalStatus;

    private Integer userHospitalID;

    @Column(name = "animalCreateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createData = new Date();

    private Date updateDate = new Date();

}
