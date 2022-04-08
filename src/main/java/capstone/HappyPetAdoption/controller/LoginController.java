package capstone.HappyPetAdoption.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping(value = {"/login", "/login.html"})
    public String login() {
        return "login";
    }
}
