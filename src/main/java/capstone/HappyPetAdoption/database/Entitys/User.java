package capstone.HappyPetAdoption.database.Entitys;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Builder
@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "User")
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

}
