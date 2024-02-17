package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.QuestionDao;
import kr.co.softsoldesk.dao.UserDao;
import kr.co.softsoldesk.mapper.QuestionMapper;


@Service
public class QuestionService {
	
	
	
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	
	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private UserDao userDao;
	
	 /*
	 private final QuestionMapper questionMapper;

	    @Autowired
	    public QuestionService(QuestionMapper questionMapper) {
	        this.questionMapper = questionMapper;
	    }
	    */
	

	    public List<QuestionBean> getQuestions(int productId) {
	    	
	    List<QuestionBean> questions = questionDao.getQuestions(productId);	
	    	
	   
	        return questions;
	    }
	    public List<QuestionBean> getAllQuestionDetails() {
	    	
		    List<QuestionBean> questionsDetail = questionDao.getAllQuestionDetails();	
		    	
		   
		        return questionsDetail;
		    }
	    
	    
	  
	    
	    public QuestionBean getQuestionContent(int questionId) {
	        return questionDao.getQuestionContent(questionId);
	    }
	   
	    public void createQuestion(QuestionBean question) {
	    	question.setUseridx(loginUserBean.getUser_idx());
	        questionDao.insertQuestion(question); // 데이터를 삽입하는 메서드
	    }
	    public void deleteQuestion(int questionid) {
			questionDao.deleteQuestion(questionid);
		}
	    
	    public void updateAnswer(QuestionBean answerBean) {
			
			questionDao.updateAnswer(answerBean);
		}
	    public List<QuestionBean> getAllQuestionUserDetails() {
	        int userIdx = loginUserBean.getUser_idx(); 
	        return questionDao.getAllQuestionUserDetails(userIdx); 
	    }
	    
	   
	    public QuestionBean getQuestionUserContent(int questionId) {
	    	int userIdx2 = loginUserBean.getUser_idx(); 
	        return questionDao.getQuestionUserContent(questionId,userIdx2);
	    }
	    
	    
}
