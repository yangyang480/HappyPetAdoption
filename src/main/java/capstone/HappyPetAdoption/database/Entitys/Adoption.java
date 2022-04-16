package capstone.HappyPetAdoption.database.Entitys;

import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
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
public class Adoption {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column()
    private Integer id;

    @Column()
    private Integer animalId;

    @Column()
    private Integer rescuerId;

    @Column()
    private Integer shelterId;

    @Column(columnDefinition="ENUM('REQUESTED', 'PENDING', 'CANCELED', 'COMPLETED')")
    @Enumerated(EnumType.STRING)
    private OrderStatusEnum orderStatus;

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate = new Date();

    @Column()
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate = new Date();
}
