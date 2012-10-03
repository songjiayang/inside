package me.second.hand.exception;

public class UserHadException extends Exception{

	private static final long serialVersionUID = -7342933353857435777L;
	
	private String error;

	public UserHadException(String error) {
		super();
		this.error = error;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
	
	
	
}
