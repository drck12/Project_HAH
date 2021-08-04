package com.tech.hah.dto;

public class ReserveCheckDto {
	
	private int res_code;
	private int acc_code;
	private int room_code;
	private String r_type;
	private String s_date;
	private String e_date;
	private int r_price;
	private String r_name;
	private String r_phone;
	private String acc_name;
	private String r_status;
	private int accdays;
	private String photo_name;
	
	public ReserveCheckDto() {
		// TODO Auto-generated constructor stub
	}
	public ReserveCheckDto(int acc_code, String acc_name, int res_code, String r_type,
			String s_date, String e_date, int r_price, String r_name, String r_phone, String r_status,
			int accdays) {

		this.res_code = res_code;
		this.acc_code = acc_code;
		this.r_type = r_type;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_price = r_price;
		this.r_name = r_name;
		this.r_phone = r_phone;
		this.acc_name = acc_name;
		this.r_status = r_status;
		this.accdays = accdays;
	}
	
	public ReserveCheckDto(int acc_code, String acc_name, int res_code, int room_code, String r_type,
			String s_date, String e_date, int r_price, String r_name, String r_phone, String r_status,
			int accdays, String photo_name) {

		this.res_code = res_code;
		this.acc_code = acc_code;
		this.room_code = room_code;
		this.r_type = r_type;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_price = r_price;
		this.r_name = r_name;
		this.r_phone = r_phone;
		this.acc_name = acc_name;
		this.r_status = r_status;
		this.accdays = accdays;
		this.photo_name = photo_name;
	}
	
	public int getRes_code() {
		return res_code;
	}
	public void setRes_code(int res_code) {
		this.res_code = res_code;
	}
	public int getAcc_code() {
		return acc_code;
	}
	public void setAcc_code(int acc_code) {
		this.acc_code = acc_code;
	}
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_phone() {
		return r_phone;
	}
	public void setR_phone(String r_phone) {
		this.r_phone = r_phone;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public String getR_status() {
		return r_status;
	}
	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	public int getAccdays() {
		return accdays;
	}
	public void setAccdays(int accdays) {
		this.accdays = accdays;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	
	

}
