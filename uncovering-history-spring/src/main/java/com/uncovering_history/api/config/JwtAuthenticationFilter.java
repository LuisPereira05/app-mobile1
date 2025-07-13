package com.uncovering_history.api.config;

import java.io.IOException;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import com.uncovering_history.api.model.User;
import com.uncovering_history.api.service.UserService;
import com.uncovering_history.api.utils.Token;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final Token tokenUtil;
    private final UserService userService;

    public JwtAuthenticationFilter(Token tokenUtil, UserService userService) {
        this.tokenUtil = tokenUtil;
        this.userService = userService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        final String authHeader = request.getHeader("Authorization");
        System.out.println("Authorization header: " + authHeader);
        String jwt = null;
        String username = null;

        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            jwt = authHeader.substring(7);
            try {
                username = tokenUtil.extractUsername(jwt);
                System.out.println("Extracted username from token: " + username);
            } catch (Exception e) {
                System.out.println("Token inválido: " + e.getMessage());
            }
        } else {
            System.out.println("Header Authorization ausente ou inválido");
        }

        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            User user = userService.findByEmail(username);
            System.out.println("User from DB: " + (user != null ? user.getUsername() : "null"));
            if (user != null && tokenUtil.validateToken(jwt, user)) {
                System.out.println("Token válido para usuário: " + user.getUsername());
                UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(
                        user, null, user.getAuthorities());
                authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authToken);
            } else {
                System.out.println("Token inválido ou usuário não encontrado");
            }
        }

        filterChain.doFilter(request, response);
    }
}