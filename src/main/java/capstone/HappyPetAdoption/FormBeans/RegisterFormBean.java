package capstone.HappyPetAdoption.FormBeans;

import capstone.HappyPetAdoption.Validations.EmailUnique;
import capstone.HappyPetAdoption.Validations.TwoFieldsAreEqual;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.*;


@Getter
@Setter
@ToString
@TwoFieldsAreEqual(fieldOneName = "password", fieldTwoName = "confirmPassword", message = "Passwords must match")
public class RegisterFormBean {

    private Integer id;

    @NotBlank(message = "Email must not be empty")
    @EmailUnique(message = "Email is already in use")
    @Email(message = "Email must be formatted")
    private String email;

    @Length(min = 6, message = "Password is too short")
    @Length(max = 20, message = "Password is too long")
    @Pattern(regexp = ".*[0-9].*", message = "Password needs at least one number")
    @Pattern(regexp = ".*[A-Z].*", message = "Password needs at least one uppercase letter")
    @Pattern(regexp = ".*[a-z].*", message = "Password needs at least one lowercase letter")
    private String password;


    //TODO the message won't show
    @NotEmpty(message = "Confirm password must not be empty")
    private String confirmPassword;

    @NotBlank(message = "Name must not be empty")
    private String name;

    @NotNull(message = "Role must not be empty")
    private Integer userTypeId;

    @NotBlank(message = "Address must not be empty")
    private String address;

    @NotBlank(message = "City must not be empty")
    private String city;

    @NotBlank(message = "A state must be selected")
    private String state;

    @NotNull(message = "Zipcode must not be empty")
    private Integer zipcode;

    @NotBlank(message = "Phone must not be empty")
    private String phone;
}
