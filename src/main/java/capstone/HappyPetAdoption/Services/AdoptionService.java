package capstone.HappyPetAdoption.Services;

import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Animal;
import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
import capstone.HappyPetAdoption.database.Entitys.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Component
@Service
@RequiredArgsConstructor
public class AdoptionService {

    @Autowired
    private AdoptionDAO adoptionDAO;

    @Autowired
    private UserService userService;

    public Adoption requestAdoption(Integer animalId, Integer rescuerId, Integer shelterId)
    {
        Adoption adoption = new Adoption();

        adoption.setAnimalId(animalId);
        adoption.setRescuerId(rescuerId);
        adoption.setShelterId(shelterId);
        adoption.setOrderStatus(OrderStatusEnum.REQUESTED);

        return this.adoptionDAO.save(adoption);
    }

    public Adoption approveAdoption(Adoption adoption)
    {
        adoption.setOrderStatus(OrderStatusEnum.PENDING);
        return this.adoptionDAO.save(adoption);
    }

    public Adoption cancelAdoption(Adoption adoption)
    {
        adoption.setOrderStatus(OrderStatusEnum.CANCELED);
        return this.adoptionDAO.save(adoption);
    }

    public Adoption completeAdoption(Adoption adoption)
    {
        adoption.setOrderStatus(OrderStatusEnum.COMPLETED);
        return this.adoptionDAO.save(adoption);
    }

    // Check if this animal been adopted? get adoption by animalId
    public Boolean doesCompleteAdoptionExistByAnimal(Animal animal)
    {
        List<Adoption> adoptions = this.adoptionDAO.getAdoptionOrdersByAnimalId(animal.getId());

        for (Adoption adoption : adoptions)
        {
            if (adoption.getOrderStatus() == OrderStatusEnum.COMPLETED) {
                return true;
            }
        }

        return false;
    }

    //check if the rescuer have open adoption, get adoption by rescuerId
    public Boolean doesRescuerHaveOpenAdoption()
    {
        User user = userService.getCurrentUser();

        // User is not a rescuer, return null.
        if (user == null || user.getUserTypeId() != 1) {
            return null;
        }

        List<Adoption> adoptions = this.adoptionDAO.getAdoptionsByRescuerId(user.getId());

        for (Adoption adoption : adoptions)
        {
            if (adoption.getOrderStatus() == OrderStatusEnum.PENDING || adoption.getOrderStatus() == OrderStatusEnum.REQUESTED) {
                return true;
            }
        }

        return false;
    }

    // Returns true if the current user is a shelter and passed animal in parameter is from there too
    public Boolean isCurrentUserShelterAndAnimalIsFromThere(Animal animal)
    {
        User shelter = userService.getCurrentUser();

        if (shelter != null && animal.getShelterId() == shelter.getId()) {
            return true;
        }

        return false;
    }

    public Adoption getCurrentRescuerAdoptionByAnimal(Animal animal)
    {
        User user = userService.getCurrentUser();

        // User is not a rescuer, return null.
        if (user == null || user.getUserTypeId() != 1) {
            return null;
        }

        return adoptionDAO.getAdoptionByRescuerIdAndAnimalId(user.getId(), animal.getId());
    }

    public Adoption getAdoptionById(Integer id)
    {
        return this.adoptionDAO.getById(id);
    }

    public List<Adoption> getAdoptionsByShelterId(Integer shelterId)
    {
        return this.adoptionDAO.getAdoptionsByShelterId(shelterId);
    }

    public List<Adoption> getAdoptionsByRescuerId(Integer rescuerId)
    {
        return this.adoptionDAO.getAdoptionsByRescuerId(rescuerId);
    }


}
