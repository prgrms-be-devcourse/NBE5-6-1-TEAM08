package com.grepp.spring.app.controller.web.user.form;

import com.grepp.spring.app.model.user.dto.Member;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class SignupForm {
    @NotBlank
    private String userId;
    @NotBlank
    @Size(min = 4, max = 10)
    private String password;
    @NotBlank
    @Email
    private String email;
    @NotBlank
    @Size(min = 4, max = 10)
    private String tel;

    public Member toDto(){
        Member member = new Member();
        member.setUserId(this.userId);
        member.setPassword(this.password);
        member.setEmail(this.email);
        member.setTel(this.tel);
        return member;
    }
}
