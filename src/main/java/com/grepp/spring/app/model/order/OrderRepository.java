package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Orders;
import java.util.List;
import org.apache.ibatis.annotations.Select;

public interface OrderRepository {

    @Select("select * from order where user_id = #{id}")
    List<Orders> findById(String id);

    @Select("select * from order where email = #{email}")
    List<Orders> findByEmail(String email);

}
