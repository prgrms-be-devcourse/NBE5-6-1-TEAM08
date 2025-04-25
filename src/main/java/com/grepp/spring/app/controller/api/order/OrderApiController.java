package com.grepp.spring.app.controller.api.order;

import com.grepp.spring.app.model.order.OrderService;
import com.grepp.spring.app.model.order.dto.Order;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("api/order")
public class OrderApiController {

    private final OrderService orderService;

    @GetMapping("/by-id/{userId}")
    public List<Order> getOrderByUserId(@PathVariable String userId) {
        return orderService.getOrdersById(userId);
    }

    @GetMapping("/by-email")
    public List<Order> getOrderByEmail(@RequestParam String email) {
        return orderService.getOrdersByEmail(email);
    }

    @GetMapping("/all")
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    @DeleteMapping("/by-email")
    public ResponseEntity<String> deleteOrderByEmail(@RequestParam String email) {
        orderService.deleteOrder(email);
        return ResponseEntity.ok("Deleted orders for email: " + email);
    }
}





