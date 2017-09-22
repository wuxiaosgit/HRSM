package com.xhhy.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	private static SimpleDateFormat sdf ;
	
	
	public static Date stringToDate(String str,String format){
		sdf = new SimpleDateFormat(format);
		Date date = null;
		try {
			 date = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String dateToString(Date date,String format){
		sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
	
}
