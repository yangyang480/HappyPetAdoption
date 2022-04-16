package capstone.HappyPetAdoption.database.Entitys;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class AnimalSpecies {

    private Integer id;

    private String name;

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdData = new Date();
}
