package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.OrderItemBean;

public interface OrderitemMapper {

    @Insert("INSERT INTO ORDERITEMS " +
            "(ORDERITEM_ID, ORDER_ID, PRODUCT_ID, QUANTITY, PRICE, SIZES) " +
            "VALUES (ORDERITEM_ID_SEQ.NEXTVAL, #{orderId}, #{productId}, #{quantity}, #{price}, #{sizes}) ")
    void insertProductOrder(OrderItemBean orderItem);
    
    
    
    @Select("SELECT product_id, quantity FROM orderItems WHERE order_id = #{orderId}")
    List<OrderItemBean> findOrderItemsByOrderId(@Param("orderId") int orderId);


}
