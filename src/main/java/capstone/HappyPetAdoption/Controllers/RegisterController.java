package capstone.HappyPetAdoption.Controllers;


import capstone.HappyPetAdoption.FormBeans.RegisterFormBean;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
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

    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public ModelAndView register() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/register");

        return response;
    }

    @RequestMapping(value = "/user/registerSubmit", method = RequestMethod.GET)
    public ModelAndView registerSubmit(@Valid RegisterFormBean formBean, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(formBean.toString());

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + " " + error.getDefaultMessage());
            }
            response.addObject("formbean", formBean);
            response.addObject("bindingResult", bindingResult);
            response.setViewName("user/register");
            return response;
        }
        User user = userDAO.findById(formBean.getId());
        if (user == null) {
            user = new User();
        }
        user.setId(formBean.getId());
        user.setUserEmail(formBean.getUserEmail());
        user.setUserPassword(formBean.getUserPassword());
        user.setUserName(formBean.getUserName());
        user.setUserAddress(formBean.getUserAddress());
        user.setUserCity(formBean.getUserCity());
        user.setUserState(formBean.getUserState());
        user.setUserZipcode(formBean.getUserZipcode());
        user.setUserPhone(formBean.getUserPhone());
        user.setCreateDate(new Date());

        userDAO.save(user);

        log.info(formBean.toString());
        response.setViewName("redirect:/user/edit/" + user.getId());
        return response;
    }

}
