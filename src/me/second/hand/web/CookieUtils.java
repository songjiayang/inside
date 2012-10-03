package me.second.hand.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.second.hand.cons.StaticInfo;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

public class CookieUtils {

	public static void saveCookie(String username, String password,
			HttpServletRequest request, HttpServletResponse response) {
		// cookie的有效期
		long validTime = System.currentTimeMillis()
				+ (StaticInfo.BROWSER_COOKIE_MAX_AGE);
		String cookieValueWithMD5 = username + ":" + validTime;
		String cookieValueWithBase64 = Base64.encode(cookieValueWithMD5
				.getBytes());
		String cookieValueWithBase64_1=Base64.encode(cookieValueWithBase64.getBytes());
		String cookieValueWithBase64_2=Base64.encode(cookieValueWithBase64_1.getBytes());
		Cookie cookie = new Cookie(StaticInfo.COOKIE_NAME,
				cookieValueWithBase64_2);
		cookie.setMaxAge(StaticInfo.BROWSER_COOKIE_MAX_AGE);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
	}

	public static String validateCookie(HttpServletRequest request)
			throws UnsupportedEncodingException {
		Cookie[] cookies = request.getCookies();
		String cookieValue = null;
		if (null != cookies) {
			for (int i = 0; i < cookies.length; i++) {
				if (StaticInfo.COOKIE_NAME.equals(cookies[i].getName())) {
					cookieValue = cookies[i].getValue();
				}
			}
		}
		if (null == cookieValue) {
			return null;
		}
		String cookieVluesAfterDecode = new String(Base64.decode(cookieValue),
				"utf-8");
		String cookieVluesAfterDecode_1 = new String(Base64.decode(cookieVluesAfterDecode),
		"utf-8");
		String cookieVluesAfterDecode_2 = new String(Base64.decode(cookieVluesAfterDecode_1),
		"utf-8");
		String cookieValues[] = cookieVluesAfterDecode_2.split(":");
		String username = cookieValues[0];
		if (null != username) {
			return username;
		} else {
			return null;
		}

	}

	public static void deleteCookie(HttpServletRequest request,
			HttpServletResponse response) {
		Cookie cookie = new Cookie(StaticInfo.COOKIE_NAME, null);
		cookie.setMaxAge(0);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
	}
}
