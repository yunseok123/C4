package kr.co.softsoldesk.controller;



import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.AwardsBean;
import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.PlayerBean;
import kr.co.softsoldesk.beans.ProductBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.RecordBean;
import kr.co.softsoldesk.beans.RecordBeanListWrapper;
import kr.co.softsoldesk.beans.TeamBean;
import kr.co.softsoldesk.service.AwardsService;
import kr.co.softsoldesk.service.BoardService;
import kr.co.softsoldesk.service.OrderService;
import kr.co.softsoldesk.service.PlayerService;
import kr.co.softsoldesk.service.ProductService;
import kr.co.softsoldesk.service.QuestionService;
import kr.co.softsoldesk.service.RecordService;
import kr.co.softsoldesk.service.TeamService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private TeamService teamService;

    @Autowired
    private PlayerService playerService;

    @Autowired
    private RecordService recordService;

    @Autowired
    private AwardsService awardsService;

    @Autowired
    private OrderService orderService;
    
    @Autowired
	private  ProductService productService; 
    
    @Autowired
	private  BoardService boardService; 
    
    @Autowired
	private QuestionService questionService; 


    @GetMapping("/admin")
    public String admin() {
        return "admin/admin";
    }

    @GetMapping("/adminRecord")
    public String adminRecord(Model model) {
        return "admin/adminRecord";
    }

    @PostMapping("/updateTeam")
    public String updateTeam(TeamBean team, Model model) {
        teamService.updateTeam(team);
        return "admin/editSuccess"; // 업데이트 후 adminRecord 페이지로 리다이렉션
    }

    @GetMapping("/editTeam")
    public String teamDetail(@RequestParam("team_id") int teamId, Model model) {
        TeamBean team = teamService.getTeamById(teamId);
        model.addAttribute("team", team);
        return "admin/editTeam";
    }

    @GetMapping("/adminPlayerRecord")
    public String adminPlayerRecord(Model model, String Name) {
        return "admin/adminPlayerRecord";
    }

    @GetMapping("/players")
    public String findByName(@RequestParam("name") String name, Model model) {
        model.addAttribute("players", playerService.getPlayerByName(name));
        return "admin/playerList";
    }

    @GetMapping("/editPlayer")
    public String PlayerDetail(@RequestParam("player_id") int playerId, Model model) {
        PlayerBean player = playerService.getPlayerById(playerId);
        model.addAttribute("player", player);
        return "admin/editPlayer";
    }

    @GetMapping("/editPlayerRecord")
    public String editPlayerRecord(@RequestParam("player_id") int playerId, Model model) {
        RecordBean record = recordService.selectRecordsByPlayerId(playerId);
        PlayerBean player = playerService.getPlayerById(playerId);
        model.addAttribute("player", player);
        model.addAttribute("record", record);
        return "admin/editPlayerRecord";
    }

    @GetMapping("/insertAwardForm")
    public String insertAwardForm(@RequestParam("player_id") int playerId, Model model) {
        model.addAttribute("playerId", playerId);
        model.addAttribute("award", new AwardsBean()); // 비어 있는 AwardsBean 객체를 모델에 추가
        return "admin/insertAwardForm"; // 수상 정보 입력 폼을 보여줄 JSP 페이지 이름
    }

    @PostMapping("/insertAward")
    public String insertAward(
            @RequestParam("playerId") int playerId,
            @RequestParam("awardName") String awardName,
            @RequestParam("awardYear") int awardYear) {

        awardsService.insertAward(playerId, awardName, awardYear);

        return "admin/insertSuccess";
    }

    @PostMapping("/updatePlayer")
    public String updatePlayer(PlayerBean player, Model model) {
        playerService.updatePlayer(player);
        return "admin/editSuccess"; // 업데이트 후 adminRecord 페이지로 리다이렉션
    }

    @PostMapping("/updateRecord")
    public String updateRecord(RecordBean record, Model model) {
        recordService.updateRecord(record);
        return "admin/editSuccess"; // 업데이트 후 adminRecord 페이지로 리다이렉션
    }

    @GetMapping("/adminOrder")
    public String adminOrder(Model model) {
        List<OrderBean> orderList = orderService.getOrderList();
        model.addAttribute("orderList", orderList);
        return "admin/adminOrder";
    }

    @GetMapping("/orderDetail")
    @ResponseBody
    public OrderBean getOrderDetail(@RequestParam("orderId") int orderId) {
        return orderService.getOrderDetails(orderId);
    }

    @GetMapping("/editOrderStatus")
    public String editOrderStatus(@RequestParam("orderId") int orderId, Model model) {
        OrderBean orderDetails = orderService.getOrderDetails(orderId);
        model.addAttribute("orderDetails", orderDetails);
        return "admin/editOrderStatus";
    }

    @PostMapping("/updateOrderStatus")
    @ResponseBody
    public String updateOrderStatus(@RequestParam("orderId") int orderId,
    								@RequestParam("orderStatus") String orderStatus) {
        // 주문 상태 업데이트
        orderService.updateOrderStatusAndDecreaseStock(orderId, orderStatus);
        
       

        return "admin/editSuccess";
    }



    @GetMapping("/adminProduct")
    public String adminProduct(@RequestParam(value = "page", defaultValue = "1") int page,
    							@RequestParam(value = "size", defaultValue = "8") int size, Model model) {
    	List<ProductBean> productAll = productService.getAllProduct(page, size);
	 	List<ProductBean> productBest = productService.getBestProduct();
        // 전체 상품 수를 기반으로 총 페이지 수를 계산합니다.
        int totalProducts = productService.getTotalProductCount();
        int totalPages = (int) Math.ceil((double) totalProducts / size);

        // 모델에 데이터를 추가합니다.
        model.addAttribute("productAll", productAll);
        model.addAttribute("productBest", productBest);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
       
        return "admin/adminProduct";
    }
    
    
    @GetMapping("/searchProduct")
    public String searchProduct(@RequestParam("searchKeyword") String searchKeyword, Model model) {
        List<ProductBean> searchResults = productService.selectProductsByName(searchKeyword);
        model.addAttribute("searchResults", searchResults);
        model.addAttribute("searchKeyword", searchKeyword); // 검색어를 모델에 추가하여 검색 폼에 다시 표시할 수 있도록 함
        return "admin/searchProduct"; // 검색 결과를 보여주는 JSP 페이지로 이동
    }



    @GetMapping("/insertProductForm")
    public String addProductForm(ProductBean product) {
           
    	

        return "admin/insertProductForm";
    }
    
    @PostMapping("/insertProduct")
    public String insertProduct(ProductBean product) {

    	productService.insertProduct(product);

        return "admin/insertSuccess";
    }
    

    @GetMapping("/editProductForm")
    public String editProductForm(@RequestParam("product_id") int productId, Model model) {
        ProductBean product = productService.getProductid(productId);
        model.addAttribute("product", product);
        return "admin/editProductForm";
    }

    // 상품 수정 처리
    @PostMapping("/updateProduct")
    public String updateProduct(ProductBean product) {
        productService.updateProduct(product);
        return "admin/editSuccess"; 
    }

    // 상품 삭제 처리
    @GetMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("product_id") int productId) {
        productService.deleteProduct(productId);
        return "/admin/deleteSuccess"; 
    }
    
    @GetMapping("/insertPlayerForm")
    public String insertProduct() {	
        return "admin/insertPlayerForm";
    }
    
    @PostMapping("/insertPlayer")
    public String insertPlayer(PlayerBean player) {
        playerService.insertPlayer(player);
        recordService.insertRecord(player.getPlayer_Id()); // 삽입된 PLAYER_ID를 사용합니다.
        return "admin/insertSuccess";
    }

    @GetMapping("/adminPosts")
    public String adminPosts(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        int board_info_idx = 1; //                      
        List<ContentBean> contentList = boardService.getContentList(board_info_idx, page);
        PageBean pageBean = boardService.getContent(board_info_idx, page);
        
        model.addAttribute("contentList", contentList);
        model.addAttribute("pageBean", pageBean);
        
        return "admin/adminPosts"; //    
    }

          
    @GetMapping("/postDetail")
    @ResponseBody
    public ContentBean getPostDetail(@RequestParam("community_id") int community_id) {
        return boardService.getContentInfo(community_id);
    }

      
    @PostMapping("/deletePost")
    @ResponseBody
    public String deletePost(@RequestParam("community_id") int community_id) {
        boardService.deleteContentInfo(community_id);
        return "success";
    }
    
    
 //                    
    @GetMapping("/manageNotices")
    public String manageNotices(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        List<ContentBean> noticeList = boardService.getNoticeList(page);
        model.addAttribute("noticeList", noticeList);

        PageBean pageBean = boardService.getContent(1, page);   
        model.addAttribute("pageBean", pageBean);

        return "admin/manageNotices";                  
    }

    //           ۼ    
    @GetMapping("/insertNoticeForm")
    public String insertNoticeForm() {
        return "admin/insertNoticeForm";
    }

    @PostMapping("/insertNotice")
    public String insertNotice(ContentBean noticeContentBean) {
        //           ߰       ȣ  
        boardService.addNotice(noticeContentBean);
        

        return "redirect:/admin/admin";
    }

   
    @GetMapping("/noticeDetail")
    @ResponseBody
    public ContentBean noticeDetail(@RequestParam("notice_id") int notice_id) {
        return boardService.getNoticeInfo(notice_id); //                    ȯ
    }
    
    @PostMapping("/deleteNotice")
    @ResponseBody
    public String deleteNotice(@RequestParam("notice_id") int notice_id) {
        try {
            boardService.deleteNotice(notice_id);
            return "success";
        } catch (Exception e) {
            return "fail";
        }
    }
    @GetMapping("/adminQuestion")
    public String adminQuestion(Model model) {
        List<QuestionBean> questionsDetail = questionService.getAllQuestionDetails();
        model.addAttribute("questionsDetail", questionsDetail);
        return "admin/adminQuestion";
    }
    @GetMapping("/questionRead")
    public String questionRead(@RequestParam("questionid") int questionid,Model model) {
		
		QuestionBean questionBean1 = questionService.getQuestionContent(questionid);
		
		model.addAttribute("questionBean", questionBean1);
		model.addAttribute("questionid", questionid);
		return "admin/questionRead";
    }

	@GetMapping("/questionAnswer")
	public String questionAnswer(@RequestParam("questionid") int questionid, 
            @ModelAttribute("answerBean") QuestionBean answerBean, Model model) {
        
		   // 기존 답변을 answerBean에 설정
			model.addAttribute("questionid", questionid);
			QuestionBean tempAnswerBean = questionService.getQuestionContent(questionid);
		   
			answerBean.setAnswertext(tempAnswerBean.getAnswertext());
		    answerBean.setQuestionstatus(tempAnswerBean.getQuestionstatus());
		    answerBean.setQuestionid(questionid); 
		   
		   model.addAttribute("answerBean",answerBean);
		   return "admin/questionAnswer";
	}
	@PostMapping("/answer_success")
    public String answer_success(@Valid @ModelAttribute("answerBean") QuestionBean answerBean,
                              BindingResult result) {
        if(result.hasErrors()) {
            return "admin/questionAnswer";
        }
        
        System.out.println(answerBean.getAnswertext());
        System.out.println(answerBean.getAnswertext());
        
        questionService.updateAnswer(answerBean); // 답변 업데이트 및 상태 변경 로직을 수행
        return "admin/answer_success";
    }
	@GetMapping("/questionDelete")
	public String delete(@RequestParam("questionid") int questionid,
						 Model model) {
		questionService.deleteQuestion(questionid);
	
		return "admin/questionDelete";
	}
	
	   @GetMapping("/adminTicket")
	   public String adminTicket(Model model) {
	      List<OrderBean> ticketList = orderService.getTicketList();
	      model.addAttribute("ticketList", ticketList);

	      return "admin/adminTicket";
	   }

	   @GetMapping("/ticketDetail")
	   @ResponseBody
	   public OrderBean getTicketDetail(@RequestParam("orderId") int orderId) {
	      return orderService.getTicketDetails(orderId);
	   }

	   @GetMapping("/adminGameSchedule")
	   public String adminGameSchedule(Model model) {
	      List<OrderBean> gameSchedule = orderService.getgameSchedule();
	      model.addAttribute("gameSchedule", gameSchedule);

	      return "admin/adminGameSchedule";
	   }

	   @PostMapping("/insertGame")
	   public String insertGame(@ModelAttribute OrderBean gameForm) {
	       orderService.insertGameSchedule(gameForm);

	       return "admin/insertSuccess";
	   }




	   @PostMapping("/deleteGameSchedule")
	   @ResponseBody
	   public String deleteGameSchedule(@RequestParam("gameId") int gameId) {
	      orderService.deleteGameSchedule(gameId);
	      return "admin/adminGAmeSchedule";
	   }

	   @GetMapping("/insertGameSchedule")
	   public String insertGameSchedule() {
	      return "admin/insertGameSchedule";
	   }
    
}   


