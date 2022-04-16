package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.RegisterFormBean;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;

@Slf4j
@Controller
public class RegisterController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public ModelAndView register(RegisterFormBean registerFormBean) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/register");

        return response;
    }

    @RequestMapping(value = "/user/registerSubmit", method = RequestMethod.POST)
    public ModelAndView registerSubmit(@Valid RegisterFormBean registerFormBean, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(registerFormBean.toString());

        if (bindingResult.hasErrors()) {
            //show all the input
            response.addObject("formbean", registerFormBean);
            //add the errors to display
            response.addObject("bindingResult", bindingResult);
            response.setViewName("user/register");
            return response;
        }
        //if user is null, then create it.
        User user = userDAO.findById(registerFormBean.getId());
        if (user == null) {
            user = new User();
        }

        user.setEmail(registerFormBean.getEmail());

        //save into the database. when register get the password encoded in database
        String password = passwordEncoder.encode(registerFormBean.getPassword());
        user.setPassword(password);
        user.setName(registerFormBean.getName());
        user.setAddress(registerFormBean.getAddress());
        user.setCity(registerFormBean.getCity());
        user.setState(registerFormBean.getState());
        user.setZipcode(registerFormBean.getZipcode());
        user.setUserTypeId(registerFormBean.getUserTypeId());
        user.setPhone(registerFormBean.getPhone());
        user.setCreatedDate(new Date());

        userDAO.save(user);

        log.info(registerFormBean.toString());
        response.setViewName("redirect:/");
        return response;
    }
}
