package com.grepp.spring.app.model.user.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PasswordChangeRequestDto {
    private String currentPassword;
    private String newPassword;
}