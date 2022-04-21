package capstone.HappyPetAdoption.database.Dao;


import capstone.HappyPetAdoption.database.Entitys.Animal;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;


import java.util.Date;
import java.util.List;
import java.util.Optional;

@DataJpaTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
public class AnimalDAOTests {

    @Autowired
    private AnimalDAO animalDAO;

    @Test
    @Order(1)
    @Rollback(value = false)
    public void createAnimalTest() {

        Animal animal = Animal.builder().name("Yaya")
                .age(2)
                .gender("Female")
                .weight(20.0)
                .shelterId(1)
                .description("Yaya is cute")
                .speciesId(1)
                .imgURL("https://placekitten.com/401/401")
                .createdDate(new Date())
                .build();

        animalDAO.save(animal);
        Assertions.assertThat(animal.getId()).isGreaterThan(0);
    }

    @Test
    @Order(2)
    public void getAnimalTest() {

        Animal animal = animalDAO.findAnimalByNameIgnoreCase("Yaya").get(0);
        Assertions.assertThat(animal.getName()).isEqualTo("Yaya");
    }

    @Test
    @Order(3)
    public void getListOfAniamls() {
        List<Animal> animals = animalDAO.findAll();
        Assertions.assertThat(animals.size()).isGreaterThan(0);
    }

    @Order(4)
    @ParameterizedTest
    @ValueSource(strings = "y" )
    public void findAnimalByName(String name) {
        List<Animal> checkAnimal = animalDAO.findAnimalByNameIgnoreCase(name);
        Assertions.assertThat(checkAnimal.get(0).getName().equals(name));
    }

    @Test
    @Order(5)
    @Rollback(value = false)
    public void updateAnimalTest() {
        Animal animal = animalDAO.findAnimalByNameIgnoreCase("Yaya").get(0);
        animal.setName("YayaNew");
        Assertions.assertThat(animalDAO.findAnimalByNameIgnoreCase("YayaNew").get(0).getName()).isEqualTo(animal.getName());
    }

    @Test
    @Order(6)
    @Rollback(value = false)
    public void deleteAnimalTest() {
        Animal animal = animalDAO.findAnimalByNameIgnoreCase("YayaNew").get(0);
        animalDAO.delete(animal);
        Optional<Animal> optionalAnimal = animalDAO.findById(animal.getId());

        Animal tempAnimal = null;
        if (optionalAnimal.isPresent()) {
            tempAnimal = optionalAnimal.get();
        }

        Assertions.assertThat(tempAnimal).isNull();
    }

}
