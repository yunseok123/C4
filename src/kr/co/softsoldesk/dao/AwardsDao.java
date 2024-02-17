package kr.co.softsoldesk.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.AwardsBean;
import kr.co.softsoldesk.beans.RecordBean;
import kr.co.softsoldesk.mapper.AwardsMapper;

@Repository
public class AwardsDao {
	
	@Autowired
	private AwardsMapper awardsMapper;
	
	
	public List<AwardsBean> getallAwards(int playerid) {
		List<AwardsBean> awardsList=awardsMapper.selectAwardsPlayerId(playerid);
    	  	        
		return awardsList;
		
	}
	public AwardsBean selectAwardByPlayerId(int playerId) {
        return awardsMapper.selectAwardPlayerId(playerId);   
        
    }
	
	public void insertAward(int playerId, String awardName, int awardYear) {
        awardsMapper.insertAward(playerId, awardName, awardYear);
    }
}