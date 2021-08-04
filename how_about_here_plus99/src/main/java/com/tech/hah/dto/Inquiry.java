package com.tech.hah.dto;

public class Inquiry {
	private String room_type;
	private String inquiry_type;
	private String phone;
	private String uemail;
	private String email;
	private String inquiry_content;
	private String write_day;
	private int seq;
	private String rein_inquiry;
	private String rein_regdate;
	
	
	public String getRein_inquiry() {
		return rein_inquiry;
	}
	public void setRein_inquiry(String rein_inquiry) {
		this.rein_inquiry = rein_inquiry;
	}
	public String getRein_regdate() {
		return rein_regdate;
	}
	public void setRein_regdate(String rein_regdate) {
		this.rein_regdate = rein_regdate;
	}
	public String getWrite_day() {
		return write_day;
	}
	public void setWrite_day(String write_day) {
		this.write_day = write_day;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInquiry_content() {
		return inquiry_content;
	}
	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	

	
}