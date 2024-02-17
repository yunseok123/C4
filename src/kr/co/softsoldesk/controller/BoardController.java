package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
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

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/main")
	public String main(@RequestParam("board_info_idx") int board_info_idx, Model model,
					   @RequestParam(value = "page", defaultValue = "1") int page) {
		
		// 공지사항 목록 추가
	    List<ContentBean> noticeList = boardService.getNoticeList(1); // 첫 페이지의 공지사항 목록
	    model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("board_info_idx", board_info_idx);
		
		String boardInfoName = boardService.getBoardInfoName(board_info_idx);
		model.addAttribute("boardInfoName", boardInfoName);
		
		List<ContentBean> contentList = boardService.getContentList(board_info_idx,page);
		model.addAttribute("contentList", contentList);
		
		PageBean pageBean = boardService.getContent(board_info_idx, page);
		model.addAttribute("pageBean",pageBean);
		//파라미터로 받은 현재 페이지와 게시판 번호를 매개변수로 현재 페이지에 대한 정보를 반환 후 board/main.jsp로 리턴
		
		return "board/main";
	}
	@GetMapping("/read")
	public String read(@RequestParam("board_info_idx") int board_info_idx,
					   @RequestParam("community_id") int community_id,
					   Model model) {
		
		// 공지사항 목록 추가
	    List<ContentBean> noticeList = boardService.getNoticeList(1); // 첫 페이지의 공지사항 목록
	    model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("board_info_idx", board_info_idx);
		
		ContentBean readContentBean = boardService.getContentInfo(community_id);
		
		//System.out.println(readContentBean.getCommunity_writer_name());
		
		model.addAttribute("readContentBean", readContentBean);
		model.addAttribute("community_id", community_id);
		
		model.addAttribute("loginUserBean", loginUserBean);
		
		return "board/read";
	}
	
	
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") ContentBean writeContentBean,
						@RequestParam("board_info_idx") int board_info_idx) {
		
		writeContentBean.setCommunity_board_idx(board_info_idx);
		
		return "board/write";
	}
	
	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") ContentBean writeContentBean,
							BindingResult result) {
		if(result.hasErrors()) {
			return "board/write";
		}
		
		boardService.addContentInfo(writeContentBean);
		
		
		return "board/write_success";
		
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("board_info_idx") int board_info_idx, 
						 @RequestParam("community_id") int community_id, 
						 @ModelAttribute("modifyContentBean") ContentBean modifyContentBean,
						 Model model) {
		
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("community_id", community_id);
		 
		//하나의 게시글 정보 가져오기
		ContentBean tempContentBean = boardService.getContentInfo(community_id);
		
		modifyContentBean.setCommunity_writer_name(tempContentBean.getCommunity_writer_name());
		modifyContentBean.setCommunity_date(tempContentBean.getCommunity_date());
		modifyContentBean.setCommunity_subject(tempContentBean.getCommunity_subject());
		modifyContentBean.setCommunity_text(tempContentBean.getCommunity_text());
		modifyContentBean.setCommunity_file(tempContentBean.getCommunity_file());
		
		modifyContentBean.setCommunity_board_idx(board_info_idx);
		modifyContentBean.setCommunity_id(community_id);
		
		model.addAttribute("modifyContentBean", modifyContentBean);
		
		return "board/modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyContentBean") ContentBean modifyContentBean,
							  BindingResult result) {
		if(result.hasErrors()) {
			return "board/modify";
		}
		boardService.modifyContentInfo(modifyContentBean);
		return "board/modify_success";
	}
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("board_info_idx") int board_info_idx,
						 @RequestParam("community_id") int community_id,
						 Model model) {
		boardService.deleteContentInfo(community_id);
		
		model.addAttribute("board_info_idx",board_info_idx);
		return "board/delete";
	}
	
	// 공지사항 상세보기
	@GetMapping("/readnotice")
	public String readNotice(@RequestParam("notice_id") int notice_id, Model model) {
	    ContentBean noticeContent = boardService.getNoticeInfo(notice_id);
	    model.addAttribute("notice", noticeContent);
	    return "board/readnotice";
	}


}
