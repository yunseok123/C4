package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.BoardInfoBean;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.RecordBean;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.beans.TicketBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.PlayerService;
import kr.co.softsoldesk.service.ProductService;
import kr.co.softsoldesk.service.RecordService;
import kr.co.softsoldesk.service.TeamService;
import kr.co.softsoldesk.service.TicketService;
import kr.co.softsoldesk.service.TopMenuService;


@Controller
public class MainController {
	 	private final TeamService teamService;
	    private final RecordService recordService;
	    @Autowired
	    private  ProductService productService; 
	    @Autowired
		 private TopMenuService topMenuService;
	    
	    @Autowired
	       private TicketService ticketService;
	    
	    
	    @Resource(name = "loginUserBean")
		private UserBean loginUserBean;
	    
	    

	    @Autowired
	    public MainController(TeamService teamService, RecordService recordService){
	        this.teamService = teamService;
	        this.recordService = recordService; // ������ ����
	        
	    }
	  

	    @GetMapping("/main")
	    public String showMainPage(@RequestParam(value = "page", defaultValue = "1") int page,
   			 @RequestParam(value = "size", defaultValue = "10") int size, Model model) {
			
			
			
	    	List<ProductBean> productAll = productService.getAllProduct(page, size);
	    	
	    	List<TicketBean> gameinfo = ticketService.getGameInfo5();
	        model.addAttribute("gameinfo", gameinfo);

	    	model.addAttribute("productAll",productAll);
	    	
	    	 List<BoardInfoBean> board_list = topMenuService.getTopMenuList();
		     model.addAttribute("board_list", board_list);
	    	
	    

	    	
	        // Ÿ�� ���� 3��
	        List<RecordBean> topBattingAveragePlayers = recordService.getTopPlayersByBattingAverage();
	        model.addAttribute("topBattingAveragePlayers", topBattingAveragePlayers);

	        // Ȩ��(HR) ���� 3��
	        List<RecordBean> topHomeRunPlayers = recordService.getTopPlayersByHomeRuns();
	        model.addAttribute("topHomeRunPlayers", topHomeRunPlayers);

	        // Ÿ��(RBI) ���� 3��
	        List<RecordBean> topRBIPlayers = recordService.getTopPlayersByRBI();
	        model.addAttribute("topRBIPlayers", topRBIPlayers);

	        // �����(ERA) ���� 3��
	        List<RecordBean> topERAPlayers = recordService.getTopPlayersByERA();
	        model.addAttribute("topERAPlayers", topERAPlayers);

	        // �¸�(WIN) ���� 3��
	        List<RecordBean> topWinPlayers = recordService.getTopPlayersByWins();
	        model.addAttribute("topWinPlayers", topWinPlayers);

	        // ����(SO) ���� 3��
	        List<RecordBean> topSOPlayers = recordService.getTopPlayersBySO();
	        model.addAttribute("topSOPlayers", topSOPlayers);

	        return "main"; // main ������ �� �̸�
	    }
	}

