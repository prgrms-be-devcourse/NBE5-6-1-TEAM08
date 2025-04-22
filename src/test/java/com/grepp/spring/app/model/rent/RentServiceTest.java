package com.grepp.spring.app.model.rent;

import static org.junit.jupiter.api.Assertions.*;

import com.grepp.spring.app.model.rent.dto.Rent;
import java.util.List;
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
class RentServiceTest {

    @Autowired
    private RentService rentService;

    @Test
    public void selectById() {
        List<Rent> rents = rentService.selectAll();
        rents.forEach(System.out::println);
    }

}