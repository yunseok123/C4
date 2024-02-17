package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.TeamBean;

public interface TeamMapper {

    @Select("select team_ID,team_Name, team_LogoURL,Wins, Losses, Draws, "
    		+ "team_description,Pitcher_Total, Catcher_Total,Infielder_Total, "
    		+ "Outfielder_Total,Coach_Total FROM Team")
    List<TeamBean> selectAllTeams();
    
    
    
	
	 @Select("SELECT * FROM Team WHERE team_id = #{teamId}")
	    TeamBean selectTeamById(@Param("teamId") int teamId);
	 
	 @Update("UPDATE Team SET  team_Name=#{teamName}, Wins=#{wins}, Losses=#{losses}, Draws=#{draws} WHERE team_id=#{team_ID}")
	    void updateTeam(TeamBean team);
	 
	
}

