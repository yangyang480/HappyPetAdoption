package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Adoption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdoptionDAO extends JpaRepository<Adoption, Integer> {

    @Query(value = "select a from Adoption a where a.animalId = :animalId")
    public List<Adoption> getAdoptionOrdersByAnimalId(@Param("animalId") Integer animalId);

    @Query(value = "select a from Adoption a where a.shelterId = :shelterId", nativeQuery = true)
    public List<Adoption> getAdoptionsByShelterId(@Param("shelterId") Integer shelterId);

    @Query(value = "select a from Adoption a where a.rescuerId = :rescuerId")
    public List<Adoption> getAdoptionsByRescuerId(@Param("rescuerId") Integer rescuerId);

    @Query(value = "select a from Adoption a where a.rescuerId = :rescuerId AND a.animalId = :animalId")
    public Adoption getAdoptionByRescuerIdAndAnimalId(@Param("rescuerId") Integer rescuerId, @Param("animalId") Integer animalId);
}