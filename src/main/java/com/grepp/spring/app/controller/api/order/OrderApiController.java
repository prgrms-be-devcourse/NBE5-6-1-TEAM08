package com.grepp.spring.app.controller.api.order;

import com.grepp.spring.app.model.order.OrderRepository;
import com.grepp.spring.app.model.order.OrderService;
import com.grepp.spring.app.model.order.dto.Order;
import java.time.LocalDateTime;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("api")
@RequiredArgsConstructor
public class OrderApiController {

    private final OrderService orderService;

    @PutMapping("/update-cart")
    public ResponseEntity<String> updateCart(@RequestBody Order order) {
        log.info("받은 Order: {}", order);
        order.setOrderDate(LocalDateTime.now());

        // 여기에 DB Update 로직
        orderService.updateOrder(order);

        return ResponseEntity.ok("업데이트 성공!");
    }

    @DeleteMapping("/remove-cart")
    public ResponseEntity<Void> deleteOrder(@RequestBody Order order) {
        log.info("삭제할 상품: {}", order.getProductName());
        orderService.deleteByEmailAndProductName(order.getProductName(), order.getEmail());
        return ResponseEntity.ok().build();
    }

}
