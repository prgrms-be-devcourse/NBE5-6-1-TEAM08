package com.grepp.spring.app.model.order;

import static org.junit.jupiter.api.Assertions.*;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations={
    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
    "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
@Slf4j
class OrderRepositoryTest {

    @Autowired
    private OrderRepository orderRepository;

    @Test
    public void findById() {log.info("{}", orderRepository.findById("test2"));}

    @Test
    public void findByEmail() {log.info("{}", orderRepository.findByEmail("test@test"));}

    @Test
    public void findAll() {log.info("{}", orderRepository.findAll());}

    @Test
    public void deleteByEmail() {
        orderRepository.deleteByEmail("test3@test");
        log.info("Deleted orders by email : test3@test");
    }

}