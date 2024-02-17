package kr.co.softsoldesk.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class Admin {
	
	
	@GetMapping("/vote")
	public String login() {
		return "vote2/vote";
	}

}
