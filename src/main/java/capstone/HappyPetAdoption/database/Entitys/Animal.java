package capstone.HappyPetAdoption.database.Entitys;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class Animal {

    private Integer id;

    private String name;

    private Integer age;

    //TODO figure out how to do the select box in spring
    private String gender;

    private Double weight;

    private Integer speciesId;

    private String description;

    private Boolean status;

    private Integer shelterId;

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdData = new Date();

    private Date updatedDate = new Date();

}
