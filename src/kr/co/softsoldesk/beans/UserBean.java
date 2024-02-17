package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class UserBean {
   
   private int user_idx;
   
   @Size(min=2, max = 4)
   @Pattern(regexp = "[°¡-ÆR]*")
    private String user_name; 
   
   @Size(min = 4, max = 20)
   @Pattern(regexp = "[a-zA-Z0-9]*")
   @NotBlank
    private String user_id;
   
   @Size(min = 4, max = 20)
   @Pattern(regexp = "[°¡-ÆRa-zA-Z0-9]*")
    private String user_nickname;
    
   @Size(min = 4, max = 20)
   @Pattern(regexp = "[a-zA-Z0-9]*")
   @NotBlank
    private String user_password;
   
   @Size(min = 4, max = 20)
   @Pattern(regexp = "[a-zA-Z0-9]*")
   private String user_password2;
   
   @Size(min=1, max = 200)
   private String user_email;
   @Size(min=1, max = 200)
   private String user_address;
   @Size(min=1, max = 200)
   private String user_phonenumber;
   
   private boolean userIdExist;
   
   private boolean userNickExist;
   
   private boolean userLogin;
   
   private String user_role;
   
   
   
   public String getUser_role() {
	return user_role;
}

public void setUser_role(String user_role) {
	this.user_role = user_role;
}

public UserBean() {
      
      this.userIdExist = false;
      this.userLogin = false;
      this.userNickExist = false;
      
   }

   public int getUser_idx() {
      return user_idx;
   }

   public void setUser_idx(int user_idx) {
      this.user_idx = user_idx;
   }

   public String getUser_name() {
      return user_name;
   }

   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getUser_password() {
      return user_password;
   }

   public void setUser_password(String user_password) {
      this.user_password = user_password;
   }

   public String getUser_password2() {
      return user_password2;
   }

   public void setUser_password2(String user_password2) {
      this.user_password2 = user_password2;
   }

   public boolean isUserIdExist() {
      return userIdExist;
   }
   
   public boolean isUserNickExist() {
      return userNickExist;
   }

   public void setUserIdExist(boolean userIdExist) {
      this.userIdExist = userIdExist;
   }

   public boolean isUserLogin() {
      return userLogin;
   }

   public void setUserLogin(boolean userLogin) {
      this.userLogin = userLogin;
   }

   public String getUser_nickname() {
      return user_nickname;
   }

   public void setUser_nickname(String user_nickname) {
      this.user_nickname = user_nickname;
   }

   public String getUser_email() {
      return user_email;
   }

   public void setUser_email(String user_email) {
      this.user_email = user_email;
   }

   public String getUser_address() {
      return user_address;
   }

   public void setUser_address(String user_address) {
      this.user_address = user_address;
   }

   public String getUser_phonenumber() {
      return user_phonenumber;
   }

   public void setUser_phonenumber(String user_phonenumber) {
      this.user_phonenumber = user_phonenumber;
   }

   public void setUserNickExist(boolean userNickExist) {
      this.userNickExist = userNickExist;
   } 
   
   
}