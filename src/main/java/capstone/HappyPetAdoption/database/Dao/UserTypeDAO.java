package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Animals;
import capstone.HappyPetAdoption.database.Entitys.User;
import capstone.HappyPetAdoption.database.Entitys.UserType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserTypeDAO extends JpaRepository<UserType, Long> {

    public UserType findById(@Param("id") Integer id);

}