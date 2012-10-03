package me.second.hand.entity;

public class Administor extends BaseEntity{
	
	
	private static final long serialVersionUID = 2448437741786368325L;

	private long id;
	
	private String userName;
	
	private String passwrod;
	
	private String permission;
	
	public long getId() {
		return id;
	}
	public  void setId(long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPasswrod() {
		return passwrod;
	}
	public void setPasswrod(String passwrod) {
		this.passwrod = passwrod;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	
}
