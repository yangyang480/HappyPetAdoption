package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@RequiredArgsConstructor
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public ModelAndView login() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/login");

        return response;
    }

    @RequestMapping(value = "/user/loginSuccess", method = RequestMethod.GET)
    public ModelAndView loginSuccess() throws Exception {
        ModelAndView response = new ModelAndView();
        User user = userService.getCurrentUser();

        if (user.getUserTypeId() == 0) {
            response.setViewName("redirect:/shelter/home");
        } else {
            response.setViewName("redirect:/");
        }

        return response;
    }
}
