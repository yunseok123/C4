	package kr.co.softsoldesk.dao;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;
	import java.util.List;
	import kr.co.softsoldesk.beans.PlayerBean;
	import kr.co.softsoldesk.beans.ProductBean;
	import kr.co.softsoldesk.beans.TeamBean;
	import kr.co.softsoldesk.mapper.PlayerMapper;
	
	@Repository
	public class PlayerDao {
	
	    @Autowired
	    private PlayerMapper playerMapper;
	
	    public List<PlayerBean> getPlayersByTeamId(int teamId, int offset, int limit) {
	        return playerMapper.selectPlayersByTeamId(teamId);
	    }
	    public List<PlayerBean> getPlayersByTeamIdAndPosition(int teamId, String position) {
	        return playerMapper.selectPlayersByTeamIdAndPosition(teamId, position);
	    }
	    
	    public  PlayerBean selectPlayerById(int playerId) {
	        return playerMapper.selectPlayerById(playerId);
	    }
	    public int getCountPlayer(int teamId) {
	    	return playerMapper.getCountPlayer(teamId);
	    }
	    public List<PlayerBean> selectPlayersByTeamIdWithPaging(int teamId, int offset, int limit) {
	        return playerMapper.selectPlayersByTeamIdWithPaging(teamId, offset, limit);
	    }
	    
	    public List<PlayerBean> getPlayersByTeamIdAndPositionWithPaging(int teamId, String position, int offset, int limit) {
	        return playerMapper.selectPlayersByTeamIdAndPositionWithPaging(teamId, position, offset, limit);
	    }
	    public int getTotalPlayerCountByPosition(String position) {
	        return playerMapper.countPlayersByTeamIdAndPosition(position);
	    }
	    public List<PlayerBean> getPlayersByName(String Name) {
	        return playerMapper.selectPlayerByName(Name);
	    }
	    
	    
	    public void updatePlayer(PlayerBean player) {
	        playerMapper.updatePlayer(player);
	    }
	    
	    public void insertPlayer(PlayerBean player) {
	        playerMapper.insertPlayer(player);
	    }
	   
	    
	    
	    
	
	   
	    
	   
	} 
	
