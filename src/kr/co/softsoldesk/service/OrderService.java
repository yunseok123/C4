package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.OrderItemBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.OrderDao;
import kr.co.softsoldesk.dao.OrderitemDao;
import kr.co.softsoldesk.dao.ProductDao;
import kr.co.softsoldesk.dao.UserDao;

@Service
public class OrderService {
    
    @Resource(name="loginUserBean")
    private UserBean loginUserBean;
    
    @Autowired
    private OrderDao orderDao;
    
    @Autowired
    private ProductDao productDao;
    
    @Autowired
    private OrderitemDao orderitemDao;

    @Transactional
    public void addOrderAndOrderItem(OrderBean order, OrderItemBean orderItem) {
        order.setUserIdx(loginUserBean.getUser_idx());
        int generatedOrderId = orderDao.insertOrder(order); // 주문 정보 삽입
        orderItem.setOrderId(generatedOrderId); // 생성된 주문 ID 설정
        orderitemDao.insertProductOrder(orderItem);
    }
    public List<OrderBean> getOrderList() {
        return orderDao.getOrderList();
    }
    
  
    
    
    public OrderBean getOrderDetails(int orderId) {
        return orderDao.getOrderDetails(orderId);
    }
    
    public void updateOrderStatus(int orderId, String orderStatus) {
        orderDao.updateOrderStatus(orderId, orderStatus);
    }
    
    @Transactional
    public void updateOrderStatusAndDecreaseStock(int orderId, String orderStatus) {
        // 주문 상태 업데이트
        orderDao.updateOrderStatus(orderId, orderStatus);

        // 주문 상태가 '주문 완료'일 경우 재고 감소
        if ("주문 완료".equals(orderStatus)) {
            productDao.decreaseStockByOrderId(orderId);
        }
    }
    public List<OrderBean> getUserLoginOrderList() {
        int userIdx = loginUserBean.getUser_idx(); // 로그인된 사용자의 user_idx 가져오기
        return orderDao.getUserLoginOrderList(userIdx); // Mapper 호출
    }

    @Transactional
    public void saveReservation(OrderBean orderBean) {
       orderBean.setUserIdx(loginUserBean.getUser_idx());
        orderDao.insertReservation(orderBean);
    }
    
   public List<OrderBean> getTicketList() {
       return orderDao.getTicketList();
   }
   
    public OrderBean getTicketDetails(int orderId) {
        return orderDao.getTicketDetails(orderId);
    }
    
    @Transactional
    public void updateReservation(OrderBean order) {
        String gameId = order.getGameId();
        List<String> selectedSeats = order.getSelectedSeats();

        // 선택된 좌석 목록(selectedSeats)의 각 값에 대해 반복
        for (String seat : selectedSeats) {
            // DAO를 통해 데이터베이스 업데이트 수행
            orderDao.updateAvailability(gameId, seat);
        }
    }
    public List<OrderBean> getgameSchedule() {
        List<OrderBean> gameSchedule = orderDao.getGameSchedule();

        return gameSchedule;
    }
   public void deleteGameSchedule(int gameId) {
      orderDao.deleteGameSchedule(gameId);
   }
   public void insertGameSchedule(OrderBean gameSchedule) {
      orderDao.insertGameSchedule(gameSchedule);
   }
   
   public List<OrderBean> getUserTicketList() {
       int userIdx = loginUserBean.getUser_idx(); // 로그인된 사용자의 user_idx 가져오기
       return orderDao.getUserTicketList(userIdx); // Mapper 호출
   }


}
    

