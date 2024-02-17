package kr.co.softsoldesk.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.RecordBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.service.RecordService;
import kr.co.softsoldesk.service.TeamService;

@Controller
@RequestMapping("/record")
public class RecordController {
	@Autowired
	TeamService teamService;
	
	@Autowired
	RecordService recordService;
	
	
	 @GetMapping("/TeamRanking")
	    public String teamRanking(Model model) {
	        List<TeamBean> topTeams = teamService.getTopTeams();
	        model.addAttribute("topTeams", topTeams);
		return "record/TeamRanking";
	}
	 
	 

	 @GetMapping("/PlayerRanking")
	    public String PlayerRanking(Model model) {
		 
		 List<RecordBean> topBattingAveragePlayers = recordService.getTopPlayersByBattingAverage();
	 
	        model.addAttribute("topBattingAveragePlayers", topBattingAveragePlayers);

	        // Ȩ��(HR) 
	        List<RecordBean> topHomeRunPlayers = recordService.getTopPlayersByHomeRuns();
	        model.addAttribute("topHomeRunPlayers", topHomeRunPlayers);

	        // Ÿ��(RBI)
	        List<RecordBean> topRBIPlayers = recordService.getTopPlayersByRBI();
	        model.addAttribute("topRBIPlayers", topRBIPlayers);
	        
	        //����(score) 
	        List<RecordBean> topScorePlayers=recordService.getTopPlayersByscore();
	        model.addAttribute("topScorePlayers",topScorePlayers);
	        
	        //��Ÿ(hit)
	        List<RecordBean> topPlayersByhit=recordService.getTopPlayersByhit();
	        model.addAttribute("topPlayersByhit",topPlayersByhit);
	        
	        //��Ÿ��(slg)
	        List<RecordBean> topslgplayer = recordService.getTopPlayersBySLG();
	        model.addAttribute("topslgplayer", topslgplayer);
	        

	        // �����(ERA) 
	        List<RecordBean> topERAPlayers = recordService.getTopPlayersByERA();
	        model.addAttribute("topERAPlayers", topERAPlayers);

	        // �¸�(WIN)
	        List<RecordBean> topWinPlayers = recordService.getTopPlayersByWins();
	        model.addAttribute("topWinPlayers", topWinPlayers);

	        // ����(SO) 
	        List<RecordBean> topSOPlayers = recordService.getTopPlayersBySO();
	        model.addAttribute("topSOPlayers", topSOPlayers);
	        
	        // �·� 
	        List<RecordBean> topWinRatePlayer = recordService.getTopPlayersByWinRate();
	        model.addAttribute("topWinRatePlayer", topWinRatePlayer);
	        
	        // ���̺�
	        List<RecordBean> topSavePlayer = recordService.getTopPlayersBySave();
	        model.addAttribute("topSavePlayer", topSavePlayer);
	        
	        //Ȧ��
	        List<RecordBean> topHoldPlayer = recordService.getTopPlayersByHold();
	        model.addAttribute("topHoldPlayer", topHoldPlayer);	        
		return "record/PlayerRanking";
	}
	 @GetMapping("/AllRecords")
	    public String AllRanking(Model model) {
		 List<RecordBean> allRecordsBat = recordService.allRecordsBat();
		 model.addAttribute("allRecordsBat",allRecordsBat);
		 
		 List<RecordBean> allRecordsPit1 = recordService.allRecordsPit1();
		 model.addAttribute("allRecordsPit1",allRecordsPit1);
		 
		 
		 List<RecordBean> allRecordsPit2 = recordService.allRecordsPit2();
		 model.addAttribute("allRecordsPit2",allRecordsPit2);
		 
		
	        return "record/AllRecords";
}

}
