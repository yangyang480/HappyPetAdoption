package capstone.HappyPetAdoption.FormBeans;

import capstone.HappyPetAdoption.Validations.EmailUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.*;


@Getter
@Setter
@ToString
public class RegisterFormBean {

    private Integer id;

    @NotBlank(message = "Please enter an email")
    @EmailUnique(message = "Email is already in use")
    @Email(message = "email must be formatted")
    private String email;

    @NotBlank(message = "Please enter a password")
    @Length(min = 6, max = 20)
    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$", message = "at least one numeric digit, one uppercase and one lowercase ")
    private String password;

    //TODO match the password
    @NotBlank(message = "Passwords do not match")
    private String confirmPassword;

    @NotBlank(message = "Please enter a name")
    private String name;

    @NotNull(message = "Please select a role")
    private Integer userTypeId;

    @NotBlank(message = "Please enter a address")
    private String address;

    @NotBlank(message = "Please enter a city")
    private String city;

    //TODO how to set default = null/0
    @NotBlank(message = "Please select a state")
    private String state;

    @NotNull(message = "Please enter zipcode")
    private Integer zipcode;

    //TODO not showing in the form
    @NotNull(message = "Please enter a phone")
    private String phone;


}
