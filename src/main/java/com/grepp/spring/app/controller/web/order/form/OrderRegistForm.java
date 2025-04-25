package com.grepp.spring.app.controller.web.order.form;

import com.grepp.spring.app.model.order.dto.Order;
import lombok.Data;

@Data
public class OrderRegistForm {

    private String productName;
    private String email;
    private String userId;
    private Integer orderCnt; // 0 이하 일 수 없습니다. 유효성 처리 ( back or front에서 처리 결정 )

    public Order toDto(){
        Order order = new Order();
        order.setProductName(productName);
        order.setEmail(email);
        order.setUserId(userId);
        order.setOrderCnt(orderCnt);
        return order;
    }

}
