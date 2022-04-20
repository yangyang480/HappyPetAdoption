package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.ProfileFormBean;
import capstone.HappyPetAdoption.Services.UserService;
import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Dao.AnimalDAO;
import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import static capstone.HappyPetAdoption.Extensions.OrderStatusExtension.OrderStatusString;

@Slf4j
@Controller
public class ProfileController {

    @Autowired
    private AdoptionDAO adoptionDAO;

    @Autowired
    private AnimalDAO animalDAO;

    @Autowired
    private UserService userService;

    @Autowired
    private UserDAO userDAO;

    @PreAuthorize("hasAuthority('Rescuer')")
    @RequestMapping(value = "/user/adoptions", method = RequestMethod.GET)
    public ModelAndView adoptions() throws Exception
    {
        ModelAndView response = new ModelAndView();

        List<Adoption> adoptions = adoptionDAO.getAdoptionsByRescuerId(userService.getCurrentUser().getId());

        List<Map<String, Object>> adoptionObjectList = new ArrayList<>();

        for (Adoption adoption: adoptions) {
            Map<String, Object> adoptionMap = new HashMap<>();
            adoptionMap.put("adoption", adoption);
            adoptionMap.put("animal", animalDAO.getById(adoption.getAnimalId()));
            adoptionMap.put("rescuer", userDAO.getById(adoption.getRescuerId()));
            adoptionMap.put("orderStatus", OrderStatusString(adoption.getOrderStatus()));

            adoptionObjectList.add(adoptionMap);
        }

        response.addObject("adoptionObjectList", adoptionObjectList);
        response.setViewName("/user/adoptions");
        return response;
    }

    @RequestMapping(value = "/user/profile", method = RequestMethod.GET)
    public ModelAndView profile(ProfileFormBean profileFormBean) throws Exception
    {
        ModelAndView response = new ModelAndView();

        User user = this.userService.getCurrentUser();
        profileFormBean.setEmail(user.getEmail());
        profileFormBean.setName(user.getName());
        profileFormBean.setAddress(user.getAddress());
        profileFormBean.setCity(user.getCity());
        profileFormBean.setState(user.getState());
        profileFormBean.setZipcode(user.getZipcode());
        profileFormBean.setPhone(user.getPhone());
        profileFormBean.setUserTypeId(user.getUserTypeId());

        if (user.getUserTypeId() == 1) {
            List<Adoption> adoptions = this.adoptionDAO.getAdoptionsByRescuerId(user.getId());

            for (Adoption adoption : adoptions)
            {
                if (adoption.getOrderStatus() == OrderStatusEnum.PENDING || adoption.getOrderStatus() == OrderStatusEnum.REQUESTED) {
                    response.addObject("currentAdoption", adoption);
                    break;
                }
            }
        }

        response.setViewName("/user/profile");
        return response;
    }

    //edit the profile
    @RequestMapping(value = "/user/profileSubmit", method = RequestMethod.POST)
    public ModelAndView profileSubmit(ProfileFormBean profileFormBean) throws Exception {

        User user = this.userService.getCurrentUser();

        user.setEmail(profileFormBean.getEmail());
        user.setName(profileFormBean.getName());
        user.setAddress(profileFormBean.getAddress());
        user.setCity(profileFormBean.getCity());
        user.setState(profileFormBean.getState());
        user.setZipcode(profileFormBean.getZipcode());
        user.setPhone(profileFormBean.getPhone());
        user.setUpdatedDate(new Date());

        this.userService.save(user);

        return new ModelAndView("redirect:/");
    }

}