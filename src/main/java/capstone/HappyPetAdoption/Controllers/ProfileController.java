package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.ProfileFormBean;
import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Slf4j
@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/user/profile", method = RequestMethod.GET)
    public ModelAndView profile(ProfileFormBean profileFormBean) throws Exception
    {
        User user = this.userService.getCurrentUser();
        profileFormBean.setEmail(user.getEmail());
        profileFormBean.setName(user.getName());
        profileFormBean.setAddress(user.getAddress());
        profileFormBean.setCity(user.getCity());
        profileFormBean.setState(user.getState());
        profileFormBean.setZipcode(user.getZipcode());
        profileFormBean.setPhone(user.getPhone());
        profileFormBean.setUserTypeId(user.getUserTypeId());

        return new ModelAndView("/user/profile");
    }

    //edit the profile
    @RequestMapping(value = "/user/profileSubmit", method = RequestMethod.POST)
    public ModelAndView profileSubmit(ProfileFormBean profileFormBean) throws Exception {

        User user = this.userService.getCurrentUser();

        user.setEmail(profileFormBean.getEmail());
        user.setName(profileFormBean.getName());
        user.setAddress(profileFormBean.getAddress());
        user.setCity(profileFormBean.getCity());
        user.setState(profileFormBean.getState());
        user.setZipcode(profileFormBean.getZipcode());
        user.setPhone(profileFormBean.getPhone());
        user.setUpdatedDate(new Date());

        this.userService.save(user);

        return new ModelAndView("redirect:/");
    }


}