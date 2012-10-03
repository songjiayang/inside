package me.second.hand.util;

import java.util.HashMap;

import me.second.hand.entity.EmailSession;

/**
 * 存储Email对应的SessionId
 * 
 * @author ww
 * 
 */
public class EmailAndSession {
	private static HashMap emailHashMapMap = new HashMap();

	public static synchronized void AddSession(String emailString,
			String session) {
		if (session != null) {
			emailHashMapMap.put(emailString, session);
		}
	}

	public static synchronized void DelSession(String emailString) {

		emailHashMapMap.remove(emailString);

	}

	public static synchronized String getSession(String emailString) {
		if (emailString == null)
			return null;
		String tmep=(String)emailHashMapMap.get(emailString);
		return tmep;
	}
}
