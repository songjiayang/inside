package me.second.hand.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import me.second.hand.cons.StaticInfo;

import org.apache.log4j.Logger;

public class MyTimeUtil {
	
	static Logger log = Logger.getLogger(MyTimeUtil.class);
	
	public static String getSystemTime(){
		Date date = new Date();
		DateFormat df = new SimpleDateFormat(StaticInfo.TIME_STYPE);
		return df.format(date);
	}
	
	public static String getSystemTime(String type){
		Date date = new Date();
		DateFormat df = new SimpleDateFormat(type);
		return df.format(date);
	}
	
	public static String changeTimeToDate(String time){
		Date d = null;
		DateFormat  df = new SimpleDateFormat(StaticInfo.TIME_STYPE_DAY);
		try {
			 d =df.parse(time);
		} catch (ParseException e) {
			log.debug(e.getMessage()+"造成时间转换出错");
			return time;
		}
		return df.format(d);
	}
	
	public static boolean timeCanChanged(String time){
		Calendar c = Calendar.getInstance();  
		try {
			c.setTime(new SimpleDateFormat(StaticInfo.TIME_STYPE).parse(time));
		} catch (ParseException e) {
			log.debug(e.getMessage()+"造成时间转换出错");
		}
		if ((System.currentTimeMillis()-c.getTimeInMillis())>StaticInfo.ONE_HOUR) {
			return true;
		}
		return false;
	}

	public static void main(String[] args) {
		System.out.println(getSystemTime());
	}
	
	public static boolean timeCanChanged(long time,long timeMissing){
		if ((System.currentTimeMillis()-time)>timeMissing) {
			return true;
		}
		return false;
	}
	
}
