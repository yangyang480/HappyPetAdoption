package capstone.HappyPetAdoption.FormBeans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfileFormBean {

    private Integer id;

    private String email;

    private String password;

    private String confirmPassword;

    private String name;

    private String address;

    private String city;

    private String state;

    private Integer userTypeId;

    private String zipcode;

    private String phone;
}
