package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.AwardsBean;


public interface AwardsMapper {
	
    @Select("SELECT AWARDNAME,AWARDYEAR FROM AWARDS WHERE PLAYER_ID = #{PLAYER_ID}")
    List<AwardsBean> selectAwardsPlayerId(int playerid);
    
    
    @Select("SELECT AWARDNAME,AWARDYEAR FROM AWARDS WHERE PLAYER_ID = #{playerId}")
    AwardsBean selectAwardPlayerId(@Param("playerId") int playerId);
    


    @Insert("INSERT INTO awards (award_id, player_id, awardname, awardyear) VALUES (awards_seq.NEXTVAL, #{playerId}, #{awardName}, #{awardYear})")
    void insertAward(@Param("playerId") int playerId, @Param("awardName") String awardName, @Param("awardYear") int awardYear);

}

