package com.uncovering_history.api.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.uncovering_history.api.model.User;
import com.uncovering_history.api.repository.UserRepository;
import com.uncovering_history.api.utils.Token;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private AuthenticationManager authenticationManager;

    private Token jwt;

    @Autowired
    private UserRepository userRepository;
    
    public AuthController(AuthenticationManager authenticationManager,Token jwt) {
        this.authenticationManager = authenticationManager;
        this.jwt = jwt;
    }

    @PostMapping("/login")
    public ResponseEntity<AuthDTO> login(@RequestBody AuthDTO data) {

        UsernamePasswordAuthenticationToken usernamePassword = new UsernamePasswordAuthenticationToken(data.email(),
                data.password());

        Authentication auth = this.authenticationManager.authenticate(usernamePassword);
        User user = (User) auth.getPrincipal();

        String token = jwt.generateToken(
                user.getEmail(),
                Map.of(
                        "name", user.getName(),
                        "surname", user.getSurname(),
                        "role", user.getRole()
                ));

        return ResponseEntity.ok(new AuthDTO(user.getEmail(), token));
    }

    

    @PostMapping("/register")
    public ResponseEntity<AuthDTO> register(@RequestBody User newUser) {
        if (userRepository.findByEmail(newUser.getEmail()) != null) {
            return ResponseEntity.badRequest().build();
        }

        User user = new User(
                newUser.getName(),
                newUser.getSurname(),
                newUser.getEmail(),
                new BCryptPasswordEncoder().encode(newUser.getPassword()));

        this.userRepository.save(user);


        String token = jwt.generateToken(
                user.getEmail(),
                Map.of(
                        "name", user.getName(),
                        "surname", user.getSurname()));

        return ResponseEntity.ok(new AuthDTO(user.getEmail(), token));
    }

}