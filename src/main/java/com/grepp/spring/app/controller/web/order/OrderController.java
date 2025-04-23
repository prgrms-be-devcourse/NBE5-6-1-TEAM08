package com.grepp.spring.app.controller.web.order;


import com.grepp.spring.app.model.order.OrderService;
import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.app.model.user.dto.Principal;
import java.util.List;
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
@RequestMapping("order")
public class OrderController {

    private final OrderService orderService;


    // 회원 주문 조회
    @GetMapping("/check")
    public String checkOrderForm(Model model, Principal principal) {
        if (principal != null) {
            // 로그인 사용자
            String userId = principal.userId(); // Spring Security 사용 시
            List<Order> orders = orderService.getOrdersById(userId);
            model.addAttribute("orders", orders);
            return "order/orderList";
        } else {
            // 비로그인 사용자
            return "order/emailForm"; // 이메일 입력받는 화면
        }
    }

    // 비회원 주문 조회
    @PostMapping("/check")
    public String checkOrderByEmail(
        @RequestParam String email,
        Model model
    ){
        List<Order> orders = orderService.getOrdersByEmail(email);
        model.addAttribute("email orders", orders);
        return "order/orderList";
    }

    @GetMapping("/admin")
    public String checkAllOrderForm(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("all user orders", orders);
        return "order/orderList";
    }
}
