package com.uncovering_history.api.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.uncovering_history.api.service.UserService;
import com.uncovering_history.api.utils.Token;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private Token tokenUtil;

    @Autowired
    private UserService userService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .csrf(csrf -> csrf.disable())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(HttpMethod.POST, "/api/auth/login").permitAll()
                        .requestMatchers(HttpMethod.POST, "/api/auth/register").permitAll()

                        .requestMatchers(HttpMethod.DELETE, "/api/users").hasRole("admin")
                        .requestMatchers(HttpMethod.GET, "/api/users").hasRole("admin")
                        .requestMatchers(HttpMethod.PUT, "/api/users").authenticated()
                        .requestMatchers(HttpMethod.GET, "/api/users/me").authenticated()

                        .requestMatchers(HttpMethod.POST, "/api/elements").hasRole("admin")
                        .requestMatchers(HttpMethod.DELETE, "/api/elements").hasRole("admin")
                        .requestMatchers(HttpMethod.PUT, "/api/elements").hasRole("admin")
                        .requestMatchers(HttpMethod.GET, "/api/elements").permitAll()
                        .requestMatchers(HttpMethod.PUT, "/api/elements/**").hasRole("admin")
                        .requestMatchers(HttpMethod.GET, "/api/elements/search").permitAll()

                        .requestMatchers(HttpMethod.POST, "/api/interest-points").hasRole("admin")
                        .requestMatchers(HttpMethod.DELETE, "/api/interest-points").hasRole("admin")
                        .requestMatchers(HttpMethod.PUT, "/api/interest-points").hasRole("admin")
                        .requestMatchers(HttpMethod.PUT, "/api/interest-points/**").hasRole("admin")
                        .requestMatchers(HttpMethod.GET, "/api/interest-points").permitAll()

                )
                .addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class)
                .build();
    };

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter(tokenUtil, userService);
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
