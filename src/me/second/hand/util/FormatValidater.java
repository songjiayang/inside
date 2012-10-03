package me.second.hand.util;
public class FormatValidater {

	/**
	 * 邮箱验证
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email) {
		return email.matches("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
	}
	
	/**
	 * 是否为手机号,支持开头为13,15,18的用户
	 * @param number
	 * @return
	 */
	public static boolean isMobile(String number){
		return number.matches("^[1][3,5,8]+\\d{9}");
	}
	
	/**
	 * 座机是否合格，包括区号和电话号码
	 * @param tel
	 * @return
	 */
	public static boolean isTel(String tel) {
		return tel.matches("\\d{4}-\\d{8}|\\d{4}-\\d{7}|\\d{3}-\\d{8}");
	}
	
	/**
	 * qq验证，全部是数字，并且起始不为0
	 * @param qq
	 * @return
	 */
	public static boolean isQQ(String qq){
		return qq.matches("[1-9][0-9]{4,13}");
	}
	
	/**
	 * 合法的学号
	 * @param id
	 * @return
	 */
	public static boolean isIdNumer(String id){
		return id.matches("[0-9]{8,13}");
	}
	
	/**
	 * 用户名,可以为字母,数字,下划线，中文的任意组合
	 * @param username
	 * @return
	 */
	public static boolean isUserName(String username){
		
		return username.matches("[a-zA-Z-0-9_-[\u4e00-\u9fa5]]{2,16}");
	}
	
	/**
	 * 中文名
	 * @param value
	 * @return
	 */
	public static boolean isRealName(String value) {
		return value.matches("[\u4e00-\u9fa5]+$");
	}
	
	/**
	 * ip验证
	 * @param ip
	 * @return
	 */
	public static boolean isIp(String ip){
		return ip.matches("\\d{1,3}+\\.\\d{1,3}+\\.\\d{1,3}+\\.\\d{1,3}");
	}
	
	/**
	 * 验证是否为合法的url
	 * @param url
	 * @return
	 */
	public static boolean isURL(String url){
		return url.matches("[a-zA-z]+://[^\\s]*");
	}
}
