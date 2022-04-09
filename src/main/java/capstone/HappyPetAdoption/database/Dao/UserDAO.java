package capstone.HappyPetAdoption.database.Dao;

import capstone.HappyPetAdoption.database.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    public User findById(@Param("id") Integer id);

    @Query(value = "select * from users where email = :email", nativeQuery = true)
    public User findByEmail(@Param("email") String email);

    // select * from user where upper(first_name) like '%:firstName%';
    //public List<Users> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    //public List<Users> findByFirstNameAndLastName(@Param("firstName") String firstName, @Param("lastName") String lastName);


}