package com.grepp.spring.app.model.product.dto;

import lombok.Data;

@Data
public class Product {
    private Integer productId;
    private String product_name;
    private String productInfo;
    private Integer price;
    private Integer stockCnt;

}
