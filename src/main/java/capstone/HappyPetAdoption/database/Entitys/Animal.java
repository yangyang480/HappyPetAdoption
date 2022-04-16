package capstone.HappyPetAdoption.database.Entitys;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Animal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column()
    private Integer id;

    @Column()
    private String name;

    @Column()
    private Integer age;

    //TODO figure out how to do the select box in spring
    @Column()
    private String gender;

    @Column()
    private BigDecimal weight;

    @Column()
    private Integer speciesId;

    @Column()
    private String description;

    @Column()
    private Boolean status;

    @Column()
    private Integer shelterId;

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate = new Date();

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate = new Date();

}