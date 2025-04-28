package com.grepp.spring.app.controller.api.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage() {
        // login.jsp
        return "login";
    }

    @PostMapping("/login")
    public String successfulLogin() {
        return "index";
    }

    @GetMapping("/signup")
    public String showSignupPage() {
        return "view/signup";
    }
}
