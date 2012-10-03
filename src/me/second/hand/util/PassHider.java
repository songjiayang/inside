package me.second.hand.util;

import org.aspectj.weaver.patterns.ArgsAnnotationPointcut;

/**
 * 根据密码令牌,通过两次位操作实现加密和解密
 */
public class PassHider {
		
	public static final long  PASS_TOKEN1 = 20101l; 
	public static final long  PASS_TOKEN2 = 4060l;
	
	/**
	 * 加密实现
	 * @param pass
	 * @return
	 */
	public static String doOneWayEncryption(String pass) {
		char[] pb = pass.toCharArray();
		for (int i = 0; i < pb.length; i++) {
			pb[i]=(char)(pb[i]^PASS_TOKEN1^PASS_TOKEN2);
		}
		return new String(pb);
	}
	
	/**
	 * 解密实现
	 * @param pass
	 * @return
	 */
	public static String toKnowPass(String pass){
		char[] pb = pass.toCharArray();
		for (int i = 0; i < pb.length; i++) {
			pb[i]=(char)(pb[i]^PASS_TOKEN1^PASS_TOKEN2);
		}
		return new String(pb);
	}
	
}
