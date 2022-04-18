package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
    private AnimalDAO animalDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserService userService;

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

    //shelter's home page, get a list of animals where these animals belong to this shelter
    @PreAuthorize("hasAuthority('Shelter')")
    @RequestMapping(value = "/shelter/home", method = RequestMethod.GET)
    public ModelAndView home(@RequestParam(value = "name", required = false) String name) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("shelter/home");

        //calling getAnimals method which declared down below
        List<Animal> animals = getShelterAnimals(userService.getCurrentUser(), name);

        response.addObject("animals", animals);
        response.addObject("name", name);

        return response;
    }

    @RequestMapping(value = "/shelter/{id}/details", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        User shelter = userDAO.getShelterById(id);
        response.addObject("shelter", shelter);

        List<Animal> animals = getShelterAnimals(shelter, null);
        response.addObject("animals", animals);

        response.setViewName("shelter/details");
        return response;
    }

    @RequestMapping(value = "/shelter/{id}/animals", method = RequestMethod.GET)
    public ModelAndView shelterAnimals(@PathVariable("id") Integer id, @RequestParam(value = "name", required = false) String name) throws Exception {
        ModelAndView response = new ModelAndView();

        List<Animal> animals = getShelterAnimals(userDAO.getShelterById(id), name);

        response.addObject("animals", animals);
        response.addObject("name", name);
        response.setViewName("shelter/home");
        return response;
    }

    private List<Animal> getShelterAnimals(User shelter, String name) {
        if (!StringUtils.isEmpty(name)) {
            return animalDAO.findAnimalByNameIgnoreCaseAndShelterId(name, shelter.getId());
        }
        else {
            return animalDAO.findAnimalsByShelterId(shelter.getId());
        }
    }


}
