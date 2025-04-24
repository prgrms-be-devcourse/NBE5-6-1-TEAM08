package com.grepp.spring.app.model.order.dto;


import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
