package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Animal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface AnimalDAO extends JpaRepository<Animal, Integer> {

    public Animal findById(@Param("id") Integer id);

    //get list of animals group by shelterId
    @Query(value = "select a from Animal a where a.shelterId = :shelterId")
    public List<Animal> findAnimalsByShelterId(@Param("shelterId") Integer shelterId);
}
