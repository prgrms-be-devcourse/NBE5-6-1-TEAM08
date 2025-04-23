package com.grepp.spring.app.model.user.dto;

import com.grepp.spring.app.model.user.code.Role;
import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("Member")
public class Member {
    private String userId;
    private String password;
    private String email;
    private Role role;
    private String tel;
    private Boolean memberStatus;
}
