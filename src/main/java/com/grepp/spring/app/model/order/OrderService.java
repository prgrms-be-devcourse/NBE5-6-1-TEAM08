package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.app.model.order.dto.OrderInfo;
import com.grepp.spring.infra.error.exceptions.CommonException;
import com.grepp.spring.infra.response.ResponseCode;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderService {

    private final OrderRepository orderRepository;

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

}
