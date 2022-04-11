package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entitys.Animals;
import capstone.HappyPetAdoption.database.Entitys.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    public User findById(@Param("id") Integer id);

    @Query(value = "select * from User where email = :email", nativeQuery = true)
    public User findByEmail(@Param("email") String email);

    //find user by user type
    @Query(value = "select u from  User u where u.userTypeID = : userTypeID", nativeQuery = true)
    public User findByUserType(@Param("userTypeID") Integer userTypeID);

    //get list of animals group by shelterId
    @Query(value = "select a from Animal a where a.ShelterId = : ShelterId", nativeQuery = true)
    public List<Animals> findByShelterId(@Param("ShelterId") Integer ShelterId);

    // select * from user where upper(first_name) like '%:firstName%';
    //public List<Users> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    //public List<Users> findByFirstNameAndLastName(@Param("firstName") String firstName, @Param("lastName") String lastName);


}