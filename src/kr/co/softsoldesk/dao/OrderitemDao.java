package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.softsoldesk.beans.OrderItemBean;
import kr.co.softsoldesk.mapper.OrderitemMapper;


@Repository
public class OrderitemDao {
	
	@Autowired
	private OrderitemMapper orderitemMapper;
	
	
	
	
	
	  
    public void insertProductOrder(OrderItemBean orderitem) {
    	orderitemMapper.insertProductOrder(orderitem);
    }
    
    public List<OrderItemBean> findOrderItemsByOrderId(int orderId) {
        return orderitemMapper.findOrderItemsByOrderId(orderId);
    }
  
	

}
