package capstone.HappyPetAdoption.database.Entitys;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class AnimalSpecies {

    private Integer animalSpeciesID;

    private String speciesName;

    @Column(name = "speciesCreateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createData = new Date();
}
