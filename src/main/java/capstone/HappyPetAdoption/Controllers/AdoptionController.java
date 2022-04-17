package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.AdoptionService;
import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdoptionController {

    @Autowired
    private AdoptionService adoptionService;

    @Autowired
    private AdoptionDAO adoptionDAO;

    @Autowired
    private AnimalDAO animalDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/adoption/cancel/{id}", method = RequestMethod.GET)
    public ModelAndView cancelAdoption(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Adoption adoption = adoptionDAO.getById(id);

        adoptionService.cancelAdoption(adoption);

        response.setViewName("redirect:/adoption/" + adoption.getId() + "/details");
        return response;
    }

    @RequestMapping(value = "/adoption/{id}/details", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Adoption adoption = adoptionDAO.getById(id);

        User shelter = userDAO.getShelterById(adoption.getShelterId());
        response.addObject("shelter", shelter);

        Animal animal = animalDAO.getById(adoption.getAnimalId());
        response.addObject("animal", animal);

        User rescuer = userDAO.getRescuerById(adoption.getRescuerId());
        response.addObject("rescuer", rescuer);

        response.addObject("adoptionId", adoption.getId());
        switch (adoption.getOrderStatus()) {
            case REQUESTED:
                response.addObject("orderStatus", "Requested");
                break;
            case PENDING:
                response.addObject("orderStatus", "Pending");
                break;
            case CANCELED:
                response.addObject("orderStatus", "Canceled");
                break;
            case COMPLETED:
                response.addObject("orderStatus", "Completed");
                break;
        }

        response.setViewName("adoption/details");
        return response;
    }

    @RequestMapping(value = "/adoption/request/{animalId}", method = RequestMethod.GET)
    public ModelAndView requestAdoption(@PathVariable("animalId") Integer animalId) throws Exception {
        ModelAndView response = new ModelAndView();

        Animal animal = animalDAO.getById(animalId);

        // Check if adoption exists, redirect to adoption details
        Adoption currentRescuerAdoption = adoptionService.getCurrentRescuerAdoptionByAnimal(animal);
        if (currentRescuerAdoption != null) {
            response.setViewName("redirect:/adoption/" + currentRescuerAdoption.getId() + "/details");
            return response;
        }

        // Adoption does not exist with current user, request adoption
        Adoption adoption = adoptionService.requestAdoption(animal.getId(), userService.getCurrentUser().getId(), animal.getShelterId());
        response.setViewName("redirect:/adoption/" + adoption.getId() + "/details");
        return response;
    }
}
