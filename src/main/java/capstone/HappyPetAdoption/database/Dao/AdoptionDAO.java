package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Adoption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdoptionDAO extends JpaRepository<Adoption, Integer> {

    @Query(value = "select a from Adoption a where a.shelterId = : shelterId", nativeQuery = true)
    public List<Adoption> getAdoptionsByShelterId(@Param("shelterId") Integer shelterId);

    @Query(value = "select a from Adoption a where a.rescuerId = : rescuerId", nativeQuery = true)
    public List<Adoption> getAdoptionsByRescuerId(@Param("rescuerId") Integer rescuerId);
}