package me.second.hand.web;

import me.second.hand.entity.EmailSession;
import me.second.hand.service.UserEmail;
import me.second.hand.util.EmailAndSession;
import me.second.hand.util.session.MySessionContext;

public class OnceAgainEmail {
	
	
	public void sendEmail(UserEmail userEmail,String emailString) {
		String session = EmailAndSession.getSession(emailString);
		EmailSession emailSession=MySessionContext.getSession(session);
		userEmail.registerByEmail(emailSession, "email.txt", "Inside注册认证");
	}
	
	public void sendPassEmail(UserEmail userEmail,String emailString) {
		String session = EmailAndSession.getSession(emailString);
		EmailSession emailSession=MySessionContext.getSession(session);
		userEmail.registerByEmail(emailSession, "emailpassword.txt",
		"用户密码找回");
	}
	
	
}
