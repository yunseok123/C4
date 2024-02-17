package kr.co.softsoldesk.validtor;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.softsoldesk.beans.UserBean;

public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		UserBean userBean = (UserBean)target;
		
		String beanName = errors.getObjectName();
		String beanNickName = errors.getObjectName();

		
		if(beanName.equals("joinUserBean")||beanName.equals("modifyUserBean")) {

			if(userBean.getUser_password().equals(userBean.getUser_password2())==false) {
				errors.rejectValue("user_password", "NotEquals");
				errors.rejectValue("user_password2", "NotEquals");
			}
			
			if(beanName.equals("joinUserBean")) {
				if(userBean.isUserIdExist() == false) {
					
					errors.rejectValue("user_id", "DontCheckUserIdExist");
				}
			}
			if(beanNickName.equals("joinUserBean")) {
				if(userBean.isUserNickExist() == false) {
					
					errors.rejectValue("user_nickname", "DontCheckUserNickExist");
				}
			}
		}	
	}

	
}