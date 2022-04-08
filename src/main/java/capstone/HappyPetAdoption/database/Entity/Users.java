package capstone.HappyPetAdoption.database.Entity;

import lombok.*;
import javax.persistence.*;
import java.util.Date;

//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@ToString
//@Entity
//@Table
public class Users {

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "userID")
    private Integer userID;

//    @Column(name = "userEmail")
    private String userEmail;

//    @Column(name = "userPassword")
    private String userPassword;

//    @Column(name = "userName")
    private String userName;

//    @Column(name = "userAddress")
    private String userAddress;

//    @Column(name = "userCity")
    private String userCity;

//    @Column(name = "userState")
    private String userState;

//    @Column(name = "userzipcode")
    private Integer userzipcode;

//    @Column(name = "userPhone")
    private String userPhone;

//    @Column(name = "userCreateDate")
//    @Temporal(TemporalType.TIMESTAMP)
    private Date createData = new Date();

    //TODO figure out how to set the update date up
//    @Column(name = "userUpdateDate")
//    @Temporal(TemporalType.TIMESTAMP)
//    private Date updateDate = new Date();

}
