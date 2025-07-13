package com.uncovering_history.api.model;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Document(collection = "user")
public class User implements UserDetails {

    @Id
    private String _id;
    @NonNull
    private String name;
    @NonNull
    private String surname;
    @NonNull
    private String email;
    @NonNull
    private String password;

    private Optional<String> photo;
    private String salt;
    private String role;

    public User(String name, String surname, String email, String password, String role) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    @JsonCreator
    public User(
            @JsonProperty("name") String name,
            @JsonProperty("surname") String surname,
            @JsonProperty("email") String email,
            @JsonProperty("password") String password

    ) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.role = "user";
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_" + role));
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true; // UserDetails.super.isAccountNonExpired();
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true; // UserDetails.super.isAccountNonLocked();
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true; // UserDetails.super.isCredentialsNonExpired();
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true; // UserDetails.super.isEnabled();
    }

}
