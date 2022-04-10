package capstone.HappyPetAdoption.Controllers;

import capstone.HappyPetAdoption.FormBeans.RegisterFormBean;
import capstone.HappyPetAdoption.Managers.CustomAuthenticationManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Slf4j
@RequiredArgsConstructor
@Controller
public class LoginController {

    @Autowired
    private final CustomAuthenticationManager customAuthenticationManager;

    @RequestMapping(value = "/user/login", method = RequestMethod.GET)
    public ModelAndView login() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/login");

        return response;
    }

    @RequestMapping(value = "/user/loginSubmit", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@Valid RegisterFormBean formBean, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(formBean.toString());

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + " " + error.getDefaultMessage());
            }
            response.addObject("formbean", formBean);
            response.addObject("bindingResult", bindingResult);
            response.setViewName("user/login");
            return response;
        }

        try {
            SecurityContextHolder.getContext().setAuthentication(
                    customAuthenticationManager.authenticate(
                            new UsernamePasswordAuthenticationToken(formBean.getEmail(), formBean.getPassword())));
        } catch (AuthenticationException e) {
            throw new Exception("Invalid username and password.", e);
        }

        response.setViewName("redirect:/");
        return response;
    }
}
