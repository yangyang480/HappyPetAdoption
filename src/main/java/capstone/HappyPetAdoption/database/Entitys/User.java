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
    @Column()
    private Integer id;

    @Column()
    private String email;

    @Column()
    private String password;

    @Column()
    private String name;

//    @OneToMany()
    @Column()
    private Integer userTypeId;

    @Column()
    private String address;

    @Column()
    private String city;

    @Column()
    private String state;

    @Column()
    private String zipcode;

    @Column()
    private String phone;

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate = new Date();

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate = new Date();

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
