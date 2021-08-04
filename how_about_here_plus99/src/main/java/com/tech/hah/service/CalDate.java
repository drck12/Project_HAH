package com.tech.hah.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CalDate {
	
	public String caldate() {
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat date = new SimpleDateFormat(format);
		String checkIn = date.format(cal.getTime());
		cal.add(cal.DATE, +1); // ��吏�瑜� ��猷� ������.
		String checkOut = date.format(cal.getTime());
		
		String accday = checkIn + " - " + checkOut;
		
		
		
		
		return accday;
		
		
		
	}

}
