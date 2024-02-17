package kr.co.softsoldesk.service;


import java.util.Comparator;

import java.util.List;
import java.util.stream.Collectors;
import java.text.DecimalFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.dao.TeamDao;

@Service
public class TeamService {

    @Autowired
    private TeamDao teamDao;  

    public List<TeamBean> getTeamStandings() {
        List<TeamBean> teams = teamDao.getAllTeams();
        
        for (TeamBean team : teams) {
            int totalGamesForWinRate = team.getWins() + team.getLosses();
            double winRate = totalGamesForWinRate > 0 ? (double) team.getWins() / totalGamesForWinRate : 0.0;

           
            DecimalFormat df = new DecimalFormat("0.000"); 
            winRate = Double.parseDouble(df.format(winRate));

            team.setWinRate(winRate);
            team.setGamesPlayed(totalGamesForWinRate + team.getDraws());
            team.setEntries(team.getGamesPlayed());
        }

        teams.sort(Comparator.comparing(TeamBean::getWinRate).reversed()
                .thenComparing(TeamBean::getDraws)
                .thenComparing(TeamBean::getTeam_ID));
        
        
        double mostPoints = teams.get(0).getWins() + (teams.get(0).getDraws() * 0.5);

        // 紐⑤뱺 ���뿉 ���빐 寃쎄린 李⑥씠 怨꾩궛
        for (TeamBean team : teams) {
            double teamPoints = team.getWins() + (team.getDraws() * 0.5);
            double gamesBehind = mostPoints - teamPoints;

            // �꽑�몢 ���쓽 寃쎌슦 '-'濡� �몴�떆
            if (team == teams.get(0)) {
                team.setGamesBehind("-");
            } else {
                team.setGamesBehind(String.valueOf(gamesBehind));
            }
        }
        
        return teams;
    } 
    public TeamBean getTeamById(int teamId) {
        return teamDao.selectTeamById(teamId);
    }
    
    public List<TeamBean> getTopTeams() {
        List<TeamBean> teams = getTeamStandings();
        return teams.stream().limit(3).collect(Collectors.toList());
   
    }
    
    public void updateTeam(TeamBean team) {
        teamDao.updateTeam(team);
    }
}
