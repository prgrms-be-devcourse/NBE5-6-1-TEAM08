package com.grepp.spring.app.model.product.dto;


import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("Product")
public class Product {
    private Integer productId;
    private String productName;
    private Integer price;
}
