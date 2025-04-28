package com.grepp.spring.app.model.order.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class OrderInfo {
    private String productName;
    private String email;
    private String userId;
    private Integer orderCnt;
    private LocalDateTime orderDate = LocalDateTime.now();
    private Integer price;
    private String productInfo;
    private Integer productId;
}
