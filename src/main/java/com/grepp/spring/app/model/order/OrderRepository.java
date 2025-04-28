package com.grepp.spring.app.model.order;

import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.app.model.order.dto.OrderInfo;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface OrderRepository {

    List<Order> findById(String id);

    List<Order> findByEmail(String email);

    List<Order> findAll();

    @Delete("delete from orders where email = #{email}")
    void deleteByEmail(String email);

    @Insert("insert into orders(product_Name, email, user_Id, order_Cnt)"
        + "value (#{productName}, #{email}, #{userId}, #{orderCnt})")
    void insertOrder(Order order);

    @Delete("delete from orders where email = #{email} and product_Name = #{productName}")
    boolean deleteOrder(String productName, String email);

    // email을 사용자가 수정했을 경우도 처리 해줘야함 (아직 안함)
    @Update("update orders set product_Name=#{productName}, user_Id=#{userId}, order_Cnt=#{orderCnt}, order_date=#{orderDate} where email=#{email} and product_name=#{productName}")
    boolean updateOrder(Order order);

    @Select("select * from orders")
    List<Order> selectAll();

    //정보 조회
    List<OrderInfo> selectAllWithPriceAndProductInfoByEmail(String email);

    //주문 중복 확인
    int countByEmailAndProductName(String email, String productName);

}
