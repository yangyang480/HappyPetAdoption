package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.AdoptionService;
import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import static capstone.HappyPetAdoption.Extensions.OrderStatusExtension.OrderStatusString;

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

    @PreAuthorize("hasAuthority('Rescuer')")
    @RequestMapping(value = "/adoption/request/animal/{animalId}", method = RequestMethod.GET)
    public ModelAndView adoptionRequest(@PathVariable("animalId") Integer animalId) throws Exception {
        ModelAndView response = new ModelAndView();

        Animal animal = animalDAO.getById(animalId);

        if (animal == null) {
            response.setViewName("redirect:/");
            return response;
        }

        // Check if adoption exists, redirect to adoption details
        Adoption currentRescuerAdoption = adoptionService.getCurrentRescuerAdoptionByAnimal(animal);
        if (currentRescuerAdoption != null) {
            response.setViewName("redirect:/adoption/" + currentRescuerAdoption.getId() + "/details");
            return response;
        }

        // Check if animal does not have existing completed adoption, redirect to animal details
        if (adoptionService.doesCompleteAdoptionExistByAnimal(animal)) {
            response.setViewName("redirect:/animal/" + animalId + "/details");
            return response;
        }

        // Adoption does not exist with current user, request adoption
        Adoption adoption = adoptionService.requestAdoption(animal.getId(), userService.getCurrentUser().getId(), animal.getShelterId());
        response.setViewName("redirect:/adoption/" + adoption.getId() + "/details");
        return response;
    }

    //call the approveAdoption from adoption service
    @PreAuthorize("hasAuthority('Shelter')")
    @RequestMapping(value = "/adoption/{id}/approve", method = RequestMethod.GET)
    public ModelAndView adoptionApprove(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Adoption adoption = adoptionDAO.getById(id);
        User user = userService.getCurrentUser();

        // Do not set to approve if adoption is not in requested status
        if (adoption == null || user == null || user.getId() != adoption.getShelterId() || adoption.getOrderStatus() != OrderStatusEnum.REQUESTED) {
            response.setViewName("redirect:/");
            return response;
        }

        adoptionService.approveAdoption(adoption);

        response.setViewName("redirect:/adoption/" + adoption.getId() + "/details");
        return response;
    }

    @RequestMapping(value = "/adoption/{id}/cancel", method = RequestMethod.GET)
    public ModelAndView adoptionCancel(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Adoption adoption = adoptionDAO.getById(id);
        User user = userService.getCurrentUser();

        // Can't cancel a completed or canceled adoption
        if (adoption == null || (adoption.getOrderStatus() != OrderStatusEnum.REQUESTED && adoption.getOrderStatus() != OrderStatusEnum.PENDING)||
                // Check if current user is not adoption shelter or rescuer, redirect to home since should not have access
                user.getId() != adoption.getRescuerId() && user.getId() != adoption.getShelterId()) {
            response.setViewName("redirect:/");
            return response;
        }

        adoptionService.cancelAdoption(adoption);

        response.setViewName("redirect:/adoption/" + adoption.getId() + "/details");
        return response;
    }

    @PreAuthorize("hasAuthority('Shelter')")
    @RequestMapping(value = "/adoption/{id}/complete", method = RequestMethod.GET)
    public ModelAndView adoptionComplete(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Adoption adoption = adoptionDAO.getById(id);
        User user = userService.getCurrentUser();
        Animal animal = animalDAO.getById(adoption.getAnimalId());

        if (adoption == null || user == null || animal == null || user.getId() != adoption.getShelterId() || adoption.getOrderStatus() != OrderStatusEnum.PENDING ||
                adoptionService.doesCompleteAdoptionExistByAnimal(animal)) {
            response.setViewName("redirect:/");
            return response;
        }

        adoptionService.completeAdoption(adoption);

        response.setViewName("redirect:/adoption/" + adoption.getId() + "/details");
        return response;
    }

    @RequestMapping(value = "/adoption/{id}/details", method = RequestMethod.GET)
    public ModelAndView details(@PathVariable("id") Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        Adoption adoption = adoptionDAO.getById(id);
        User currentUser = userService.getCurrentUser();

        // Check if current user is not adoption shelter or rescuer, redirect to home since should not have access
        if (currentUser.getId() != adoption.getRescuerId() && currentUser.getId() != adoption.getShelterId()) {
            response.setViewName("redirect:/");
            return response;
        }

        response.addObject("currentUserIsShelter", currentUser.getUserTypeId() == 0 ? true : false);
        response.addObject("currentUserIsRescuer", currentUser.getUserTypeId() == 1 ? true : false);

        User shelter = userDAO.getShelterById(adoption.getShelterId());
        response.addObject("shelter", shelter);

        Animal animal = animalDAO.getById(adoption.getAnimalId());
        response.addObject("animal", animal);

        User rescuer = userDAO.getRescuerById(adoption.getRescuerId());
        response.addObject("rescuer", rescuer);

        response.addObject("adoptionId", adoption.getId());

        response.addObject("orderStatus", OrderStatusString(adoption.getOrderStatus()));

        response.setViewName("adoption/details");
        return response;
    }
}
