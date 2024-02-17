package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.mapper.OrderMapper;


@Repository
public class OrderDao {
	
		
	@Autowired
    private  OrderMapper orderMapper;

    
    public int insertOrder(OrderBean order) {
        orderMapper.insertOrder(order);
        
        return order.getOrderId(); // ������ orderId ��ȯ
 
    }
    public List<OrderBean> getOrderList() {
        return orderMapper.getOrderList();
    }
  
    public OrderBean getOrderDetails(int orderId) {
        return orderMapper.getOrderDetails(orderId);
    }
    public void updateOrderStatus(int orderId, String orderStatus) {
        orderMapper.updateOrderStatus(orderId, orderStatus);
    }
    public List<OrderBean> getUserLoginOrderList(int userIdx) {
        return orderMapper.getUserLoginOrderList(userIdx);
    }
    public void insertReservation(OrderBean orderBean) {
        orderMapper.insertReservation(orderBean);
     }
    public List<OrderBean> getTicketList() {
       return orderMapper.getTicketList();
    }

     public OrderBean getTicketDetails(int orderId) {
         return orderMapper.getTicketDetails(orderId);
     }
     public void updateAvailability(String gameId, String seat) {
         // Mapper �������̽��� �޼��带 ȣ���Ͽ� �����ͺ��̽� ������Ʈ ����
         orderMapper.updateAvailability(gameId, seat);
     }
    public List<OrderBean> getGameSchedule() {
       return orderMapper.getGameSchedule();
    }
    public void deleteGameSchedule(int gameId) {
       orderMapper.deleteGameSchedule(gameId);
    }
    public void insertGameSchedule(OrderBean gameSchedule) {
       orderMapper.insertGameSchedule(gameSchedule);
    }
    
    public List<OrderBean> getUserTicketList(int userIdx) {
        return orderMapper.getUserTicketList(userIdx);
    }
    
    

 }