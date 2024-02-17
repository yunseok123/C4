package kr.co.softsoldesk.service;


import java.io.File;
import java.nio.file.Path;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.ReplyBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.BoardDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = System.currentTimeMillis()+"_"+
						   FilenameUtils.getBaseName(upload_file.getOriginalFilename())+"."+
						   FilenameUtils.getExtension(upload_file.getOriginalFilename());
		
		try {
			upload_file.transferTo(new File(path_upload+"/"+file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}
	
	public void addContentInfo(ContentBean writeContentBean) {
		/*
		System.out.println(writeContentBean.getContent_subject());
		System.out.println(writeContentBean.getContent_text());
		System.out.println(writeContentBean.getUpload_file().getSize());
		*/
		
		MultipartFile upload_file = writeContentBean.getUpload_file();
		
		if(upload_file.getSize()>0) {
			String file_name = saveUploadFile(upload_file);
			System.out.println(file_name);
			writeContentBean.setCommunity_file(file_name);
		}
		
		writeContentBean.setUser_idx(loginUserBean.getUser_idx());
		writeContentBean.setCommunity_nickname(loginUserBean.getUser_nickname());
		
		boardDao.addContentInfo(writeContentBean);
	}
	
	public String getBoardInfoName(int board_info_idx) {
		
		return boardDao.getBoardInfoName(board_info_idx);
	}
	
	public List<ContentBean> getContentList(int board_info_idx,int page){
		
		int start= (page-1) * page_listcnt;
		//게시판 메인에서 조회되는 첫번째 게시글의 인덱스
		//1페이지일 때, 0번째 인덱스부터 글이 시작(0~9)
		//2페이지일 때, 10번째 인덱스부터 글이 시작(10~19)
		RowBounds rowBounds = new RowBounds(start,page_listcnt);
		
		return boardDao.getContentList(board_info_idx,rowBounds);
		
	}
	
	public ContentBean getContentInfo(int community_id) {
		
		return boardDao.getContentInfo(community_id);
	}
	
	public void modifyContentInfo(ContentBean modifyContentBean) {
		
		MultipartFile upload_file = modifyContentBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifyContentBean.setCommunity_file(file_name);
		}
		boardDao.modifyContentInfo(modifyContentBean);
	}
	public void deleteContentInfo(int community_id) {
		boardDao.deleteContentInfo(community_id);
	}
	
	public PageBean getContent(int community_board_idx, int currentPage) {
		
		int content_Cnt = boardDao.getContentCnt(community_board_idx);
		//해당 게시판의 전체 게시글의 수
		PageBean pageBean = new PageBean(content_Cnt, currentPage, page_listcnt, page_paginationcnt);
		// 전체 게시글/현재 페이지/페이지 제한(10)/화면에 보여지는 버튼의 최대 수(10)를 매개변수로 하는 PageBean을 객체를 생성해 리턴
		
		return pageBean;
	}
	
	//댓글----------------------------------------------
	public void addReply(ReplyBean replyBean) {
			
		replyBean.setReply_user_idx(loginUserBean.getUser_idx());
			
		boardDao.addReply(replyBean);
	}

	public List<ReplyBean> getReplies(int community_id) {
		   return boardDao.getReplies(community_id);
	}
	
	// BoardService.java 내에 추가

	// 공지사항 추가
	public void addNotice(ContentBean noticeContentBean) {
		noticeContentBean.setUser_idx(loginUserBean.getUser_idx());
	    boardDao.addNoticeInfo(noticeContentBean);
	}

	// 공지사항 목록 조회
	public List<ContentBean> getNoticeList(int page) {
	    int start = (page - 1) * page_listcnt;
	    RowBounds rowBounds = new RowBounds(start, page_listcnt);
	    return boardDao.getNoticeList(rowBounds);
	}

	// 공지사항 상세 정보 조회
	public ContentBean getNoticeInfo(int notice_id) {
	    return boardDao.getNoticeInfo(notice_id);
	}
	// 
	public void deleteNotice(int notice_id) {
	    boardDao.deleteNoticeById(notice_id);
	}

		
}
