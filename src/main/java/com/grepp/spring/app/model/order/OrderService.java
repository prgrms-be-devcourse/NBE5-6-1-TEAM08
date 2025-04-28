package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.infra.error.exceptions.OrderNotFoundException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;

    public List<Order> getOrdersById(String id) {
        List<Order> orders = orderRepository.findById(id);
        if (orders == null || orders.isEmpty()) {
            throw new OrderNotFoundException("해당 ID로 주문을 찾을 수 없습니다: " + id);
        }
        return orders;
    }

    public List<Order> getOrdersByEmail(String email) {
        List<Order> orders = orderRepository.findByEmail(email);
        if (orders == null || orders.isEmpty()) {
            throw new OrderNotFoundException("해당 EMAIL로 주문을 찾을 수 없습니다: " + email);
        }
        return orders;
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public void deleteOrder(String email) {
        List<Order> orders = orderRepository.findByEmail(email);
        if (orders == null || orders.isEmpty()) {
            throw new OrderNotFoundException("삭제할 주문이 없습니다.: " + email);
        }
        orderRepository.deleteByEmail(email);
    }

}
