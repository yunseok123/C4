package kr.co.softsoldesk.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.StadiumBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.service.PlayerService;
import kr.co.softsoldesk.service.StadiumService;
import kr.co.softsoldesk.service.TeamService;

@Controller
@RequestMapping("/team")
public class TeamController {
    @Autowired
    private TeamService teamService;

    @Autowired
    private StadiumService stadiumService;

    @Autowired // 추가된 부분
    private PlayerService playerService; // PlayerService 주입이 정확히 되도록 수정

   

    @GetMapping("/{teamId}/Stadium_info")
    public String stadiumInfo(@PathVariable("teamId") int teamId, Model model) {
    		
    				

 
        StadiumBean stadium = stadiumService.getStadiumByTeamId(teamId);
        model.addAttribute("stadium", stadium);

        return "team/Stadium_info";
    }


	

    @GetMapping("/Team")
    public String teamDetail(@RequestParam("team_id") int teamId,
            				@RequestParam(value = "page", defaultValue = "1") int page,
            				@RequestParam(value = "size", defaultValue = "12") int size,
            				Model model) {
    	  int totalPlayers = playerService.getTotalPlayerCount(teamId);
    	  int totalPages = (int) Math.ceil((double) totalPlayers / size);
        TeamBean team = teamService.getTeamById(teamId);
        model.addAttribute("team", team);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        
        
        
        
      
       
        List<PlayerBean> player = playerService.getPlayersByTeamIdWithPaging(teamId, page, size);
        model.addAttribute("player", player);
 
        return "team/Team";
    }
    
    
    
    
    
    @GetMapping("/{teamId}/playersByPosition/{position}")
    public String getPlayersByPosition(@PathVariable("teamId") int teamId, @PathVariable("position") String position,    	   
							    	   @RequestParam(value = "page", defaultValue = "1") int page,
			            			   @RequestParam(value = "size", defaultValue = "60") int size,
			            			
			            			   Model model) {
        
    	
    	  int totalPlayers = playerService.getTotalPlayerCountByPosition(position);
    	  int totalPages = (int) Math.ceil((double) totalPlayers / size);

        // 포지션별 선수 목록 가져오기
        List<PlayerBean> players = playerService.getPlayersByTeamIdAndPositionWithPaging(teamId, position, page, size);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("players", players);

        return "team/PlayerList"; // 'team/PlayerList.jsp' 페이지로 이동
    }










}
