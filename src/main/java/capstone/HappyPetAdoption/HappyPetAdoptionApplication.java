package capstone.HappyPetAdoption;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import java.io.Serializable;

@SpringBootApplication()
public class HappyPetAdoptionApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(HappyPetAdoptionApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(HappyPetAdoptionApplication.class, args);
	}

}
