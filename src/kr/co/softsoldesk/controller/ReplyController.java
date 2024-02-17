package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.ReplyBean;
import kr.co.softsoldesk.service.BoardService;

@RestController
public class ReplyController {
	
    @Autowired
    private BoardService boardService;
	
	
	 @PostMapping("/reply") public ReplyBean addReply(@RequestBody ReplyBean replyBean) {
	 
		 boardService.addReply(replyBean);
		 System.out.println(replyBean.getReply_idx());
	 
		 return replyBean; 
	 }

	
	@GetMapping("/replies")
	public List<ReplyBean> getReplies(@RequestParam("reply_content_idx") int reply_content_idx) {
	    List<ReplyBean> replies = boardService.getReplies(reply_content_idx);
	    return replies;
	}


}
