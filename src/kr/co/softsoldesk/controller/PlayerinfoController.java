package kr.co.softsoldesk.controller;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.AwardsBean;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.service.AwardsService;
import kr.co.softsoldesk.service.PlayerService;


@Controller
@RequestMapping("/player")
public class PlayerinfoController {

    @Autowired
    private PlayerService playerService;
    
    @Autowired
    private AwardsService awardsService;
    
    
    @GetMapping("/player_info")
    public String playerInfo(@RequestParam("player_id") int playerid, Model model) {
        PlayerBean players =playerService.getPlayerById(playerid);
        
       List<AwardsBean> awards=awardsService.getallAwards(playerid);
        
        
        model.addAttribute("players", players);
        model.addAttribute("awards", awards);
        return "player/player_info";
    }
    
    
	
    
}

	
	 


