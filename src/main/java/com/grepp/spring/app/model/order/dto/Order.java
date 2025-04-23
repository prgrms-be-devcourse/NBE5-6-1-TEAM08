package com.grepp.spring.app.model.order.dto;


import java.time.LocalDateTime;
import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("Order")
public class Order {
    private String productName;
    private String email;
    private String userId;
    private Integer orderCnt;
    private LocalDateTime orderTime;
}
