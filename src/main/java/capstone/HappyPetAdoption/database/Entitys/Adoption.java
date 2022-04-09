package capstone.HappyPetAdoption.database.Entitys;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class Adoption {

    private Integer orderID;

    private Integer animalID;

    private Integer userRescuerID;

    private Integer userHospitalID;

    //TODO enum datatype
//    private OrderStatus orderStatus;

    @Column(name = "orderCreateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createData = new Date();

    //TODO figure out how to set the update date up
    private Date updateDate = new Date();


}
