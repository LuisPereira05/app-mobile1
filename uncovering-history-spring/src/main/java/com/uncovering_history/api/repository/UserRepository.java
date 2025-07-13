package com.uncovering_history.api.repository;

import com.uncovering_history.api.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;
// import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends MongoRepository<User, String> {
    User findByEmail(String email);
}
