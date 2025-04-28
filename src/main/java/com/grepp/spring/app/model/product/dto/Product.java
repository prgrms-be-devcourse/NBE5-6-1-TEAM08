package com.grepp.spring.app.model.product.dto;

import java.time.LocalDateTime;
import lombok.Data;

@Data
public class Product {
    private Long id;
    private String name;
    private String description;
    private int price;
    private LocalDateTime createdAt;
    private String imageUrl;
}