package me.second.hand.service;

import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.util.WebUtils;

import me.second.hand.entity.EmailSession;
import me.second.hand.entity.User;
import me.second.hand.util.emal.MimeMailService;

public class UserEmail {

	private static Map<String, Boolean> sessionMap = new HashMap<String, Boolean>();

	@Autowired
	private MimeMailService mimeMailService ;
	
	public void registerByEmail(EmailSession emailSession,String emailFilePath,String title) {
//		MimeMailService mimeMailService = new MimeMailService();
		mimeMailService.sendNotificationMail(emailSession,emailFilePath,title);
	}
	
	@Deprecated
	public boolean checkUserEmail(HttpSession httpSession) {

		if ((Boolean) sessionMap.get(httpSession.getId())) {
//			WebUtils.getSessionId(request);
			WebUtils.getSessionId(null);
			return true;
		}
		return false;
	}

}
