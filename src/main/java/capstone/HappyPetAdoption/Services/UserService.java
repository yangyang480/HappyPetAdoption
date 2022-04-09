package capstone.HappyPetAdoption.Services;

import capstone.HappyPetAdoption.database.Dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDAO userDao;
}