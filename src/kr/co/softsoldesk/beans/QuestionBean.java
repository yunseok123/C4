package kr.co.softsoldesk.beans;

import java.sql.Date;

public class QuestionBean {
	 	private int questionid;
	    private int useridx;
	    private String questiontitle;
	    private String questiontext;
	    private Date questiondate;
	    private String usernickname;
	    private String questionstatus; // 기본값 설정
	    private String answertext;
	    private int productId;
	    
	    private String productname;
		
	    
	    public QuestionBean() {
	    	
	    	questionstatus = "문의중";
	    }
		
		public String getAnswertext() {
			return answertext;
		}
		public void setAnswertext(String answertext) {
			this.answertext = answertext;
		}
		public String getQuestionstatus() {
			return questionstatus;
		}
		public void setQuestionstatus(String questionstatus) {
			this.questionstatus = questionstatus;
		}
		public String getUsernickname() {
			return usernickname;
		}
		public void setUsernickname(String usernickname) {
			this.usernickname = usernickname;
		}
		public int getQuestionid() {
			return questionid;
		}
		public void setQuestionid(int questionid) {
			this.questionid = questionid;
		}
		public int getUseridx() {
			return useridx;
		}
		public void setUseridx(int useridx) {
			this.useridx = useridx;
		}
		public String getQuestiontitle() {
			return questiontitle;
		}
		public void setQuestiontitle(String questiontitle) {
			this.questiontitle = questiontitle;
		}
		public String getQuestiontext() {
			return questiontext;
		}
		public void setQuestiontext(String questiontext) {
			this.questiontext = questiontext;
		}
		public Date getQuestiondate() {
			return questiondate;
		}
		public void setQuestiondate(Date questiondate) {
			this.questiondate = questiondate;
		}

		public int getProductId() {
			return productId;
		}

		public void setProductId(int productId) {
			this.productId = productId;
		}

		public String getProductname() {
			return productname;
		}

		public void setProductname(String productname) {
			this.productname = productname;
		}
		
			
	    
	    
		
	
}