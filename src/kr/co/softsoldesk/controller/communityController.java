package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class communityController {
	
	@GetMapping("/commannounecment")
	public String commannounecment() {
		return "community/commannounecment";
	}
	
	@GetMapping("/commcontent")
	public String commcontent() {
		return "community/commcontent";
	}
	
	@GetMapping("/commlist")
	public String commlist() {
		return "community/commlist";
	}
	
	@GetMapping("/commWrite")
	public String commWrite() {
		return "community/commWrite";
	}
}



