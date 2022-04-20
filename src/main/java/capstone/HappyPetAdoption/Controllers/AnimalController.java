package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.AnimalFormBean;
import capstone.HappyPetAdoption.Services.AdoptionService;
import capstone.HappyPetAdoption.Services.UserService;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
public class AnimalController {

    @Autowired
    private AdoptionService adoptionService;

    @Autowired
    private AnimalDAO animalDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserService userService;

    //get a list of animals and search by name
    @RequestMapping(value = "/animals", method = RequestMethod.GET)
    public ModelAndView animalSearch(@RequestParam(value = "name", required = false) String name) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("animals");

        List<Animal> animals;

        if (!StringUtils.isEmpty(name)) {
            animals = animalDAO.findAnimalByNameIgnoreCase(name);
        }
        else {
            animals = animalDAO.getAllAnimal();
        }

        response.addObject("userModelKey", animals);
        response.addObject("name", name);
        return response;
    }

    //get animal details
    @RequestMapping(value = "/animal/{id}/details", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Animal animal = animalDAO.getById(id);
        AnimalFormBean animalFormBean = new AnimalFormBean();
        animalFormBean.setId(animal.getId());
        animalFormBean.setName(animal.getName());
        animalFormBean.setAge(animal.getAge());
        animalFormBean.setGender(animal.getGender());
        animalFormBean.setWeight(animal.getWeight());
        animalFormBean.setDescription(animal.getDescription());
        animalFormBean.setSpeciesId(animal.getSpeciesId());

        response.addObject("animalFormBean", animalFormBean);

        User shelter = userDAO.getShelterById(animal.getShelterId());
        response.addObject("shelter", shelter);

        Adoption currentRescuerAdoption = adoptionService.getCurrentRescuerAdoptionByAnimal(animal);
        response.addObject("currentRescuerAdoption", currentRescuerAdoption);

        Boolean animalHasCompleteAdoption = adoptionService.doesCompleteAdoptionExistByAnimal(animal);
        response.addObject("animalHasCompleteAdoption", animalHasCompleteAdoption);

        Boolean rescuerHasOpenAdoption = adoptionService.doesRescuerHaveOpenAdoption();
        response.addObject("rescuerHasOpenAdoption", rescuerHasOpenAdoption);

        Boolean isCurrentUserShelterAndAnimalIsFromThere = adoptionService.isCurrentUserShelterAndAnimalIsFromThere(animal);
        response.addObject("isCurrentUserShelterAndAnimalIsFromThere", isCurrentUserShelterAndAnimalIsFromThere);

        response.setViewName("animal/details");
        return response;
    }

    // only shelter can edit the animal details and save it
    @PreAuthorize("hasAuthority('Shelter')")
    @RequestMapping(value = "/animal/{id}/detailsSubmit", method = RequestMethod.POST)
    public ModelAndView detailsSubmit(@PathVariable("id") Integer id, @Valid AnimalFormBean animalFormBean, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        Animal animal = animalDAO.getById(id);

        //TODO validation on edit animal, when field be empty the home page won't show the animal list anymore, and also won't show the message
        log.info(animalFormBean.toString());

        if (bindingResult.hasErrors()) {
            response.addObject("errorFields", bindingResult);
            response.addObject("animalFormBean", animalFormBean);

            User shelter = userDAO.getShelterById(animal.getShelterId());
            response.addObject("shelter", shelter);

            Adoption currentRescuerAdoption = adoptionService.getCurrentRescuerAdoptionByAnimal(animal);
            response.addObject("currentRescuerAdoption", currentRescuerAdoption);

            Boolean animalHasCompleteAdoption = adoptionService.doesCompleteAdoptionExistByAnimal(animal);
            response.addObject("animalHasCompleteAdoption", animalHasCompleteAdoption);

            Boolean rescuerHasOpenAdoption = adoptionService.doesRescuerHaveOpenAdoption();
            response.addObject("rescuerHasOpenAdoption", rescuerHasOpenAdoption);

            Boolean isCurrentUserShelterAndAnimalIsFromThere = adoptionService.isCurrentUserShelterAndAnimalIsFromThere(animal);
            response.addObject("isCurrentUserShelterAndAnimalIsFromThere", isCurrentUserShelterAndAnimalIsFromThere);

            response.setViewName("animal/details");
            return response;
        }


        // Check if animal exists by id
        if (animal == null) {
            return new ModelAndView("redirect:/");
        }

        // Check if animal exists in current shelter, else return home
        Boolean isCurrentUserShelterAndAnimalIsFromThere = adoptionService.isCurrentUserShelterAndAnimalIsFromThere(animal);
        if (!isCurrentUserShelterAndAnimalIsFromThere) {
            return new ModelAndView("redirect:/");
        }

        animal.setName(animalFormBean.getName());
        animal.setAge(animalFormBean.getAge());
        animal.setGender(animalFormBean.getGender());
        animal.setWeight(animalFormBean.getWeight());
        animal.setSpeciesId(animalFormBean.getSpeciesId());
        animal.setDescription(animalFormBean.getDescription());
        animal.setUpdatedDate(new Date());

        this.animalDAO.save(animal);

        return new ModelAndView("redirect:/shelter/home");

    }

    //only current shelter can delete the current animal
    @PreAuthorize("hasAuthority('Shelter')")
    @RequestMapping(value = "/animal/{id}/delete", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") Integer id) throws Exception {

        Animal animal = animalDAO.getById(id);
        // Check if animal exists
        if (animal == null) {
            return new ModelAndView("redirect:/shelter/home");
        }
        this.animalDAO.delete(animal);
        return new ModelAndView("redirect:/shelter/home");

    }
}
