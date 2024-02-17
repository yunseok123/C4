package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.softsoldesk.beans.StadiumBean;
import kr.co.softsoldesk.mapper.StadiumMapper;

@Repository
public class StadiumDao {

    @Autowired
    private StadiumMapper stadiumMapper;

    public StadiumBean getStadiumByTeamId(int teamId) {
        return stadiumMapper.selectStadiumByTeamId(teamId);
    }
}
