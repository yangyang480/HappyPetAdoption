package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static capstone.HappyPetAdoption.Extensions.OrderStatusExtension.OrderStatusString;

@Slf4j
@Controller
public class ShelterController {

    @Autowired
    private AdoptionDAO adoptionDAO;

    @Autowired
    private AnimalDAO animalDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserService userService;

    //a list of shelters, and search shelters by name.
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
    }

    //shelter's home page
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

    //shelter detail
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

    // search and get a list of animals where these animals belong to this shelter
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

    //shelter's adoptions
    @PreAuthorize("hasAuthority('Shelter')")
    @RequestMapping(value = "/shelter/adoptions", method = RequestMethod.GET)
    public ModelAndView shelterAdoptions() throws Exception{
        ModelAndView response = new ModelAndView();

        List<Adoption> adoptions = adoptionDAO.getAdoptionsByShelterId(userService.getCurrentUser().getId());

        List<Map<String, Object>> adoptionObjectList = new ArrayList<>();

        // Adding an object list of each item containing adoption, animal, rescuer, and order status
        adoptions.stream().forEach(adoption -> {
            Map<String, Object> adoptionMap = new HashMap<>();
            adoptionMap.put("adoption", adoption);
            adoptionMap.put("animal", animalDAO.getById(adoption.getAnimalId()));
            adoptionMap.put("rescuer", userDAO.getById(adoption.getRescuerId()));
            adoptionMap.put("orderStatus", OrderStatusString(adoption.getOrderStatus()));

            adoptionObjectList.add(adoptionMap);
        });

        response.addObject("adoptionObjectList", adoptionObjectList);

        response.setViewName("shelter/adoptions");
        return response;
    }
}
