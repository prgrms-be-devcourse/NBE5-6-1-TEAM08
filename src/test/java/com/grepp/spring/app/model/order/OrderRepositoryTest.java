package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.OrderInfo;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
    "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
@Slf4j
class OrderRepositoryTest {

    @Autowired
    private OrderRepository orderRepository;

    @Test
    public void select(){
        String email = "test@test.com";
        List<OrderInfo> orderInfos = orderRepository.selectAllWithPriceAndProductInfoByEmail(email);

        for (OrderInfo orderInfo : orderInfos) {
            log.info(orderInfo.toString());
        }
        for (OrderInfo orderInfo : orderInfos) {
            System.out.println(orderInfo);
        }

    }

}