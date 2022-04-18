package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface AnimalDAO extends JpaRepository<Animal, Integer> {

    //get list of animals group by shelterId
    @Query(value = "select a from Animal a where a.shelterId = :shelterId")
    public List<Animal> findAnimalsByShelterId(@Param("shelterId") Integer shelterId);

    //get list of animals by name
    @Query(value = "select a from Animal a where a.name = :name AND a.name like CONCAT('%',:name,'%') AND a.shelterId = :shelterId")
    public List<Animal> findAnimalByNameIgnoreCaseAndShelterId(
            @Param("name") String name,
            @Param("shelterId") Integer shelterId);

//    @Query(value = "select a from Animal a where a.shelterId = :")
//    public List<Animal> getAllAnimals();

}
