package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class ContentBean {

    private int community_id;
    
    @NotBlank//not null
    private String community_subject;//占쎌젫筌륅옙
    @NotBlank
    private String community_text;//癰귣챶揆
    
    private String community_file;
    private int user_idx;
    private int community_board_idx;
    private String community_date;
    
    private int community_writer_idx;
    
    private String community_writer_name;
    
    private String community_nickname;
    
    
    private int notice_id;
    private String title;
    private String content;
    private int user_idx2;
    private String notice_date;
    
    
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public String getCommunity_subject() {
		return community_subject;
	}
	public void setCommunity_subject(String community_subject) {
		this.community_subject = community_subject;
	}
	public String getCommunity_text() {
		return community_text;
	}
	public void setCommunity_text(String community_text) {
		this.community_text = community_text;
	}
	public String getCommunity_file() {
		return community_file;
	}
	public void setCommunity_file(String community_file) {
		this.community_file = community_file;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getCommunity_board_idx() {
		return community_board_idx;
	}
	public void setCommunity_board_idx(int community_board_idx) {
		this.community_board_idx = community_board_idx;
	}
	public String getCommunity_date() {
		return community_date;
	}
	public void setCommunity_date(String community_date) {
		this.community_date = community_date;
	}
	public String getCommunity_writer_name() {
		return community_writer_name;
	}
	public void setCommunity_writer_name(String community_writer_name) {
		this.community_writer_name = community_writer_name;
	}
	
	public String getCommunity_nickname() {
		return community_nickname;
	}
	public void setCommunity_nickname(String community_nickname) {
		this.community_nickname = community_nickname;
	}


	public int getCommunity_writer_idx() {
		return community_writer_idx;
	}
	public void setCommunity_writer_idx(int community_writer_idx) {
		this.community_writer_idx = community_writer_idx;
	}
	
	


	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUser_idx2() {
		return user_idx2;
	}
	public void setUser_idx2(int user_idx2) {
		this.user_idx2 = user_idx2;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}




	private MultipartFile upload_file;//�뇡�슢�뵬占쎌뒭占쏙옙揶쏉옙 癰귣�沅� 占쎈솁占쎌뵬 占쎈쑓占쎌뵠占쎄숲
    
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}

}
