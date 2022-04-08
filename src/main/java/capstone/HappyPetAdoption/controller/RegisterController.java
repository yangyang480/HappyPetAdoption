package capstone.HappyPetAdoption.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegisterController {
    @GetMapping(value = {"/register", "/register.html"})
    public String register() {
        return "register";
    }

}
