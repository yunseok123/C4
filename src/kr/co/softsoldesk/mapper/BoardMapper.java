package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.ReplyBean;

public interface BoardMapper {

	@SelectKey(statement = "select community_seq.nextval from dual", keyProperty = "community_id",
			   before = true, resultType = int.class)
	//statement = "select content_seq.nextval from dual": �뛾�룇裕뉑틦占썲뜝�럥彛� �뜝�럥六삣뜝�룞�삕�뜝�럥裕� �뵓怨뺣쐡占쎄퉰�뤆�룊�삕 10�뜝�럩逾졾뜝�럥占썲뜝�럩紐든춯濡녹삕 11�뜝�럩諭� �뜝�럡�돮�슖�댙�삕 �뛾�룇瑗뱄옙�꼶
	//keyProperty = "content_idx": writeContentBean�뜝�럩逾� �뤆�룊�삕嶺뚯쉻�삕占썩뫅�삕 �뜝�럩肉녑뜝�럥裕� "content_idx" �뜝�럥爰쀥뜝�럡�뎽�뜝�럥�뱺 �뜝�럥堉뽩뜝�럥�닡
	//before = true: �뜝�럥�닡�뜝�럩�굥�뜝�럩踰� 占쎈쐩占쎈닑占쎈뉴占쎈닱筌뤾쑴逾� �뜝�럥堉꾢뜝�럥六у뜝�럥�뵹�뼨�먯삕 �뜝�럩�쓧�뜝�럥�뱺 �뜝�럥堉꾢뜝�럥六�
	//resultType = int.class: �뜝�룞�삕�뜝�럩肉��뜝�룞�삕 int�슖�댙�삕
	
	@Insert("insert into community "
			+ "(community_id, community_subject, community_text, community_file, "
			+ "user_idx, community_board_idx, community_date, community_nickname)"
			+ "values(#{community_id}, #{community_subject}, #{community_text}, #{community_file, jdbcType=VARCHAR}, "
			+ "#{user_idx}, #{community_board_idx}, sysdate, #{community_nickname})")
	void addContentInfo(ContentBean writeContentBean);
	
	@Select("select board_info_name "
			+ "from board_info_table "
			+ "where board_info_idx = #{board_info_idx}")
	String getBoardInfoName(int board_info_idx);
	
	@Select("select a1.community_id, a1.community_subject, a2.user_nickname as community_writer_name, "
			+ "to_char(a1.community_date, 'yyyy-mm-dd') as community_date "
			+ "from community a1, users a2 "
			+ "where a1.user_idx = a2.user_idx and a1.community_board_idx = #{board_info_idx}"
			+ "order by a1.community_id desc")
	List<ContentBean> getContentList(int board_info_idx,RowBounds rowBounds);
	
	@Select("select a1.user_nickname as community_writer_name, "
			+ "to_char(a2.community_date, 'yyyy-mm-dd') as community_date, "
			+ "a2.community_subject, a2.community_text, a2.community_file, "
			+ "a2.user_idx "
			+ "from users a1, community a2 "
			+ "where a1.user_idx = a2.user_idx "
			+ "and community_id = #{community_id}")
	ContentBean getContentInfo(int community_id);
	
	@Update("update community "
			+ "set community_subject = #{community_subject}, community_text = #{community_text}, community_file = #{community_file, jdbcType=VARCHAR }"
			+ "where community_id= #{community_id }")
	void modifyContentInfo(ContentBean modifyContentBean);
	
	
	
	@Delete("delete from community where community_id = #{community_id}")
	void deleteContentInfo(int community_id);
	
	//占쎈퉸占쎈뼣 野껊슣�뻻占쎈솇占쎌벥 占쎌읈筌ｋ떯占� 占쎈땾 揶쏉옙占쎌죬占쎌궎疫뀐옙
	@Select("select count(*) "
			+ "from community "
			+ "where community_board_idx = #{community_board_idx}")
	int getContentCnt(int community_board_idx);
	//筌띲끆而삭퉪占쏙옙�땾嚥∽옙 占쎈퉸占쎈뼣 野껊슣�뻻占쎈솇 甕곕뜇�깈揶쏉옙 占쎈툡占쎌뒄(揶쏉옙 野껊슣�뻻占쎈솇癰귨옙 野껊슣�뻻疫뀐옙占쎌벥 占쎈땾)
	
	//------------------------------------�뙎湲�
	//�뙎湲� �꽔湲�
	@Insert("INSERT INTO reply (reply_idx, reply_text, reply_user_idx, reply_content_idx) " +
		    "VALUES (reply_seq.nextval, #{reply_text}, #{reply_user_idx}, #{reply_content_idx})")
	void addReply(ReplyBean replyBean);


		
	//�뙎湲� �씫�뼱�삤湲�
	@Select("select a.user_nickname as user_nickname, b.reply_idx as reply_idx, b.reply_text as reply_text, b.reply_content_idx as reply_content_idx "
			+ "from users a, reply b "
			+ "where a.user_idx = b.reply_user_idx "
			+ "and reply_content_idx = #{reply_content_idx} "
			+ "order by b.reply_idx desc")
	List<ReplyBean> getReplies(int reply_content_idx);

	
	// 공지사항 추가
	@Insert("INSERT INTO notice (notice_id, title, content, user_idx, notice_date) VALUES (notice_seq.NEXTVAL, #{title}, #{content}, #{user_idx}, SYSDATE)")
	void addNoticeInfo(ContentBean noticeContentBean);

	// 공지사항 목록 조회
	@Select("SELECT notice_id, title, content, user_idx, notice_date FROM notice ORDER BY notice_date DESC")
	List<ContentBean> getNoticeList(RowBounds rowBounds);

	// 공지사항 상세 정보 조회
	@Select("SELECT notice_id, title, content, user_idx, notice_date FROM notice WHERE notice_id = #{notice_id}")
	ContentBean getNoticeInfo(@Param("notice_id") int notice_id);
	
	// 
	@Delete("DELETE FROM notice WHERE notice_id = #{noticeId}")
	void deleteNoticeById(int noticeId);


}
