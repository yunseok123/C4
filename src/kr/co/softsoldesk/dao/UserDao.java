package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.UserMapper;

@Repository
public class UserDao {

	@Autowired
	private UserMapper userMapper;
	
	public String checkUserIdExist(String user_id) {
		
		return userMapper.checkUserIdExist(user_id);
	}
	
	public String checkUserNickExist(String user_nickname) {
		
		return userMapper.checkUserNickExist(user_nickname);
	}
	
	public void addUserInfo(UserBean joinUserBean) {
		
		userMapper.addUserInfo(joinUserBean);
	}
	
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		return userMapper.getLoginUserInfo(tempLoginUserBean);
	}
	
	public UserBean getModifyUserInfo(int user_idx) {
		
		return userMapper.getModifyUserInfo(user_idx);
	}
	
	public void modifyUserInfo(UserBean modifyUserBean) {
		
		userMapper.modifyUserInfo(modifyUserBean);
	}
	
	
}
