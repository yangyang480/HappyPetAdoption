package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.Services.AdoptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdoptionController {

    @Autowired
    private AdoptionService adoptionService;

    @RequestMapping(value = "/adoption/request", method = RequestMethod.GET)
    public ModelAndView requestAdoption() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("animals");

        return response;
    }
}
