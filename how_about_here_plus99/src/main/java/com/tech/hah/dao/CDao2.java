package com.tech.hah.dao;

import java.util.ArrayList;
import java.util.Map;

import com.tech.hah.dto.Inquiry;
import com.tech.hah.dto.LoginDto;
import com.tech.hah.dto.ReserveCheckDto;
import com.tech.hah.dto.ReserveDto;
import com.tech.hah.dto.UserDto;
import com.tech.hah.dto.requestDto;

public interface CDao2 {
	public void joinMember(requestDto dto);
	
	public int emailCheck(requestDto dto);
	
	public UserDto loginuser(LoginDto dto);
	
	public void inquiry(Map map);

	public ArrayList<Inquiry> inquiryCheck(UserDto dto);

	public void insertReservation(ReserveDto dto);
	
	public ReserveCheckDto reserve_check(ReserveDto dto);

	
}
