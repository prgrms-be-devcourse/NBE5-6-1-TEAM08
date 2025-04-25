package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Order;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface OrderRepository {

    @Insert("insert into orders(product_Name, email, user_Id, order_Cnt)"
        + "value (#{productName}, #{email}, #{userId}, #{orderCnt})")
    void insertOrder(Order order);

    @Delete("delete from orders where email = #{email}")
    boolean deleteOrder(String email);

    // email을 사용자가 수정했을 경우도 처리 해줘야함 (아직 안함)
    @Update("update orders set product_Name=#{productName}, user_Id=#{userId}, order_Cnt=#{orderCnt} where email=#{email}")
    boolean updateOrder(Order order);

    @Select("select * from orders")
    List<Order> selectAll();

    @Select("select * from orders where email=#{email}")
    List<Order> selectByEmail(String email);






}
