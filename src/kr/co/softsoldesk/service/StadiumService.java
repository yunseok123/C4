package kr.co.softsoldesk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.softsoldesk.beans.StadiumBean;
import kr.co.softsoldesk.dao.StadiumDao;

@Service
public class StadiumService {

    @Autowired
    private StadiumDao stadiumDao;

    public StadiumBean getStadiumByTeamId(int teamId) {
        return stadiumDao.getStadiumByTeamId(teamId);
    }
}
