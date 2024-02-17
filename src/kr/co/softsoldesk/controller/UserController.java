package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.validtor.UserValidator;
import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.OrderService;
import kr.co.softsoldesk.service.QuestionService;
import kr.co.softsoldesk.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private QuestionService questionService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/Login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
						@RequestParam(value = "fail", defaultValue = "false") boolean fail,
						Model model) {
		
		model.addAttribute("fail", fail);
		
		return "user/Login";
	}
	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
							Model model, BindingResult result) {
		
		
		if(result.hasErrors()) {
		
			return "user/Login";
		}
		
		userService.getLoginUserInfo(tempLoginUserBean);
		model.addAttribute("loginUserBean", loginUserBean);
		
		if(loginUserBean.isUserLogin() == true) {
		
			return "user/login_success";
			
		}else {
			
			return "user/login_fail";
		}
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		
		return "user/not_login";
	}

	@GetMapping("/logout")
	public String logout() {
		
		loginUserBean.setUserLogin(false);
		
		return "user/logout";
	}
	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		
		return "user/join";
	}
	
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		if(result.hasErrors()) {
			return "user/join";
		}
		
		userService.addUserInfo(joinUserBean);
		
		return "user/join_success";
	}
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {
		
		userService.getModifyUserInfo(modifyUserBean);
		
		return "user/modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean,
							BindingResult result) {
		if(result.hasErrors()) {
			
			return "user/modify";
		}
		
		userService.modifyUserInfo(modifyUserBean);
		
		return "user/modify_success";
		
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder blinder) {
		
		UserValidator validator1 = new UserValidator();
		blinder.addValidators(validator1);
		
	}
	
	
	@GetMapping("/userPurchasehistory")
	public String userPurchasehistory() {
		
		
		return "user/userPurchasehistory";
	}
	
	@GetMapping("/Userproduct")
	public String userProduct(Model model) {
	    List<OrderBean> orderList = orderService.getUserLoginOrderList(); // 로그인된 사용자의 주문 목록 가져오기
	    model.addAttribute("orderList", orderList);
	    return "user/Userproduct";
	}
	@GetMapping("/Userticket")
	public String Userticket(Model model) {
		  List<OrderBean> ticketList = orderService.getUserTicketList(); // 로그인된 사용자의 주문 목록 가져오기
		  model.addAttribute("ticketList", ticketList);
		  return "user/Userticket";
	}
	
	@GetMapping("/userPosthistory")
	public String userPosthistory() {
		
		
		return "user/userPosthistory";
	}
	@GetMapping("/UserInquiry")
	public String UserInquiry(Model model) {
		List<QuestionBean> questionsDetail = questionService.getAllQuestionUserDetails();
        model.addAttribute("questionsDetail", questionsDetail);
        return "user/UserInquiry";
	}
	
	
	@GetMapping("/userQuestionRead")
    public String questionRead(@RequestParam("questionid") int questionid,Model model) {
		
		QuestionBean questionBean1 = questionService.getQuestionContent(questionid);
		
		model.addAttribute("questionBean", questionBean1);
		model.addAttribute("questionid", questionid);
		return "user/userQuestionRead";
    }

	
	   
	
	
}