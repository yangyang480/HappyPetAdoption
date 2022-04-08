package capstone.HappyPetAdoption.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HospitalController {
    @GetMapping(value = {"/hospital", "/hospital.html"})
    public String hospital() {
        return "hospital";
    }
}
