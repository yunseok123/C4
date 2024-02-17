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
		//�Խ��� ���ο��� ��ȸ�Ǵ� ù��° �Խñ��� �ε���
		//1�������� ��, 0��° �ε������� ���� ����(0~9)
		//2�������� ��, 10��° �ε������� ���� ����(10~19)
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
		//�ش� �Խ����� ��ü �Խñ��� ��
		PageBean pageBean = new PageBean(content_Cnt, currentPage, page_listcnt, page_paginationcnt);
		// ��ü �Խñ�/���� ������/������ ����(10)/ȭ�鿡 �������� ��ư�� �ִ� ��(10)�� �Ű������� �ϴ� PageBean�� ��ü�� ������ ����
		
		return pageBean;
	}
	
	//���----------------------------------------------
	public void addReply(ReplyBean replyBean) {
			
		replyBean.setReply_user_idx(loginUserBean.getUser_idx());
			
		boardDao.addReply(replyBean);
	}

	public List<ReplyBean> getReplies(int community_id) {
		   return boardDao.getReplies(community_id);
	}
	
	// BoardService.java ���� �߰�

	// �������� �߰�
	public void addNotice(ContentBean noticeContentBean) {
		noticeContentBean.setUser_idx(loginUserBean.getUser_idx());
	    boardDao.addNoticeInfo(noticeContentBean);
	}

	// �������� ��� ��ȸ
	public List<ContentBean> getNoticeList(int page) {
	    int start = (page - 1) * page_listcnt;
	    RowBounds rowBounds = new RowBounds(start, page_listcnt);
	    return boardDao.getNoticeList(rowBounds);
	}

	// �������� �� ���� ��ȸ
	public ContentBean getNoticeInfo(int notice_id) {
	    return boardDao.getNoticeInfo(notice_id);
	}
	// 
	public void deleteNotice(int notice_id) {
	    boardDao.deleteNoticeById(notice_id);
	}

		
}
