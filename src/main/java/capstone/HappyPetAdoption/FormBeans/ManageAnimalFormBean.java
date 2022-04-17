package capstone.HappyPetAdoption.FormBeans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@Setter
@ToString
public class ManageAnimalFormBean {

    private Integer id;

    @NotBlank(message = "Name must not be empty")
    private String name;

    private Integer age;

    @NotBlank(message = "Gender must not be empty")
    private String gender;

    @NotNull(message = "Weight must not be empty")
    private Double weight;

    @NotBlank(message = "Description must not be empty")
    private String description;

    private Integer shelterId;

    @NotNull(message = "Species must not be empty")
    private Integer speciesId;

//    @NotBlank(message = "Status must not be empty")
//    private Boolean status;
// Status could be future work.


}
