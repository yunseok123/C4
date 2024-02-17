package kr.co.softsoldesk.service;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	public boolean checkuserIdExist(String user_id) {
		
		String user_name = userDao.checkUserIdExist(user_id);
		
		if(user_name == null) {
			
			return true;
		}else {
			return false;
		}	
	}
	
	public boolean checkuserNickExist(String user_nickname) {
		
		String user_nick = userDao.checkUserNickExist(user_nickname);
		
		if(user_nick == null) {
			
			return true;
		}else {
			return false;
		}	
	}
	
	public void addUserInfo(UserBean joinUserBean) {
		
		userDao.addUserInfo(joinUserBean);
	}
	
	public void getLoginUserInfo(UserBean tempLoginUserBean) {
		
		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);
		
		if(tempLoginUserBean2 != null) {
			
			loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
			loginUserBean.setUser_name(tempLoginUserBean2.getUser_name());
			loginUserBean.setUser_nickname(tempLoginUserBean2.getUser_nickname());
			loginUserBean.setUser_role(tempLoginUserBean2.getUser_role());
			loginUserBean.setUserLogin(true);
		}
	}
	
	public void getModifyUserInfo(UserBean modifyUserBean) {
		
		UserBean tempModifyUserBean = userDao.getModifyUserInfo(loginUserBean.getUser_idx());
		// òÑ û¨ Î°úÍ∑∏ ù∏ êú  öå õê ùò  öå õêÎ≤àÌò∏Î•  Îß§Í∞úÎ≥  àòÎ°  Î≥¥ÎÇ¥ DB óê Ñú  öå õê †ïÎ≥  Î∂àÎü¨ ò§Í∏ 
		
		// àò †ï ï†  öå õê †ïÎ≥¥Î   Í∞ùÏ≤¥ óê Ï£ºÏûÖ
		modifyUserBean.setUser_id(tempModifyUserBean.getUser_id());
		modifyUserBean.setUser_name(tempModifyUserBean.getUser_name());//¥–≥◊¿”¿œ∞Õ
		modifyUserBean.setUser_idx(tempModifyUserBean.getUser_idx());
			
	}
	
	public void modifyUserInfo(UserBean modifyUserBean) {
		
		modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
		
		userDao.modifyUserInfo(modifyUserBean);
		
	}
}

