package com.grepp.spring.app.model.order;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.grepp.spring.app.model.order.dto.Order;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class OrderServiceTest {

    @Mock
    private OrderRepository orderRepository;

    @InjectMocks
    private OrderService orderService;

    @Test
    public void getOrderById() {
        String userId = "test";

        // 가짜 데이터 설정
        List<Order> orders = List.of(new Order(), new Order()); // 두 개의 가짜 주문 객체
        when(orderRepository.findById(userId)).thenReturn(orders); // findById가 호출되면 orders 를 반환

        // 서비스 메서드 실행
        List<Order> result = orderService.getOrdersById(userId);

        // 검증
        assertNotNull(result);  // 결과가 null 이 아니어야 한다
        assertFalse(result.isEmpty());  // 리스트가 비어 있지 않아야 한다
    }

    @Test
    public void getOrderByEmail() {
        String email = "test@test";

        List<Order> orders = List.of(new Order(), new Order());
        when(orderRepository.findByEmail(email)).thenReturn(orders);

        List<Order> result = orderService.getOrdersByEmail(email);

        assertNotNull(result);
        assertFalse(result.isEmpty());
    }

    @Test
    public void getAllOrders() {
        List<Order> orders = List.of(new Order(), new Order());
        when(orderRepository.findAll()).thenReturn(orders);
        List<Order> result = orderService.getAllOrders();
        assertNotNull(result);
        assertFalse(result.isEmpty());
    }

    @Test
    public void deleteOrder() {
        String email = "test@test";

        // when - orderRepository.deleteByEmail()은 void 라서 별도 설정 필요 없음
        orderService.deleteOrder(email);

        // then - deleteByEmail(email)이 호출되었는지 확인
        verify(orderRepository).deleteByEmail(email);
    }

}