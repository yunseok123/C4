package kr.co.softsoldesk.beans;

public class ReplyBean {

	int reply_idx;
    String reply_text;
    int reply_user_idx;
    int reply_content_idx;
    
    String user_nickname;
    
    private String reply_img;
    
    
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public String getReply_text() {
		return reply_text;
	}
	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}
	public int getReply_user_idx() {
		return reply_user_idx;
	}
	public void setReply_user_idx(int reply_user_idx) {
		this.reply_user_idx = reply_user_idx;
	}
	public int getReply_content_idx() {
		return reply_content_idx;
	}
	public void setReply_content_idx(int reply_content_idx) {
		this.reply_content_idx = reply_content_idx;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getReply_img() {
		return reply_img;
	}
	public void setReply_img(String reply_img) {
		this.reply_img = reply_img;
	}

    
    
}
