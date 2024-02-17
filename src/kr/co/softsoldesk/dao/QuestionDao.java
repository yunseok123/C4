	package kr.co.softsoldesk.dao;
	
	import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.QuestionBean;
	
	import kr.co.softsoldesk.mapper.QuestionMapper;
	@Repository
	public class QuestionDao {
		
		@Autowired
		private QuestionMapper questionMapper;
		
		public List<QuestionBean> getQuestions(int productId) {
			List<QuestionBean> QuestionList=questionMapper.getQuestions(productId);
	    	
	    	return QuestionList;
	        
	    }
		
		public List<QuestionBean> getAllQuestionDetails() {
			List<QuestionBean> QuestionDetailList=questionMapper.getAllQuestionDetails();
	    	
	    	return QuestionDetailList;
	        
	    }
		public QuestionBean getQuestionContent(int questionid) {
			
			return questionMapper.getQuestionContent(questionid);
		}
		
		public void insertQuestion(QuestionBean question) {
	        questionMapper.insertQuestion(question); // 데이터를 삽입하는 메서드
	        
	       
	    }
		public void deleteQuestion(int questionid) {
			questionMapper.deleteQuestion(questionid);
		}
		
		public void updateAnswer(QuestionBean answerBean) {
			
			questionMapper.updateAnswer(answerBean);
		}
		 public List<QuestionBean> getAllQuestionUserDetails(int userIdx) {
		        return questionMapper.getAllQuestionUserDetails(userIdx);
		 }
		 
		 public QuestionBean getQuestionUserContent(int questionid,int userIdx) {
				
				return questionMapper.getQuestionUserContent(questionid,userIdx);
			}
		
		
		
		
		
		
	}
