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

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/user/registerSubmit", method = RequestMethod.POST)
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

        user.setEmail(formBean.getEmail());
        user.setPassword(formBean.getPassword());
        user.setName(formBean.getName());
        user.setAddress(formBean.getAddress());
        user.setCity(formBean.getCity());
        user.setState(formBean.getState());
        user.setZipcode(formBean.getZipcode());
        //user.setUserTypeId(formBean.getUserTypeId());
        user.setUserTypeID(0); // TODO get usertype
        user.setPhone(formBean.getPhone());
        user.setCreateDate(new Date());

        userDAO.save(user);

        log.info(formBean.toString());
        response.setViewName("redirect:/");
        return response;
    }
}
