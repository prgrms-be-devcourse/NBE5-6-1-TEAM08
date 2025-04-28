package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.app.model.order.dto.OrderInfo;
import com.grepp.spring.infra.error.exceptions.CommonException;
import com.grepp.spring.infra.error.exceptions.OrderNotFoundException;
import com.grepp.spring.infra.response.ResponseCode;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    // 주문 추가
    @Transactional
    public void insertOrder(Order order) {
        try{
            orderRepository.insertOrder(order);
        } catch (Exception e) {
            throw new CommonException(ResponseCode.INTERNAL_SERVER_ERROR, e);
        }
    }

    // 주문 삭제 (userId or email)
    @Transactional
    public boolean deleteByEmailAndProductName(String productName, String email){
        return orderRepository.deleteOrder(productName, email);
    }

    // 주문 수정
    public boolean updateOrder(Order order) {
        return orderRepository.updateOrder(order);
    }

    // 주문 조회
    public List<Order> selectAll() {
        return orderRepository.selectAll();
    }


    public List<OrderInfo> selectAllWithPriceAndProductInfoByEmail(String email) {
        return orderRepository.selectAllWithPriceAndProductInfoByEmail(email);
    }

    public int findByEmailAndProductName(String email, String productName) {
        return orderRepository.countByEmailAndProductName(email, productName);
    }

}
