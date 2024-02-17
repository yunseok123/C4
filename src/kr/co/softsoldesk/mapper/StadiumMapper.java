package kr.co.softsoldesk.mapper;


import org.apache.ibatis.annotations.Select;
import kr.co.softsoldesk.beans.StadiumBean;

public interface StadiumMapper {

    @Select("SELECT * FROM Stadium WHERE Team_ID = #{teamId}")
    StadiumBean selectStadiumByTeamId(int teamId);
}
