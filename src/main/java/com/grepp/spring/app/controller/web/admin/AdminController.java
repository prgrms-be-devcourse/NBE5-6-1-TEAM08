package com.grepp.spring.app.controller.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

    @GetMapping("/admin_orderlist")
    public String adminOrderlist() {
        return "admin_orderlist";
    }

    @GetMapping("/api/admin/test")
    @ResponseBody
    public String adminOnly() {
        return "관리자 전용 페이지 접근 성공!";
    }
}