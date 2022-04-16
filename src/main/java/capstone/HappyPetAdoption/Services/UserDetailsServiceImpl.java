package capstone.HappyPetAdoption.Services;

import capstone.HappyPetAdoption.database.Dao.UserDAO;
import capstone.HappyPetAdoption.database.Dao.UserTypeDAO;
import capstone.HappyPetAdoption.database.Entitys.User;
import capstone.HappyPetAdoption.database.Entitys.UserType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {

    public static final Logger LOG = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserTypeDAO userTypeDAO;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.findByEmail(username); //get user from db

        if (user == null) {
            throw new UsernameNotFoundException("Username '" + username + "' not found in database");
        }

        List<UserType> userTypes = new ArrayList<>();
        userTypes.add(userTypeDAO.findById(user.getUserTypeId()));

        // check the account status
        boolean accountIsEnabled = true; //user.isActive()
        boolean accountNonExpired = true; // spring security configs
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;

        // setup user roles
        Collection<? extends GrantedAuthority> springRoles = buildGrantAuthorities(userTypes);

        String password = user.getPassword();//get the encrypted password from the database

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(), user.getPassword(),
                accountIsEnabled, accountNonExpired,
                credentialsNonExpired,
                accountNonLocked, springRoles);
    }

    private Collection<? extends GrantedAuthority> buildGrantAuthorities(List<UserType> userTypes) {

        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (UserType userType : userTypes) {
            authorities.add(new SimpleGrantedAuthority(userType.getUserType()));
        }
        return authorities;
    }
}