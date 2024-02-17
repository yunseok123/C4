package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.mapper.TeamMapper;

@Repository
public class TeamDao {

    @Autowired
    private TeamMapper teamMapper;

    public List<TeamBean> getAllTeams() {
       List<TeamBean> TeamList=teamMapper.selectAllTeams();
       
       return TeamList;
        
    }
    
    public TeamBean selectTeamById(int teamId) {
        return teamMapper.selectTeamById(teamId);
    }
    
    
    public void updateTeam(TeamBean team) {
        teamMapper.updateTeam(team);
    }
}