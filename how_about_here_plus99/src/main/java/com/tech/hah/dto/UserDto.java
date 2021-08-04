package com.tech.hah.dto;

public class UserDto {
	private String mem_email;
	private String mem_phone;
	private String mem_nick;
	private String mem_pw;
	private String mem_access;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	public UserDto(String nickname, String email, String phone, String access) {
		this.mem_email = email;
		this.mem_phone = phone;
		this.mem_nick = nickname;
		this.mem_access = access;
	}
	public UserDto(String nickname, String mem_pw, String email, String phone, String access) {
		this.mem_email = email;
		this.mem_phone = phone;
		this.mem_nick = nickname;
		this.mem_access = access;
		this.mem_pw = mem_pw;
	}
	public String getMem_access() {
		return mem_access;
	}
	public void setMem_access(String mem_access) {
		this.mem_access = mem_access;
	}
	public String getMeme_email() {
		return mem_email;
	}
	public void setMeme_email(String meme_email) {
		this.mem_email = meme_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	

}
