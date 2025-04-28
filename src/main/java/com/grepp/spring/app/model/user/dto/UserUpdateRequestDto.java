package com.grepp.spring.app.model.user.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserUpdateRequestDto {
    private String email;
    private String phone;
}