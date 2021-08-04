package com.tech.hah.dto;

import java.sql.Timestamp;

public class CAccommodationDto {
	private int acc_code;
	private String acc_name;
	private String acc_type;
	private String acc_city;
	private String acc_dist;
	private String acc_addr;
	private String acc_owner;
	private String acc_phone;
	private Timestamp acc_regdate;
	private String acc_grade;
	private String acc_btype;
	private String acc_pubpool;
	private String acc_pufit;
	private String acc_facwifi;
	private String acc_facnet;
	private String acc_etcbre;
	private String acc_etcval;
	private int acc_rating;
	private String acc_notice;
	private String acc_mphoto;
	private int acc_srnum;
	private int acc_drnum;
	private int acc_twnum;
	private int acc_onnum;
	private int room_price;
	private int acc_drprice;
	private int acc_twprice;
	private int acc_onprice;
	private double acc_latitude;
	private double acc_longitude;
	private String photo_name;
	public CAccommodationDto(String acc_name, String acc_grade, int room_price, int acc_rating, String acc_dist,
			String photo_name, double acc_latitude, double acc_longitude, int acc_code, String acc_type) {
		this.acc_name = acc_name;
		this.acc_grade = acc_grade;
		this.room_price = room_price;
		this.acc_rating = acc_rating;
		this.acc_dist = acc_dist;
		this.photo_name = photo_name;
		this.acc_latitude = acc_latitude;
		this.acc_longitude = acc_longitude;
		this.acc_type = acc_type;
		this.acc_code = acc_code;
		
	}
	public CAccommodationDto(int acc_code, String acc_name, int room_price, double acc_latitude,
			double acc_longitude, String acc_type) {
		this.acc_code = acc_code;
		this.acc_name = acc_name;
		this.room_price = room_price;
		this.acc_latitude = acc_latitude;
		this.acc_longitude = acc_longitude;
		this.acc_type = acc_type;
	}
	public int getAcc_code() {
		return acc_code;
	}
	public void setAcc_code(int acc_code) {
		this.acc_code = acc_code;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public String getAcc_type() {
		return acc_type;
	}
	public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	}
	public String getAcc_city() {
		return acc_city;
	}
	public void setAcc_city(String acc_city) {
		this.acc_city = acc_city;
	}
	public String getAcc_dist() {
		return acc_dist;
	}
	public void setAcc_dist(String acc_dist) {
		this.acc_dist = acc_dist;
	}
	public String getAcc_addr() {
		return acc_addr;
	}
	public void setAcc_addr(String acc_addr) {
		this.acc_addr = acc_addr;
	}
	public String getAcc_owner() {
		return acc_owner;
	}
	public void setAcc_owner(String acc_owner) {
		this.acc_owner = acc_owner;
	}
	public String getAcc_phone() {
		return acc_phone;
	}
	public void setAcc_phone(String acc_phone) {
		this.acc_phone = acc_phone;
	}
	public Timestamp getAcc_regdate() {
		return acc_regdate;
	}
	public void setAcc_regdate(Timestamp acc_regdate) {
		this.acc_regdate = acc_regdate;
	}
	public String getAcc_grade() {
		return acc_grade;
	}
	public void setAcc_grade(String acc_grade) {
		this.acc_grade = acc_grade;
	}
	public String getAcc_btype() {
		return acc_btype;
	}
	public void setAcc_btype(String acc_btype) {
		this.acc_btype = acc_btype;
	}
	public String getAcc_pubpool() {
		return acc_pubpool;
	}
	public void setAcc_pubpool(String acc_pubpool) {
		this.acc_pubpool = acc_pubpool;
	}
	public String getAcc_pufit() {
		return acc_pufit;
	}
	public void setAcc_pufit(String acc_pufit) {
		this.acc_pufit = acc_pufit;
	}
	public String getAcc_facwifi() {
		return acc_facwifi;
	}
	public void setAcc_facwifi(String acc_facwifi) {
		this.acc_facwifi = acc_facwifi;
	}
	public String getAcc_facnet() {
		return acc_facnet;
	}
	public void setAcc_facnet(String acc_facnet) {
		this.acc_facnet = acc_facnet;
	}
	public String getAcc_etcbre() {
		return acc_etcbre;
	}
	public void setAcc_etcbre(String acc_etcbre) {
		this.acc_etcbre = acc_etcbre;
	}
	public String getAcc_etcval() {
		return acc_etcval;
	}
	public void setAcc_etcval(String acc_etcval) {
		this.acc_etcval = acc_etcval;
	}
	public int getAcc_rating() {
		return acc_rating;
	}
	public void setAcc_rating(int acc_rating) {
		this.acc_rating = acc_rating;
	}
	public String getAcc_notice() {
		return acc_notice;
	}
	public void setAcc_notice(String acc_notice) {
		this.acc_notice = acc_notice;
	}
	public String getAcc_mphoto() {
		return acc_mphoto;
	}
	public void setAcc_mphoto(String acc_mphoto) {
		this.acc_mphoto = acc_mphoto;
	}
	public int getAcc_srnum() {
		return acc_srnum;
	}
	public void setAcc_srnum(int acc_srnum) {
		this.acc_srnum = acc_srnum;
	}
	public int getAcc_drnum() {
		return acc_drnum;
	}
	public void setAcc_drnum(int acc_drnum) {
		this.acc_drnum = acc_drnum;
	}
	public int getAcc_twnum() {
		return acc_twnum;
	}
	public void setAcc_twnum(int acc_twnum) {
		this.acc_twnum = acc_twnum;
	}
	public int getAcc_onnum() {
		return acc_onnum;
	}
	public void setAcc_onnum(int acc_onnum) {
		this.acc_onnum = acc_onnum;
	}
	public int getRoom_price() {
		return room_price;
	}
	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}
	public int getAcc_drprice() {
		return acc_drprice;
	}
	public void setAcc_drprice(int acc_drprice) {
		this.acc_drprice = acc_drprice;
	}
	public int getAcc_twprice() {
		return acc_twprice;
	}
	public void setAcc_twprice(int acc_twprice) {
		this.acc_twprice = acc_twprice;
	}
	public int getAcc_onprice() {
		return acc_onprice;
	}
	public void setAcc_onprice(int acc_onprice) {
		this.acc_onprice = acc_onprice;
	}
	public double getAcc_latitude() {
		return acc_latitude;
	}
	public void setAcc_latitude(double acc_latitude) {
		this.acc_latitude = acc_latitude;
	}
	public double getAcc_longitude() {
		return acc_longitude;
	}
	public void setAcc_longitude(double acc_longitude) {
		this.acc_longitude = acc_longitude;
	}
	public String getphoto_name() {
		return photo_name;
	}
	public void setphoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
}
