package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.OrderItemBean;
import lombok.Delegate;

public interface OrderMapper {

    @Insert("INSERT INTO ORDERS " +
            "(ORDER_ID, ORDER_DATE, TOTAL_PRICE, SHIPPING_ADDRESS, CELLPHONE_NUMBER, MESSAGE, REFUND_ACCOUNT, " +
            "ORDER_STATUS, USER_IDX, ORDERER_NAME, EMAIL, POSTAL_CODE, DETAIL_ADDRESS) " +
            "VALUES (ORDER_ID_SEQ.NEXTVAL, SYSDATE, #{totalPrice}, #{shippingAddress}, #{cellphoneNumber}, " +
            "#{message}, #{refundAccount}, #{orderStatus}, #{userIdx}, #{ordererName}, #{email}, " +
            "#{postalCode, jdbcType=INTEGER}, #{detailAddress})")
    @Options(useGeneratedKeys = true, keyProperty = "orderId", keyColumn = "ORDER_ID")
    void insertOrder(OrderBean order);
    
    
    
    
   

    @Select("SELECT " +
            "o.order_id AS orderId, " +
            "o.order_date AS orderDate, " +
            "o.shipping_address AS shippingAddress, " +
            "o.cellphone_number AS cellphoneNumber, " +
            "o.order_status AS orderStatus, " +
            "o.orderer_name AS ordererName, " +
            "o.email AS email, " +
            "oi.price AS totalPrice, " +
            "p.name AS productName, " +
            "oi.sizes as sizes "+          
            "FROM orders o " +
            "JOIN orderitems oi ON o.order_id = oi.order_id " +
            "JOIN product p ON oi.product_id = p.product_id")
    List<OrderBean> getOrderList();
    
    
    @Select("SELECT " +
            "o.order_id AS orderId, " +
            "o.order_date AS orderDate, " +
            "o.shipping_address AS shippingAddress, " +
            "o.cellphone_number AS cellphoneNumber, " +
            "o.order_status AS orderStatus, " +
            "o.orderer_name AS ordererName, " +
            "o.email AS email, " +
            "oi.price AS totalPrice, " +
            "p.name AS productName, " +
            "oi.sizes as sizes "+          
            "FROM orders o " +
            "JOIN orderitems oi ON o.order_id = oi.order_id " +
            "JOIN product p ON oi.product_id = p.product_id")
    List<OrderBean> getUserOrderList(OrderBean order);


        

        @Select("SELECT o.order_id AS orderId, o.order_date AS orderDate, " +
                "oi.quantity AS orderItemQuantity, oi.price AS orderItemPrice, " +
                "p.product_id AS productId, p.name AS productName, "+
                "o.shipping_address AS shippingAddress, " +
                "o.cellphone_number AS cellphoneNumber, " +
                "o.order_status AS orderStatus, " +
                "o.orderer_name AS ordererName, " +
                "o.email AS email, " +
                "p.price as productPrice," +
                "o.postal_code as postalCode," +
                "o.refund_account as refundAccount," +
                "o.message as message, "+
                "o.detail_address as detailAddress, "+
                "oi.sizes as sizes "+ 
                "FROM orders o " +
                "INNER JOIN orderitems oi ON o.order_id = oi.order_id " +
                "INNER JOIN product p ON oi.product_id = p.product_id " +
                "WHERE o.order_id = #{orderId}")
        OrderBean getOrderDetails(@Param("orderId") int orderId);
        
        
        @Update("UPDATE orders SET order_Status = #{orderStatus} WHERE order_id = #{orderId}")
	    void updateOrderStatus(@Param("orderId") int orderId, @Param("orderStatus") String orderStatus);
        
        @Select("SELECT productId, quantity FROM orderItems")
        List<OrderItemBean> getAllOrderItems();
        
        

        @Select("SELECT " +
                "o.order_id AS orderId, " +
                "o.order_date AS orderDate, " +
                "o.shipping_address AS shippingAddress, " +
                "o.cellphone_number AS cellphoneNumber, " +
                "o.order_status AS orderStatus, " +
                "o.orderer_name AS ordererName, " +
                "o.email AS email, " +
                "oi.price AS totalPrice, " +
                "p.name AS productName, " +
                "oi.sizes as sizes " +          
                "FROM orders o " +
                "JOIN orderitems oi ON o.order_id = oi.order_id " +
                "JOIN product p ON oi.product_id = p.product_id " +
                "WHERE o.user_idx = #{userIdx}")
        List<OrderBean> getUserLoginOrderList(int userIdx);

        
        
