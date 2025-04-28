package com.grepp.spring.app.controller.web.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {

    @GetMapping("/api/admin/test")
    public String adminOnly() {
        return "관리자 전용 페이지 접근 성공!";
    }
}