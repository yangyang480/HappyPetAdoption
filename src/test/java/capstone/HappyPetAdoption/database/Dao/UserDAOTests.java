package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.User;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import java.util.*;

@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class UserDAOTests {

    @Autowired
    private UserDAO userDAO;

    @Test
    @Order(1)
    @Rollback(value = false)
    public void saveUserTest() {

        User user = new User();
        List<User> users = new ArrayList<>();

        users.add(user);
        User user1 = User.builder().email("Yang1@gmail.com")
                .password("Yang1@gmail.com")
                .name("YANGYANG")
                .userTypeId(0)
                .address("st louis park")
                .city("minneapolis")
                .state("MN")
                .zipcode("55426")
                .phone("1234567890")
                .build();

        userDAO.save(user1);
        Assertions.assertThat(user1.getId()).isGreaterThan(0);
    }

    @Test
    @Order(2)
    public void getUserTest() {
        User user = userDAO.getById(1);
        Assertions.assertThat(user.getId()).isEqualTo(1);
    }

    @Test
    @Order(3)
    public void getListOfUsers() {
        List<User> users = userDAO.findAll();
        Assertions.assertThat(users.size()).isGreaterThan(0);
    }

    @Test
    @Order(4)
    @Rollback(value = false)
    public void updateUserTest() {
        User user = userDAO.getById(1);
        user.setName("YangyangNew");
        Assertions.assertThat(userDAO.getById(1).getName()).isEqualTo(user.getName());
    }

    @Test
    @Order(5)
    @Rollback(value = false)
    public void deleteUserTest() {
        User user = userDAO.findByEmail("Yang1@gmail.com");
        userDAO.delete(user);
        Optional<User> optionalUser = Optional.ofNullable(userDAO.findByEmail(user.getEmail()));

        User tempUser = null;
        if (optionalUser.isPresent()) {
            tempUser = optionalUser.get();
        }

        Assertions.assertThat(tempUser).isNull();
    }

}
