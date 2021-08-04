package com.tech.hah.dto;

public class ReviewDto {
	private int r_num;
	private String reb_room;
	private int acc_code;
	
	
	
	public ReviewDto(int r_num, String reb_room, int acc_code) {
		this.r_num = r_num;
		this.reb_room = reb_room;
		this.acc_code = acc_code;
	}
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getReb_room() {
		return reb_room;
	}
	public void setReb_room(String reb_room) {
		this.reb_room = reb_room;
	}
	public int getAcc_code() {
		return acc_code;
	}
	public void setAcc_code(int acc_code) {
		this.acc_code = acc_code;
	}
	
	
}
