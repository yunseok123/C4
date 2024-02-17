package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.TicketBean;
import kr.co.softsoldesk.mapper.TicketMapper;

@Repository
public class TicketDao {

   @Autowired
   private TicketMapper ticketMapper;
   
   
   public List<TicketBean> gameinfo() {
       List<TicketBean> TicketList=ticketMapper.getGameInfo();
       
       return TicketList;
        
    }
   
   public List<TicketBean> getReservationInfo(String gameId) {
           List<TicketBean> reservationList = ticketMapper.getReservationInfo(gameId);
           return reservationList;
       }
    
   public String getStadiumSeatImg(String stadiumId) {
           return ticketMapper.getStadiumSeatImg(stadiumId);
       }

   public String findStadiumId(String gameId) {
       return ticketMapper.findStadiumId(gameId);
   }
   
   public TicketBean getGameInfoById(String gameId) {
       return ticketMapper.getGameInfoById(gameId);
   }
   
   public List<TicketBean> gameinfo5() {
       List<TicketBean> TicketList=ticketMapper.getGameInfo5();
       
       return TicketList;
        
    }

   
}