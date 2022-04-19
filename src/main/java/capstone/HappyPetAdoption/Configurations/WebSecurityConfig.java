package capstone.HappyPetAdoption.Configurations;

import capstone.HappyPetAdoption.Services.UserDetailsServiceImpl;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private final UserDetailsServiceImpl userDetailsService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf()
                .disable()
                .authorizeRequests()
                .antMatchers("/",
                        "/animal/*/details",
                        "/animals",
                        "/shelter/*/details",
                        "/shelter/home",
                        "/shelters",
                        "/error",
                        "/error/*",
                        "/home",
                        "/pub/font/*",
                        "/pub/images/*",
                        "/pub/js/*",
                        "/pub/style/*",
                        "/pub/style/shelter/*",
                        "/pub/docs/*",
                        "/user/login*",
                        "/user/register*").permitAll()
                .anyRequest().authenticated()
                .and()
                    .formLogin()
                    .loginPage("/user/login")
                    .usernameParameter("email") // https://stackoverflow.com/questions/50673400/how-to-log-in-by-email-instead-of-username-in-spring-security
                    .loginProcessingUrl("/user/loginSubmit") //tell spring security where to listen
                    .defaultSuccessUrl("/user/loginSuccess", true) //if login successful go to the home page
                    .permitAll()
                .and()
                    .logout()
                    .logoutUrl("/user/logout")
                    .invalidateHttpSession(true)
                    .logoutSuccessUrl("/")
                    .permitAll() // the URL that the user goes to after they log out.
                .and()
                    .exceptionHandling()
                    .accessDeniedPage("/error/404");
    }


    @Bean
    public DaoAuthenticationProvider getAuthenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(getPasswordEncoder());
        return authProvider;
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
        auth.authenticationProvider(getAuthenticationProvider());
    }

    @Bean(name = "passwordEncoder")
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
