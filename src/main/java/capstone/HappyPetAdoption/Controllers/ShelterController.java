package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.RegisterFormBean;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Animals;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
public class ShelterController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping(value = "/view/shelter", method = RequestMethod.GET)
    public ModelAndView register() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("view/shelter");
        return response;
    }

    @RequestMapping(value = "/shelter/home", method = RequestMethod.GET)
    public ModelAndView home() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("/shelter/home");
        return response;
    }

    @RequestMapping(value = "/shelter/{id}", method = RequestMethod.GET)
    public ModelAndView editUser(@RequestParam(value = "ShelterId") Integer ShelterId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("shelter/{id}");

        List<Animals> animalsList = new ArrayList<Animals>();

        if (!StringUtils.isEmpty("ShelterId")) {
            animalsList = userDAO.findByShelterId(ShelterId);
        }
        response.addObject("findAnimalsByShelter", animalsList);
        response.addObject("ShelterId", ShelterId);
        return response;
        //TODO route this with shelter-home jsp page. this is more like search animals by shelter id
    }
}