        @Insert("INSERT INTO ORDERS " +
                "(ORDER_ID, ORDER_DATE, TOTAL_PRICE, CELLPHONE_NUMBER, ORDERER_NAME, EMAIL, TICKETTITLE, GAMEDATE, STARTTIME, TICKETSEAT, GAME_ID, USERBIRTHDATE, USER_IDX, ORDER_STATUS) " +
                "VALUES (ORDER_ID_SEQ.NEXTVAL, SYSDATE, #{finalPrice}, #{cellphoneNumber}, " +
                "#{ordererName}, #{email}, #{ticketTitle}, #{gameDate}, #{startTime}, #{ticketSeat}, #{gameId}, #{userBirthdate, jdbcType=DATE}, #{userIdx}, #{orderStatus})")
        @Options(useGeneratedKeys = true, keyProperty = "orderId", keyColumn = "ORDER_ID")
        void insertReservation(OrderBean order);
        
        
        @Select("SELECT ORDER_ID as orderId, ORDER_DATE as orderDate, TOTAL_PRICE as totalPrice, ORDER_STATUS as orderStatus, USER_IDX as userIdx, " +
                "ORDERER_NAME as ordererName, EMAIL as email, TICKETTITLE as ticketTitle, TICKETSEAT as ticketSeat, GAME_ID as gameId, STARTTIME as startTime, " +
                "GAMEDATE as gameDate, USERBIRTHDATE as userBirthdate, CELLPHONE_NUMBER as cellphoneNumber " +
                "FROM ORDERS " +
                "WHERE GAME_ID IS NOT NULL")
        List<OrderBean> getTicketList();
        
        
        
        @Select("SELECT ORDER_ID as orderId, ORDER_DATE as orderDate, TOTAL_PRICE as totalPrice, ORDER_STATUS as orderStatus, USER_IDX as userIdx, " +
                "ORDERER_NAME as ordererName, EMAIL as email, TICKETTITLE as ticketTitle, TICKETSEAT as ticketSeat, GAME_ID as gameId, STARTTIME as startTime, " +
                "GAMEDATE as gameDate, USERBIRTHDATE as userBirthdate, CELLPHONE_NUMBER as cellphoneNumber " +
                "FROM ORDERS " +
                "WHERE GAME_ID IS NOT NULL "
                + "and user_idx = #{userIdx}")
        List<OrderBean> getUserTicketList(int userIdx);
        
        
        
        
        @Select("SELECT ORDER_ID as orderId, ORDER_DATE as orderDate, TOTAL_PRICE as totalPrice, ORDER_STATUS as orderStatus, USER_IDX as userIdx, \r\n"
                + "    ORDERER_NAME as ordererName, EMAIL as email, TICKETTITLE as ticketTitle, TICKETSEAT as ticketSeat, GAME_ID as gameId, STARTTIME as startTime, \r\n"
                + "    GAMEDATE as gameDate, USERBIRTHDATE as userBirthdate, CELLPHONE_NUMBER as cellphoneNumber, ORDER_STATUS as orderStatus \r\n"
                + "FROM ORDERS \r\n"
                + "WHERE ORDER_ID = #{orderId}\r\n"
                + "")
        OrderBean getTicketDetails(@Param("orderId") int orderId);
        
        

        @Update("UPDATE reservation SET Available = 0 WHERE GAME_ID = #{gameId} AND SEATLOCATION = #{seat}")
        void updateAvailability(@Param("gameId") String gameId, @Param("seat") String seat);


        @Select("SELECT G.GAME_ID AS gameId, TO_CHAR(G.GAME_DATE, 'YY/MM/DD') AS gameDate, G.HOMETEAM_ID, G.AWAYTEAM_ID, G.STADIUM_ID, G.START_TIME AS startTime, S.NAME AS STADIUM_NAME, \r\n"
              + "    HT.TEAM_NAME AS HOMETEAM_NAME, AT.TEAM_NAME AS AWAYTEAM_NAME \r\n"
              + "FROM GAMEINFORMATION G \r\n"
              + "JOIN STADIUM S ON G.STADIUM_ID = S.STADIUM_ID \r\n"
              + "JOIN TEAM HT ON G.HOMETEAM_ID = HT.TEAM_ID \r\n"
              + "JOIN TEAM AT ON G.AWAYTEAM_ID = AT.TEAM_ID \r\n"
              + "ORDER BY G.GAME_ID ASC")
        List<OrderBean> getGameSchedule();



        @Delete("DELETE FROM GAMEINFORMATION WHERE game_id = #{gameId, jdbcType=INTEGER}")
        void deleteGameSchedule(int gameId);



        @Insert("INSERT INTO gameinformation (GAME_ID, GAME_DATE, HOMETEAM_ID, AWAYTEAM_ID, STADIUM_ID, START_TIME) " +
                "VALUES (gameinfo_seq.NEXTVAL, #{gameDate}, #{HOMETEAM_ID}, #{AWAYTEAM_ID}, #{StadiumId}, #{startTime})")
        void insertGameSchedule(OrderBean gameSchedule);
    }




    
    
    
