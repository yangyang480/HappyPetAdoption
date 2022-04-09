package capstone.HappyPetAdoption.database.Entitys;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "userEmail")
    private String userEmail;

    @Column(name = "userPassword")
    private String userPassword;

    @Column(name = "userName")
    private String userName;

    @Column(name = "userAddress")
    private String userAddress;

    @Column(name = "userCity")
    private String userCity;

    @Column(name = "userState")
    private String userState;

    @Column(name = "userZipcode")
    private Integer userZipcode;

    @Column(name = "userPhone")
    private String userPhone;

    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate = new Date();

    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate = new Date();
}
