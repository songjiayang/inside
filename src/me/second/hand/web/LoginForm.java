package me.second.hand.web;

public class LoginForm {
	
	private String userNameOrEmail;
	private String passWord;
	private  int rememberme;
	
	public int getRememberme() {
		return rememberme;
	}
	public void setRememberme(int rememberme) {
		this.rememberme = rememberme;
	}
	public String getUserNameOrEmail() {
		return userNameOrEmail;
	}
	public void setUserNameOrEmail(String userNameOrEmail) {
		this.userNameOrEmail = userNameOrEmail;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	
}
