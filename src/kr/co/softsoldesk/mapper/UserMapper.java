package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.UserBean;

public interface UserMapper {

	@Select("select user_name "
			+ "from users "
			+ "where user_id = #{user_id}")
	String checkUserIdExist(String user_id);
	
	@Select("select user_name "
			+ "from users "
			+ "where user_nickname = #{user_nickname}")
	String checkUserNickExist(String user_nickname);
	
	@Insert("insert into users(user_idx, user_id, user_name, user_email, user_password, user_address, user_phonenumber, user_nickname) "
			+ "values(user_seq.nextval, #{user_id}, #{user_name}, #{user_email}, #{user_password}, #{user_address}, #{user_phonenumber}, #{user_nickname})")
	void addUserInfo(UserBean joinUserBean);
	
	@Select("select user_idx, user_name, user_nickname, user_role "
			+ "from users "
			+ "where user_id=#{user_id} and user_password=#{user_password}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
	
	@Select("select user_id, user_name "
			+ "from users where "
			+ "user_idx = #{user_idx}")
	UserBean getModifyUserInfo(int user_idx);
	
	@Update("update users "
			+ "set user_password = #{user_password}, user_email = #{user_email}, user_phonenumber = #{user_phonenumber}, user_address = #{user_address} "
			+ "where user_idx = #{user_idx}")
	void modifyUserInfo(UserBean modifyUserBean);
	
}
