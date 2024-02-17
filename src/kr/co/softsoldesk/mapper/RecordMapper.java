package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.RecordBean;
import java.util.List;

@Mapper
public interface RecordMapper {

    @Select("SELECT p.PLAYER_ID as player_Id, p.NAME, p.PLAYERIMG, t.TEAM_NAME AS teamName, r.HIT AS hits, r.HITTER AS atBats, "
    		+"r.homerun as homerun, r.bat as bats, r.win as win,r.so as so,r.rbi as rbi,r.inning as innging, "
    		+"r.EARNED_RUN as earnedruns,r.score as score,hit2 as hit2,hit3 as hit3,r.lose as lose,r.save as save, "
    		+"r.hold as hold,r.bb as bb,r.sf as sf,r.gameplayed as gameplayed, r.hits_against  as hit_against "
            +"FROM PLAYER p " +
            "JOIN TEAM t ON p.TEAM_ID = t.TEAM_ID " +
            "JOIN RECORD r ON p.PLAYER_ID = r.PLAYER_ID")
    List<RecordBean> getAllPlayerRecords();
    
    
    @Select("SELECT p.PLAYER_ID as player_Id, p.NAME, p.PLAYERIMG,r.HIT AS hits, r.HITTER AS atBats, "
    	    + "r.homerun as homerun, r.bat as bats, r.win as win, r.so as so, r.rbi as rbi, r.inning as innging, "
    	    + "r.EARNED_RUN as earnedruns, r.score as score, r.hit2 as hit2, r.hit3 as hit3, r.lose as lose, r.save as save, "
    	    + "r.hold as hold, r.bb as bb, r.sf as sf, r.gameplayed as gameplayed, r.hits_against as hit_against,r.sac as sac,"
    	    + "r.qs as qs "
    	    + "FROM record r "
    	    + "JOIN player p ON r.player_id = p.PLAYER_ID "
    	    + "WHERE r.player_id = #{playerId}")
    	RecordBean selectRecordsByPlayerId(@Param("playerId") int playerId);
    
    @Update("UPDATE record SET HIT = #{hits}, HITTER = #{atBats}, " +
            "homerun = #{homerun}, bat = #{bats}, win = #{win}, so = #{so}, rbi = #{rbi}, inning = #{innging}, " +
            "EARNED_RUN = #{earnedruns}, score = #{score}, hit2 = #{hit2}, hit3 = #{hit3}, lose = #{lose}, " +
            "save = #{save}, hold = #{hold}, bb = #{bb}, sf = #{sf}, gameplayed = #{gameplayed}, " +
            "hits_against = #{hit_against}, sac = #{sac}, qs = #{qs} " +
            "WHERE player_id = #{player_Id}")
    void updateRecord(RecordBean record);
    
    
    @Insert("INSERT INTO record (RECORD_ID, PLAYER_ID) " +
            "VALUES(record_id_seq.NEXTVAL,#{player_Id})")
    void insertRecord(@Param("player_Id") int playerId);
}
    
    
    
    
    
    
    
    
  
    
    
    

