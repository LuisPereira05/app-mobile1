package com.uncovering_history.api.utils;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Map;

import javax.crypto.SecretKey;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import com.uncovering_history.api.model.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.annotation.PostConstruct;

@Component
@Configuration
@ConfigurationProperties(prefix = "jwt")
public class Token {

    private String secret;
    private long expirationMs = 86400000;

    private SecretKey key;
    private JwtParser jwtParser;

    @PostConstruct
    public void init() {
        if (secret == null) {
            throw new IllegalArgumentException("JWT secret is not configured.");
        }
        this.key = Keys.hmacShaKeyFor(secret.getBytes(StandardCharsets.UTF_8));

        this.jwtParser = Jwts.parser().setSigningKey(this.key).build();
    }

    public String generateToken(String subject, Map<String, Object> claims) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + expirationMs);

        return Jwts.builder()
                .subject(subject)
                .claims(claims)
                .issuedAt(now)
                .expiration(expiryDate)
                .signWith(key)
                .compact();
    }

    public Claims validateToken(String token) {
        return jwtParser.parseSignedClaims(token).getPayload();
    }

    public String getSubject(String token) {
        return validateToken(token).getSubject();
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public Claims parseClaims(String token) {
        try {
            Jws<Claims> jwsClaims = jwtParser.parseClaimsJws(token);
            return jwsClaims.getBody();
        } catch (JwtException e) {
            throw new RuntimeException("Invalid JWT token", e);
        }
    }

    public String extractUsername(String token) {
        return parseClaims(token).getSubject();
    }

    public boolean isTokenExpired(String token) {
        Date expiration = parseClaims(token).getExpiration();
        return expiration.before(new Date());
    }

    public void setExpirationMs(long expirationMs) {
        this.expirationMs = expirationMs;
    }

    public boolean validateToken(String token, User user) {
        try {
            String username = extractUsername(token);
            boolean isExpired = isTokenExpired(token);
            return (username.equals(user.getUsername()) && !isExpired);
        } catch (Exception e) {
            return false;
        }
    }
}
