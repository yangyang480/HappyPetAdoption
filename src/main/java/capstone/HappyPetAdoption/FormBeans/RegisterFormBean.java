package capstone.HappyPetAdoption.FormBeans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;

@Getter
@Setter
@ToString
public class RegisterFormBean {

    private Integer id;

    private String userEmail;

    private String userPassword;

    private String confirmPassword;

    private String userName;

    private String userAddress;

    private String userCity;

    private String userState;

    private Integer userZipcode;

    private String userPhone;
}
