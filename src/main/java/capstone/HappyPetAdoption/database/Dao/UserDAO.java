package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    @Query(value = "select u from User u where u.userTypeId = 0")
    public List<User> getAllShelters();

    public User findById(@Param("id") Integer id);

    @Query(value = "select * from User where email = :email", nativeQuery = true)
    public User findByEmail(@Param("email") String email);

    @Query(value = "select u from User u where u.id = :id AND u.userTypeId = 0")
    public User getShelterById(@Param("id") Integer id);

    //get list of shelters
    @Query(value = "select u from User u where u.userTypeId = 0 AND u.name like CONCAT('%',:name,'%')")
    public List<User> findShelterByNameIgnoreCase(@Param("name") String name);


    // select * from user where upper(first_name) like '%:firstName%';
    //public List<Users> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    //public List<Users> findByFirstNameAndLastName(@Param("firstName") String firstName, @Param("lastName") String lastName);


}