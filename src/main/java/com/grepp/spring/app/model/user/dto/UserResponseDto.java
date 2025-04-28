package com.grepp.spring.app.model.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class UserResponseDto {
    private String username;
    private String email;
    private String phone;
}