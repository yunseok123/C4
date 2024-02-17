package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.TicketBean;

@Mapper
public interface TicketMapper {

   @Select("SELECT GAME_ID, GAME_DATE, HOMETEAM_ID, AWAYTEAM_ID, STADIUM_ID, START_TIME "
         + "FROM GAMEINFORMATION "
         + "WHERE GAME_DATE BETWEEN SYSDATE AND SYSDATE + 7")
   List<TicketBean> getGameInfo();
   
   
   @Select("SELECT RESERVATION_ID, GAME_ID, STADIUM_ID, SEATTYPE, SEATLOCATION, WEEKDAY_PRICE, WEEKEND_PRICE, Available "
           + "FROM reservation "
           + "WHERE GAME_ID = #{gameId} AND Available = '1'")
   List<TicketBean> getReservationInfo(String gameId);
   
   @Select("SELECT STADIUM_ID FROM gameinformation WHERE GAME_ID = #{gameId}")
   String findStadiumId(@Param("gameId") String gameId);

   
   @Select("SELECT STADIUM_SEATIMG FROM stadium WHERE STADIUM_ID = #{stadiumId}")
   String getStadiumSeatImg(@Param("stadiumId") String stadiumId);

   @Select("SELECT * FROM gameinformation WHERE GAME_ID = #{gameId}")
   TicketBean getGameInfoById(@Param("gameId") String gameId);
   
   @Select("SELECT g.GAME_ID, g.GAME_DATE, g.START_TIME, " +
           "ht.TEAM_NAME AS HOMETEAM_NAME, at.TEAM_NAME AS AWAYTEAM_NAME, s.NAME AS STADIUM_NAME , g.HOMETEAM_ID AS HOMETEAM_ID, g.AWAYTEAM_ID AS AWAYTEAM_ID " +
           "FROM GAMEINFORMATION g " +
           "JOIN TEAM ht ON g.HOMETEAM_ID = ht.TEAM_ID " +
           "JOIN TEAM at ON g.AWAYTEAM_ID = at.TEAM_ID " +
           "JOIN STADIUM s ON g.STADIUM_ID = s.STADIUM_ID " +
           "WHERE g.GAME_DATE >= TRUNC(SYSDATE) " +
           "AND g.GAME_DATE < TRUNC(SYSDATE) + 7 " +
           "ORDER BY g.GAME_DATE ASC " +
           "FETCH FIRST 5 ROWS ONLY")
   List<TicketBean> getGameInfo5();

}