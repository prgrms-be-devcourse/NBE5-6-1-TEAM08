package com.grepp.spring.app.model.user.dto;

import com.grepp.spring.app.model.user.code.Role;
import java.time.LocalDateTime;
import java.util.List;

public record Principal(
    String userId,
    List<Role> Roles,
    LocalDateTime loginedAt
) {
    
    public static final Principal ANONYMOUS = new Principal(
        "anonymous",
        List.of(Role.ANONYMOUS),
        LocalDateTime.now());
}
