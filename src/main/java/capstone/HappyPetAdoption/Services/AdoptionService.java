package capstone.HappyPetAdoption.Services;

import capstone.HappyPetAdoption.database.Dao.AdoptionDAO;
import capstone.HappyPetAdoption.database.Entitys.Adoption;
import capstone.HappyPetAdoption.database.Entitys.Enums.OrderStatusEnum;
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

    public Adoption getAdoptionById(Long id)
    {
        return this.adoptionDAO.getById(id);
    }

    public List<Adoption> getAdoptionsByShelterId(Long shelterId)
    {
        return this.adoptionDAO.getAdoptionsByRescuerId(shelterId);
    }

    public List<Adoption> getAdoptionsByRescuerId(Long rescuerId)
    {
        return this.adoptionDAO.getAdoptionsByRescuerId(rescuerId);
    }

    public Adoption requestAdoption(Integer animalId, Integer rescuerId, Integer shelterId)
    {
        Adoption adoption = new Adoption();

        adoption.setAnimalId(animalId);
        adoption.setRescuerId(rescuerId);
        adoption.setShelterId(shelterId);
        adoption.setOrderStatus(OrderStatusEnum.REQUESTED);

        return this.adoptionDAO.save(adoption);
    }
}
