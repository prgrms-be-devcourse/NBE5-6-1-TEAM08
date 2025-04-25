package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Order;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface OrderRepository {

    @Select("select * from orders where user_id = #{id}")
    List<Order> findById(String id);

    @Select("select * from orders where email = #{email}")
    List<Order> findByEmail(String email);

    @Select("select * from orders")
    List<Order> findAll();

    @Delete("delete from orders where email = #{email}")
    void deleteByEmail(String email);

}
