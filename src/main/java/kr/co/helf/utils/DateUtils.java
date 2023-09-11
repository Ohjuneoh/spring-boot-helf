package kr.co.helf.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM");
	
	public static String yyyyMM(Date date) {
		if (date == null) {
			return  null;
		}
		return format1.format(date);
	}
}
