package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import java.util.List;

@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class AdoptionDAOTests {

    @Autowired
    private AdoptionDAO adoptionDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private AnimalDAO animalDAO;

    @Test
    @Order(1)
    @Rollback()
    public void getAdoptionOrdersByAnimalIdTest() {
        // Rescuer
        User user1 = new User();
        user1.setEmail("Yang@gamil.com");
        user1.setPassword("Yang@gamil.com");
        user1.setName("YY");
        user1.setUserTypeId(1);
        user1.setAddress("Hahabala");
        user1.setCity("QHD");
        user1.setState("MN");
        user1.setZipcode("09876");
        user1.setPhone("0987654321");

        userDAO.save(user1);

        //shelter
        User user2 = new User();
        user2.setEmail("Yangyang1@gamil.com");
        user2.setPassword("Yangyang1@gamil.com");
        user2.setName("Yangyangs shelter");
        user2.setUserTypeId(0);
        user2.setAddress("Minnetonka");
        user2.setCity("Minneapolis");
        user2.setState("MN");
        user2.setZipcode("55437");
        user2.setPhone("7894564567");

        userDAO.save(user2);

        Animal animal = new Animal();
        animal.setName("Haha");
        animal.setAge(1);
        animal.setGender("Male");
        animal.setWeight(20.3);
        animal.setSpeciesId(1);
        animal.setShelterId(1);
        animal.setDescription("Cute dog");
        animal.setImgURL("https://placekitten.com/401/401");

        animalDAO.save(animal);

        Adoption adoption = new Adoption();
        adoption.setAnimalId(animal.getId());
        adoption.setRescuerId(user1.getId());
        adoption.setShelterId(user2.getId());
        adoption.setOrderStatus(OrderStatusEnum.REQUESTED);

        Adoption expectedAdoption = adoptionDAO.save(adoption);

        List<Adoption> actualAdoptions = adoptionDAO.getAdoptionOrdersByAnimalId(expectedAdoption.getAnimalId());

        Assertions.assertThat(actualAdoptions.get(0)).isEqualTo(expectedAdoption);
    }

    @Test
    @Order(2)
    @Rollback()
    public void getAdoptionsByShelterIdTest() {
        // Rescuer
        User user1 = new User();
        user1.setEmail("Yang@gamil.com");
        user1.setPassword("Yang@gamil.com");
        user1.setName("YY");
        user1.setUserTypeId(1);
        user1.setAddress("Hahabala");
        user1.setCity("QHD");
        user1.setState("MN");
        user1.setZipcode("09876");
        user1.setPhone("0987654321");

        userDAO.save(user1);

        //shelter
        User user2 = new User();
        user2.setEmail("Yangyang1@gamil.com");
        user2.setPassword("Yangyang1@gamil.com");
        user2.setName("Yangyangs shelter");
        user2.setUserTypeId(0);
        user2.setAddress("Minnetonka");
        user2.setCity("Minneapolis");
        user2.setState("MN");
        user2.setZipcode("55437");
        user2.setPhone("7894564567");

        userDAO.save(user2);

        Animal animal = new Animal();
        animal.setName("Haha");
        animal.setAge(1);
        animal.setGender("Male");
        animal.setWeight(20.3);
        animal.setSpeciesId(1);
        animal.setShelterId(1);
        animal.setDescription("Cute dog");
        animal.setImgURL("https://placekitten.com/401/401");

        animalDAO.save(animal);

        Adoption adoption = new Adoption();
        adoption.setAnimalId(animal.getId());
        adoption.setRescuerId(user1.getId());
        adoption.setShelterId(user2.getId());
        adoption.setOrderStatus(OrderStatusEnum.REQUESTED);

        Adoption expectedAdoption = adoptionDAO.save(adoption);

        List<Adoption> actualAdoptions = adoptionDAO.getAdoptionsByShelterId(expectedAdoption.getShelterId());

        Assertions.assertThat(actualAdoptions.get(0)).isEqualTo(expectedAdoption);
    }



}
