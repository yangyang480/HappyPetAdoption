package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.AdoptionService;
import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnimalController {

    @Autowired
    private AdoptionService adoptionService;

    @Autowired
    private AnimalDAO animalDAO;

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/animals", method = RequestMethod.GET)
    public ModelAndView home() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("animals");

        return response;
    }

    @RequestMapping(value = "/animal/{id}/details", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Animal animal = animalDAO.getById(id);
        response.addObject("animal", animal);

        User shelter = userDAO.getShelterById(animal.getShelterId());
        response.addObject("shelter", shelter);

        Adoption currentRescuerAdoption = adoptionService.getCurrentRescuerAdoptionByAnimal(animal);
        response.addObject("currentRescuerAdoption", currentRescuerAdoption);

        Boolean animalHasCompleteAdoption = adoptionService.doesCompleteAdoptionExistByAnimal(animal);
        response.addObject("animalHasCompleteAdoption", animalHasCompleteAdoption);

        Boolean rescuerHasOpenAdoption = adoptionService.doesRescuerHaveOpenAdoption();
        response.addObject("rescuerHasOpenAdoption", rescuerHasOpenAdoption);

        response.setViewName("animal/details");
        return response;
    }
}
