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
@Table(name = "Animal")
public class Animal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column()
    private Integer id;

    @Column()
    private String name;

    @Column()
    private Integer age;

    @Column()
    private String gender;

    @Column()
    private Double weight;

    @Column()
    private Integer speciesId;

    @Column()
    private String description;

//    @Column(columnDefinition="ENUM('AVAILABLE', 'UNAVAILABLE')")
//    @Enumerated(EnumType.STRING)
//    private AnimalStatusEnum status;

    @Column()
    private Integer shelterId;

    @Column()
    private String imgURL;

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate = new Date();

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate = new Date();

}
