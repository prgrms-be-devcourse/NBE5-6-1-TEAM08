package com.grepp.spring.app.model.user.dto;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class User {
    private Long id;
    private String username;
    private String email;
    private String phone;
    private String password;
    private String role;
    private LocalDateTime createdAt;
}