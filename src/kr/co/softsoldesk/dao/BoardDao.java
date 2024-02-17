package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.ReplyBean;
import kr.co.softsoldesk.mapper.BoardMapper;

@Repository
public class BoardDao {

	@Autowired
	private BoardMapper boardMapper;
	
	public void addContentInfo(ContentBean writerContentBean) {

		boardMapper.addContentInfo(writerContentBean);
	}
	
	public String getBoardInfoName(int board_info_idx) {
		
		return boardMapper.getBoardInfoName(board_info_idx);
	}
	
	public List<ContentBean> getContentList(int board_info_idx, RowBounds rowBounds){
		
		return boardMapper.getContentList(board_info_idx,rowBounds);
	}
	
	public ContentBean getContentInfo(int community_id) {
		
		return boardMapper.getContentInfo(community_id);
	}
	
	public void modifyContentInfo(ContentBean modifyContentBean) {
		
		boardMapper.modifyContentInfo(modifyContentBean);
	}
	
	public void deleteContentInfo(int community_id) {
		
		boardMapper.deleteContentInfo(community_id);
	}
	
	public int getContentCnt(int community_board_idx) {
		
		return boardMapper.getContentCnt(community_board_idx);
	}
	
	//�뙎湲�
	public void addReply(ReplyBean replyBean) {
			
		boardMapper.addReply(replyBean);
	}
	
	//�뙎湲� �씫�뼱�삤湲�
	public List<ReplyBean> getReplies(int community_id){
			
		return boardMapper.getReplies(community_id);
	}
	
	// 공지사항 추가
    public void addNoticeInfo(ContentBean noticeContentBean) {
        boardMapper.addNoticeInfo(noticeContentBean);
    }

    // 공지사항 목록 조회
    public List<ContentBean> getNoticeList(RowBounds rowBounds) {
        return boardMapper.getNoticeList(rowBounds);
    }

    // 공지사항 상세 정보 조회
    public ContentBean getNoticeInfo(int notice_id) {
        return boardMapper.getNoticeInfo(notice_id);
    }
    
    public void deleteNoticeById(int notice_id) {
    	boardMapper.deleteNoticeById(notice_id);
    }
}
