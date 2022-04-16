package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class ShelterController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping(value = "/shelters", method = RequestMethod.GET)
    public ModelAndView shelters(@RequestParam(value = "name", required = false) String name) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("shelters");

        List<User> users;

        if (!StringUtils.isEmpty(name)) {
            users = userDAO.findShelterByNameIgnoreCase(name);
        }
        else {
            users = userDAO.getAllShelters();
        }

        response.addObject("userModelKey", users);
        response.addObject("name", name);
        return response;
        //TODO route this with shelter-home jsp page. this is more like search animals by shelter id
    }

    @RequestMapping(value = "/shelter/home", method = RequestMethod.GET)
    public ModelAndView home() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("shelter/home");
        return response;
    }

    @RequestMapping(value = "/shelter/{id}/details", method = RequestMethod.GET)
    public ModelAndView shelter(@PathVariable("id") int id) throws Exception {
        ModelAndView response = new ModelAndView();

        User shelter = userDAO.getShelterById(id);
        response.addObject("shelter", shelter);

        List<Animal> animals = userDAO.findAnimalsByShelterId(id);
        response.addObject("animals", animals);

        response.setViewName("shelter/details");
        return response;
    }
}
