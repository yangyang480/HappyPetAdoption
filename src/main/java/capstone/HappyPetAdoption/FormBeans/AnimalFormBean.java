package capstone.HappyPetAdoption.FormBeans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
public class AnimalFormBean {

    private Integer id;

    @NotBlank(message = "Name must not be empty")
    private String name;

    @Min(value = 0, message = "Age must greater than 0")
    private Integer age;

    @NotBlank(message = "Gender must not be empty")
    private String gender;

    @Min(value = 0, message = "Weight must greater than 0")
    @NotNull(message = "Weight must not be empty")
    private Double weight;

    @NotBlank(message = "Description must not be empty")
    @NotNull(message = "Description must not be empty")
    private String description;

    private Integer shelterId;

    @NotNull(message = "Species must not be empty")
    private Integer speciesId;

//    @NotBlank(message = "Status must not be empty")
//    private Boolean status;
// Status could be future work.


}
