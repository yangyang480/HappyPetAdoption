package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
    public ModelAndView home() throws Exception {
        Map<String, Object> model = new HashMap<>();

        User user = this.userService.getCurrentUser();

        model.put("user", user);

        ModelAndView response = new ModelAndView("/home", model);

        return response;
    }

}
