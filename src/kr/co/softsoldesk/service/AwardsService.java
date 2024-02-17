package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.AwardsBean;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.dao.AwardsDao;

@Service
public class AwardsService {
	@Autowired
	private AwardsDao awardDao;
	
	public List<AwardsBean> getallAwards(int playerid) {
		
		  List<AwardsBean> awards = awardDao.getallAwards(playerid);
		  
		  return awards;
	}
	
	public AwardsBean getPlayerById(int playerId) {
        return awardDao.selectAwardByPlayerId(playerId); 
   }
	

    public void insertAward(int playerId, String awardName, int awardYear) {
    	awardDao.insertAward(playerId, awardName, awardYear);
    }


	
	
	

}
