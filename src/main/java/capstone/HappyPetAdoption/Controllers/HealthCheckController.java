package capstone.HappyPetAdoption.Controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/api/health")
public class HealthCheckController {

    @GetMapping()
    public ResponseEntity<String> HealthCheck() throws Exception {
        return new ResponseEntity<>("Healthy", HttpStatus.OK);
    }
}
