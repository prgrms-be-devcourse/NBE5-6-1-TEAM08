package com.grepp.spring.app.model.user.dto;

import java.time.LocalDateTime;
import lombok.Data;

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