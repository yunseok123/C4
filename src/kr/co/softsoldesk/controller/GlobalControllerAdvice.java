package kr.co.softsoldesk.controller;
import java.util.List;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.service.TeamService;

@ControllerAdvice
public class GlobalControllerAdvice {

    private final TeamService teamService;

    @Autowired
    public GlobalControllerAdvice(TeamService teamService) {
        this.teamService = teamService;
    }

    @ModelAttribute("teamBeanList")
    public List<TeamBean> getTeamStandings() {
        return teamService.getTeamStandings();
    }
}
