package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Orders;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;

    public List<Orders> getOrdersById(String id) {
        return orderRepository.findById(id);
    }

    public List<Orders> getOrdersByEmail(String email) {
        return orderRepository.findByEmail(email);
    }

}
