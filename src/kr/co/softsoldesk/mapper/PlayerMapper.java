package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.TeamBean;



public interface PlayerMapper {
	
	
	
	@Select("SELECT * FROM (SELECT p.*, ROW_NUMBER() OVER (ORDER BY p.player_id) AS rn FROM player p WHERE p.team_id = #{teamId}) WHERE rn BETWEEN #{offset} + 1 AND #{offset} + #{limit}")
    List<PlayerBean> selectPlayersByTeamIdWithPaging(@Param("teamId") int teamId, @Param("offset") int offset, @Param("limit") int limit);
	
	

	 @Select("SELECT * FROM PLAYER WHERE TEAM_ID = #{teamId}")
	    List<PlayerBean> selectPlayersByTeamId(int teamId);
    
    
    @Select("SELECT * FROM PLAYER WHERE TEAM_ID = #{teamId} AND SUBSTR(POSITION, 1, INSTR(POSITION, '(') - 1) = #{position} order by(player_id) asc")
    List<PlayerBean> selectPlayersByTeamIdAndPosition(@Param("teamId") int teamId, @Param("position") String position);
    
    
    @Select("SELECT * FROM PLAYER WHERE PLAYER_ID =#{playerId}")
    PlayerBean selectPlayerById(@Param("playerId") int playerId);
    
    
    @Select("SELECT count(*) FROM PLAYER WHERE TEAM_ID = #{teamId}")    
    int getCountPlayer(@Param("teamId") int teamId);
    
    @Select("SELECT * FROM (SELECT p.*, ROW_NUMBER() OVER (ORDER BY p.player_id) AS rn FROM player p WHERE p.team_id = #{teamId} AND SUBSTR(POSITION, 1, INSTR(POSITION, '(') - 1) = #{position}) WHERE rn BETWEEN #{offset} + 1 AND #{offset} + #{limit}")
    List<PlayerBean> selectPlayersByTeamIdAndPositionWithPaging(@Param("teamId") int teamId, @Param("position") String position, @Param("offset") int offset, @Param("limit") int limit);
    
    
    @Select("SELECT COUNT(*) FROM player WHERE position = #{position}")
    int countPlayersByTeamIdAndPosition(@Param("position") String position);
    
    
    @Select("Select * FROM PLAYER WHERE Name = #{Name}")
    List<PlayerBean> selectPlayerByName(String Name);
    
    @Update("UPDATE player SET  NAME=#{name},HIGHSCHOOL=#{highSchool},POSITION=#{position},SALARY=#{salary},JERSEYNUMBER=#{jerseyNumber},"
    		+ "PLAYERIMG=#{playerImg},SIGNINGBONUS=#{signingBonus},JOINYEAR=#{joinYear},TALL=#{tall},HEIGHT=#{height},"
    		+"DRAFTRANK=#{draftRank},TEAM_ID=#{teamId} "
    		+ " WHERE PLAYER_ID= #{player_Id}")
    void updatePlayer(PlayerBean player);
    
    @Insert("INSERT INTO player (PLAYER_ID, NAME, POSITION, TALL, HEIGHT, HIGHSCHOOL, BIRTHDATE, PLAYERIMG, TEAM_ID, SIGNINGBONUS, SALARY, JOINYEAR, JERSEYNUMBER, DRAFTRANK) " +
            "VALUES (player_id_seq.NEXTVAL, #{player.name}, #{player.position}, #{player.tall}, #{player.height}, #{player.highSchool}, #{player.birthDate}, #{player.playerImg}, " +
            "#{player.teamId}, #{player.signingBonus}, #{player.salary}, #{player.joinYear}, #{player.jerseyNumber}, #{player.draftRank})")
    @Options(useGeneratedKeys = true, keyProperty = "player.player_Id", keyColumn = "PLAYER_ID")
    void insertPlayer(@Param("player") PlayerBean player);


}
   


   

   


