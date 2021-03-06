package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Integer> {

    @Query(value = "select * from User where email = :email", nativeQuery = true)
    public User findByEmail(@Param("email") String email);

    @Query(value = "select u from User u where u.id = :id AND u.userTypeId = 1")
    public User getRescuerById(@Param("id") Integer id);

    @Query(value = "select u from User u where u.id = :id AND u.userTypeId = 0")
    public User getShelterById(@Param("id") Integer id);

    @Query(value = "select u from User u where u.userTypeId = 0")
    public List<User> getAllShelters();

    //get list of shelters
    @Query(value = "select u from User u where u.userTypeId = 0 AND u.name like CONCAT('%',:name,'%')")
    public List<User> findShelterByNameIgnoreCase(@Param("name") String name);

}