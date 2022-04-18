package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.AnimalFormBean;
import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;

@Slf4j
@Controller
@PreAuthorize("hasAuthority( 'Shelter')") //only shelter can view create/edit/delete animal page.
public class ManageController {

    @Autowired
    private AnimalDAO animalDAO;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/shelter/manage/animal", method = RequestMethod.GET)
    public ModelAndView manageAnimal(AnimalFormBean animalFormBean) throws Exception {

        ModelAndView response = new ModelAndView();
        response.setViewName("shelter/manage");

        return response;
    }

    //TODO shelter/manage/AcceptAdoption/{id}
    @RequestMapping(value = "/shelter/create/animal", method = RequestMethod.POST)
    public ModelAndView manageAnimalSubmit(@Valid AnimalFormBean animalFormBean, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        User user = userService.getCurrentUser();

        log.info(animalFormBean.toString());

        if (bindingResult.hasErrors()) {
            //show all the input
            response.addObject("formbean", animalFormBean);
            //add the errors to display
            response.addObject("bindingResult", bindingResult);
            response.setViewName("shelter/manage");
            return response;
        }

        Integer animalId = animalFormBean.getId();
        Animal animal = new Animal();;
        if (animalId != null) {
            animal = animalDAO.getById(animalFormBean.getId());
        }
        if (animal == null) {
            animal = new Animal();
            animal.setCreatedDate(new Date());
        }

        animal.setId(animalFormBean.getId());
        animal.setName(animalFormBean.getName());
        animal.setAge(animalFormBean.getAge());
        animal.setGender(animalFormBean.getGender());
        animal.setWeight(animalFormBean.getWeight());
        animal.setSpeciesId(animalFormBean.getSpeciesId());
        animal.setShelterId(user.getId());
        animal.setDescription(animalFormBean.getDescription());
//        animal.setStatus(manageAnimalFormBean.getStatus()); Future work
        animal.setUpdatedDate(new Date());

        animalDAO.save(animal);

        log.info(animalFormBean.toString());
        response.setViewName("redirect:/shelter/home");
        return response;
    }

}
