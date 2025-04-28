package com.grepp.spring.app.controller.web.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    @GetMapping({"/member/signin", "/member/signin.jsp"})
    public String signin() {
        return "member/signin";
    }

    @GetMapping({"/member/signup", "/member/signup.jsp"})
    public String signup() {
        return "member/signup";
    }
} 