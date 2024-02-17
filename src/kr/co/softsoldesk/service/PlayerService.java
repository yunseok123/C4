package kr.co.softsoldesk.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import java.util.List;



import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.dao.PlayerDao;

@Service
public class PlayerService {

    @Autowired
    private PlayerDao playerDao;

    public List<PlayerBean> getPlayersByTeamId(int teamId, int page, int size) {
        int offset = (page - 1) * size;
        return playerDao.getPlayersByTeamId(teamId, offset, size);
    }

    
    public List<PlayerBean> getPlayersByTeamIdAndPosition(int teamId, String position) {
        return playerDao.getPlayersByTeamIdAndPosition(teamId, position);
    }
    
    
    public PlayerBean getPlayerById(int playerid) {
         return playerDao.selectPlayerById(playerid); 
    }
    
    public int getTotalPlayerCount(int teamId) {
    	
        return playerDao.getCountPlayer(teamId);
    }
    public List<PlayerBean> getPlayersByTeamIdWithPaging(int teamId, int page, int size) {
        int offset = (page - 1) * size;
        return playerDao.selectPlayersByTeamIdWithPaging(teamId, offset, size);
    }
    
    public List<PlayerBean> getPlayersByTeamIdAndPositionWithPaging(int teamId, String position, int page, int size) {
        int offset = (page - 1) * size;
        return playerDao.getPlayersByTeamIdAndPositionWithPaging(teamId, position, offset, size);
    }
    
    public int getTotalPlayerCountByPosition(String position) {
        return playerDao.getTotalPlayerCountByPosition(	position);
    }
    
    
    public List<PlayerBean> getPlayerByName(String Name) {
       
        return playerDao.getPlayersByName(Name);
    }
    
    public void updatePlayer(PlayerBean player) {
        playerDao.updatePlayer(player);
    }
    public void insertPlayer(PlayerBean player) {
    	playerDao.insertPlayer(player);
    }
    
  
    
    
}
    
    
  

    
   


    
    
    
  
  


