package com.grepp.spring.app.controller.web.order;

import com.grepp.spring.app.controller.web.order.form.OrderRegistForm;
import com.grepp.spring.app.model.order.OrderService;
import com.grepp.spring.app.model.order.dto.Order;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("cart")
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/management")
    public String indexCart(OrderRegistForm form, Model model) {
        return "cart/management";
    }

    @PostMapping
    public String create(OrderRegistForm form, Model model) {
        orderService.insertOrder(form.toDto());
        return "redirect:/cart/management";
    }

    @GetMapping
    public String read(Model model) {
        List<Order> orders = orderService.selectByEmail("test@test.com");
        return "redirect:/management";
    }

    @PutMapping
    public String update(OrderRegistForm form, Model model) {
        model.addAttribute("orderRegistForm", new OrderRegistForm());
        orderService.updateOrder(form.toDto());
        return "redirect:/management";
    }

    @DeleteMapping
    public String delete(@AuthenticationPrincipal CustomUserDetails user,
        Order order, Model model) {
        //String email = user.getEmail();
        orderService.deleteByEmail("test@test.com");
        return "redirect:/management";
    }
}
