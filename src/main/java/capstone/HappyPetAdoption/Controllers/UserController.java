package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBean.RegisterFormBean;
import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Entity.User;
import capstone.HappyPetAdoption.database.Dao.UserDAO;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;

@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    public ModelAndView create() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("users/register");

        RegisterFormBean form = new RegisterFormBean();
        response.addObject("form", form);

        return response;
    }


    @RequestMapping(value = "/user/registerSubmit", method = { RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerSubmit(@Valid RegisterFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(form.toString());

        if (bindingResult.hasErrors()) {

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info( ((FieldError)error).getField() + " " +  error.getDefaultMessage());
            }

            response.addObject("form", form);

            response.addObject("bindingResult", bindingResult);

            response.setViewName("user/register");
            return response;
        }

        User user = userDao.findById(form.getId());

        if (user == null) {
            user = new User();
        }

        user.setUserEmail(form.getEmail());
        user.setUserPassword(form.getPassword());
        user.setCreateDate(new Date());

        userDao.save(user);

        log.info(form.toString());

        response.setViewName("redirect:/user/edit/" + user.getId());

        return response;
    }
}
