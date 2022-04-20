package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.AnimalSpecies;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpeciesDAO extends JpaRepository<AnimalSpecies, Long> {

    //get animals by speciesId
    @Query(value = "select a from Animal a where a.speciesId = :speciesId")
    public List<Animal> findAnimalsBySpeciesId(@Param("speciesId") Integer speciesId);

}
