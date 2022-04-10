package capstone.HappyPetAdoption.FormBeans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@ToString
public class RegisterFormBean {

    private Integer id;

    private String email;

    private String password;

    private String confirmPassword;

    private String name;

    private String address;

    private String city;

    private String state;

//    @NotEmpty
    private Integer userTypeId = 0;

    private Integer zipcode;

    private String phone;
}
