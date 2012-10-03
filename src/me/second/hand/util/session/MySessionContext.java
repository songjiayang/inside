package me.second.hand.util.session;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import me.second.hand.entity.EmailSession;

public class MySessionContext {
    private static HashMap sesionMap = new HashMap();

    public static synchronized void AddSession(EmailSession session) {
        if (session != null) { 
        	sesionMap.put(session.getRegId(), session);
        }
    }

    public static synchronized void DelSession(EmailSession session) {
        if (session != null) {
        	sesionMap.remove(session.getRegId());
        }
    }

    public static synchronized EmailSession getSession(String session_id) {
        if (session_id == null) 
        return null;
        return (EmailSession)sesionMap.get(session_id);
    }
}