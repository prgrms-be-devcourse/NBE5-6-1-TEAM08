package com.grepp.spring.app.controller.web.order;


import com.grepp.spring.app.model.order.OrderService;
import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.app.model.user.dto.Principal;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
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
    @PreAuthorize("hasAuthority('USER')")
    @GetMapping("/check")
    public String checkOrderForm(Model model, Principal principal) {
        if (principal != null) {
            // 로그인 사용자
            String userId = principal.userId();  // Principal 객체에서 userId 가져오기
            log.debug("user id : {}", userId);  // 로그 출력시 {}를 사용하여 userId를 출력

            // 주문 목록 가져오기
            List<Order> orders = orderService.getOrdersById(userId);
            model.addAttribute("orders", orders);  // 모델에 주문 목록 추가
            return "userOrderlist";  // 로그인한 사용자에게 주문 목록 페이지 반환
        } else {
            // 비로그인 사용자
            log.debug("No logged-in user found");  // 비로그인 사용자 로그
            return "order/emailForm";  // 이메일 입력받는 화면 반환
        }
    }

    // 비회원 주문 조회
    @PostMapping("/check")
    public String checkOrderByEmail(
        @RequestParam String email,
        Model model
    ){
        List<Order> orders = orderService.getOrdersByEmail(email);
        model.addAttribute("emailOrders", orders);
        return "userOrderlist";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/admin")
    public String checkAllOrder(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("allOrders", orders);
        return "admin_orderlist";
    }
}
