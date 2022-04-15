package capstone.HappyPetAdoption.database.Entitys;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
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

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "name")
    private String name;

//    @OneToMany()
    @Column(name = "userTypeID")
    private Integer userTypeID;

    @Column(name = "address")
    private String address;

    @Column(name = "city")
    private String city;

    @Column(name = "state")
    private String state;

    @Column(name = "zipcode")
    private Integer zipcode;

    @Column(name = "phone")
    private String phone;

    @Column(name = "createDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate = new Date();

    @Column(name = "updateDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDate = new Date();


//    import java.time.LocalDate;
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    @Column(name = "birth_date")
//    private LocalDate birthDate;
//
//    public ModelAndView addChild(ChildFormBean form,
//                                 @RequestParam("birthDay") String birthDay,
//                                 @PathVariable("family_id") Integer familyId) throws Exception
//
//        log.info(String.valueOf(LocalDate.parse(birthDay)));

}
