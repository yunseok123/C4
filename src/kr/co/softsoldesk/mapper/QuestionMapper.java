package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.OrderBean;
import kr.co.softsoldesk.beans.QuestionBean;

@Mapper
public interface QuestionMapper {



	
	@Select("SELECT Q.QUESTION_ID AS questionid, Q.ANSWER_TEXT AS answertext, Q.USER_IDX AS useridx, U.USER_NICKNAME AS usernickname, Q.QUESTION_TITLE AS questiontitle, Q.QUESTION_TEXT AS questiontext, Q.QUESTION_DATE AS questiondate, Q.QUESTION_STATUS AS questionstatus "
			+ "FROM QUESTIONS Q JOIN USERS U ON Q.USER_IDX = U.USER_IDX WHERE Q.PRODUCT_ID = #{productId} ORDER BY Q.QUESTION_ID ASC")
	List<QuestionBean> getQuestions(int productId);
	
	
	@Select("SELECT Q.QUESTION_ID AS questionid, " +
	        "Q.QUESTION_STATUS AS questionstatus, " +
	        "U.USER_NICKNAME AS usernickname, " +
	        "Q.QUESTION_TITLE AS questiontitle, " +
	        "Q.QUESTION_TEXT AS questiontext, " +
	        "Q.QUESTION_DATE AS questiondate, " +
	        "P.NAME AS productname " +
	        "FROM QUESTIONS Q " +
	        "JOIN USERS U ON Q.USER_IDX = U.USER_IDX " +
	        "JOIN PRODUCT P ON Q.PRODUCT_ID = P.PRODUCT_ID " +
	        "ORDER BY Q.QUESTION_ID ASC")
	List<QuestionBean> getAllQuestionDetails();
	
	
	@Select("SELECT Q.QUESTION_ID AS questionid, " +
	        "Q.QUESTION_STATUS AS questionstatus, " +
	        "U.USER_NICKNAME AS usernickname, " +
	        "Q.QUESTION_TITLE AS questiontitle, " +
	        "Q.QUESTION_TEXT AS questiontext, " +
	        "Q.QUESTION_DATE AS questiondate, " +
	        "P.NAME AS productname " +
	        "FROM QUESTIONS Q "+
	        "JOIN USERS U ON Q.USER_IDX = U.USER_IDX " +
	        "JOIN PRODUCT P ON Q.PRODUCT_ID = P.PRODUCT_ID " +
	        "WHERE Q.user_idx = #{userIdx} "+
	        "ORDER BY Q.QUESTION_ID ASC ")
	       
	List<QuestionBean> getAllQuestionUserDetails(int userIdx);
	
	


	

    
   
    
	@Insert("INSERT INTO QUESTIONS (USER_IDX, QUESTION_TITLE, QUESTION_TEXT, QUESTION_STATUS, PRODUCT_ID, QUESTION_ID) " +
	        "VALUES (#{useridx}, #{questiontitle}, #{questiontext}, #{questionstatus, jdbcType=VARCHAR}, #{productId}, questions_seq.NEXTVAL)")
	void insertQuestion(QuestionBean questionBean);


    
    
    @Select("SELECT u.USER_NICKNAME as usernickname, " +
            "q.QUESTION_TITLE as questiontitle, " +
            "q.QUESTION_TEXT as questiontext, " +
            "q.QUESTION_DATE as questiondate, " +
            "q.QUESTION_STATUS as questionstatus, " +
            "q.answer_text as answertext, " +
            "q.USER_IDX " +
            "FROM users u, questions q " +
            "WHERE u.user_idx = q.user_idx and question_id = #{question_id}")
    QuestionBean getQuestionContent(int questionid);
    
    
    @Select("SELECT u.USER_NICKNAME as usernickname, " +
            "q.QUESTION_TITLE as questiontitle, " +
            "q.QUESTION_TEXT as questiontext, " +
            "q.QUESTION_DATE as questiondate, " +
            "q.QUESTION_STATUS as questionstatus, " +
            "q.answer_text as answertext, " +
            "q.USER_IDX " +
            "FROM users u, questions q " +
            "WHERE u.user_idx = q.user_idx and question_id = #{questionid}+"
            + "and Q.user_idx = #{userIdx} ")
    QuestionBean getQuestionUserContent(int userIdx,int questionid);
    
	@Delete("delete from questions where QUESTION_ID = #{questionid}")
	void deleteQuestion(int questionid);
	
	 @Update("UPDATE QUESTIONS SET ANSWER_TEXT = #{answertext},  QUESTION_STATUS = '답변완료' WHERE QUESTION_ID = #{questionid}")
	    void updateAnswer(QuestionBean answerBean);
    
}
