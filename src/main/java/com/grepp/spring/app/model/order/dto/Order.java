package com.grepp.spring.app.model.order.dto;


import java.time.LocalDateTime;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Order {
    private String productName;
    private String email;
    private String userId;
    private Integer orderCnt;
    private LocalDateTime orderDate = LocalDateTime.now();

    public Order(String productName, String email, String userId, Integer orderCnt) {
        this.productName = productName;
        this.email = email;
        this.userId = userId;
        this.orderCnt = orderCnt;
    }
}
