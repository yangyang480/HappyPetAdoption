package capstone.HappyPetAdoption.Services;

import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Entitys.User;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Component
@Service
@RequiredArgsConstructor
public class UserService {

    @Autowired
    private UserDAO userDAO;

    //get current logged-in user detail. in order to edit, and save it.
    public User getCurrentUser()
    {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth instanceof AnonymousAuthenticationToken) {
            return null;
        }

        org.springframework.security.core.userdetails.User principal
                = (org.springframework.security.core.userdetails.User) auth.getPrincipal();

        User user = this.userDAO.findByEmail(principal.getUsername());

        return user;
    }

    public boolean isCurrentUser(User user) {
        User currentUser = getCurrentUser();

        if (user == null || currentUser == null)
        {
            return false;
        }

        return user.getId().equals(getCurrentUser().getId());
    }

    public User save(User user) {
        return userDAO.save(user);
    }
}
