package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.service.UserService;

@RestController
public class RestApiController {

   @Autowired
   private UserService userService;
   
   @GetMapping("/user/checkUserIdExist/{user_id}")
   public String checkUserIdExist(@PathVariable String user_id) {
      
      boolean chk = userService.checkuserIdExist(user_id);
      
      return chk+"";
   }
   
   @GetMapping("/user/checkUserNickExist/{user_nickname}")
	public String checkUserNickExist(@PathVariable String user_nickname) {
		
		boolean chk2 = userService.checkuserIdExist(user_nickname);
		
		return chk2+"";
	}
}