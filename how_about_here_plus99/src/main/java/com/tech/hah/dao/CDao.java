package com.tech.hah.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tech.hah.dto.CAccommodationDto;
import com.tech.hah.dto.ReserveCheckDto;
import com.tech.hah.dto.ReserveDto;

public class CDao {

	public ArrayList<CAccommodationDto> list(String acc_type_, String[] checkList_, String[] bedType_, String person_, String date_,
			String[] hGrade_, String order_,String latitude_, String longitude_,  String dist_) throws Exception {

		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Double latitude = 37.48199565493406;
		Double longitude = 126.89814767858874;
		String dist = " and acc_dist=1";
		String sql = "";
		String checkIn = "";
		String checkOut = "";
		String bedType = "";
		String hGrade = "";
		double person = 2;
		int accDays = 1;
		String checkList = "";
		String order = "order by acc_rating desc";
		

		if (dist_ != null && dist_ != "") {
			dist = " and acc_dist=" + dist_;
		}
		if(dist_ == "myplace") {
			dist = "";
		}

		if (longitude_ != null && latitude_ != null && longitude_ != "" && latitude_ != "") {
			longitude = Double.parseDouble(longitude_);
			latitude = Double.parseDouble(latitude_);
		}

		if (order_ != null) {
			if (order_.equals("recommend")) {
				order = "order by acc_rating desc";
			}
			if (order_.equals("lowprice")) {
				order = "order by room_price";
			}
			if (order_.equals("highprice")) {
				order = "order by room_price desc";
			}
			if (order_.equals("distance")) {
				order = "order by distance";
			}
		}

		if (person_ != null) {
			person = Double.parseDouble(person_);
		}

		// today, tomorrow 援ы���� �⑥��
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat date = new SimpleDateFormat(format);
		checkIn = date.format(cal.getTime());
		cal.add(cal.DATE, +1); // ��吏�瑜� ��猷� ������.
		checkOut = date.format(cal.getTime());

		// ��吏� ������

		if (date_ != "" && date_ != null && date_.substring(0, 1) != "2") {
			checkIn = date_.substring(0, 10);
			checkOut = date_.substring(13, 23);
			Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(checkIn);
			Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(checkOut);
			long diffSec = (format1.getTime() - format2.getTime()) / 1000; // 珥� 李⑥��
			long diffDays = diffSec / (24 * 60 * 60); // �쇱���� 李⑥��
			accDays = (int) Math.abs(diffDays);
		}

		if (bedType_ != null) {
			for (int i = 0; i < bedType_.length; i++) {
				if (i == 0) {
					bedType = "and(room_type='" + bedType_[i] + "'";
				} else {
					bedType += " or room_type='" + bedType_[i] + "'";
				}
				if (i == bedType_.length - 1) {
					bedType += ")";
				}
			}
		}

		if (hGrade_ != null) {
			for (int i = 0; i < hGrade_.length; i++) {
				if (hGrade_[i].equals("fivestar")) {
					hGrade_[i] = "5성급";
				}
				if (hGrade_[i].equals("fspecial")) {
					hGrade_[i] = "특1급";
				}
				if (hGrade_[i].equals("special")) {
					hGrade_[i] = "특급";
				}
				if (hGrade_[i].equals("pension")) {
					hGrade_[i] = "펜션";
				}
				if (hGrade_[i].equals("poolvilla")) {
					hGrade_[i] = "풀빌라";
				}
				if (hGrade_[i].equals("luxury")) {
					hGrade_[i] = "럭셔리";
				}
			}
			for (int i = 0; i < hGrade_.length; i++) {
				if (i == 0) {
					hGrade = "and(acc_grade='" + hGrade_[i] + "'";
				} else {
					hGrade += " or acc_grade='" + hGrade_[i] + "'";
				}
				if (i == hGrade_.length - 1) {
					hGrade += ")";
				}
			}
		}

		if (checkList_ != null) {
			for (int i = 0; i < checkList_.length; i++) {
				checkList += " and " + checkList_[i] + " is not null ";
			}
		}

		sql = "select z.*,x.photo_name,CALC_DISTANCE(" + latitude + ", " + longitude
				+ ", z.acc_latitude, z.acc_longitude) AS DISTANCE from "
				+ "(select * from (select row_number() over(partition by j.acc_code order by k.room_price desc)as "
				+ "rnum,j.*,k.room_code,k.room_type,k.room_price,count(j.acc_code) OVER(PARTITION BY j.acc_code) "
				+ "AS person_count from accommodation j, (select * from (select b.*,count(b.room_code) "
				+ "OVER(PARTITION BY b.room_code) AS room_count"
				+ " from ((select day from (SELECT TO_CHAR( TO_DATE('20210628', 'YYYY-MM-DD') + "
				+ "ROWNUM-1, 'YYYY-MM-DD') AS DAY FROM DUAL CONNECT BY level <= ROUND"
				+ "( TO_DATE('20221010', 'YYYY-MM-DD') - TO_DATE('20210628', 'YYYY-MM-DD'))) " + "where day BETWEEN '"
				+ checkIn + "' AND '" + checkOut + "') a CROSS JOIN "
				+ "(SELECT x.room_code, x.acc_code, x.room_type, x.room_price from room x INNER JOIN accommodation y "
				+ "ON x.acc_code = y.acc_code WHERE 1=1) b LEFT OUTER JOIN reserve c ON b.room_code = c.room_code AND "
				+ "a.day BETWEEN c.s_date AND c.e_date-1) where res_code is null) where room_count>" + accDays + ") k "
				+ "where j.acc_code = k.acc_code "+ bedType+" ) where  rnum=1 and person_count >=" + person +"and (acc_type = "+acc_type_ + hGrade
				+ checkList + dist + ")z left join photo x on(z.acc_code=x.acc_code and x.photo_type = 'MAIN') "
				+ order;

		System.out.println(sql);
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		ArrayList<CAccommodationDto> dtos = new ArrayList<CAccommodationDto>();

		while (rs.next()) {
			int acc_code = rs.getInt("acc_code");
			String acc_name = rs.getString("acc_name");
			String acc_dist = rs.getString("acc_addrinfo");
			String acc_grade = rs.getString("acc_grade");
			String acc_type = rs.getString("acc_type");
			int room_price = rs.getInt("room_price");
			int acc_rating = rs.getInt("acc_rating");
			String photo_name = rs.getString("photo_name");
			double acc_latitude = rs.getDouble("acc_latitude");
			double acc_longitude = rs.getDouble("acc_longitude");

			CAccommodationDto dto = new CAccommodationDto(acc_name, acc_grade, room_price, acc_rating, acc_dist,
					photo_name, acc_latitude, acc_longitude, acc_code, acc_type);
			dtos.add(dto);

		}
		rs.close();
		pstmt.close();
		con.close();
		return dtos;
	}

	public ArrayList<CAccommodationDto> map(String[] accList) throws Exception {

		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select a.*,b.room_price,row_number() over(partition by a.acc_code order by b.room_price desc)as rnum from accommodation a,room b where a.acc_code=b.acc_code and a.acc_code=?) where rnum=1";

		pstmt = con.prepareStatement(sql);
		ArrayList<CAccommodationDto> dtos = new ArrayList<CAccommodationDto>();

		if (accList != null) {
			for (int i = 0; i < accList.length; i++) {
				pstmt.setString(1, accList[i]);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int acc_code = rs.getInt("acc_code");
					String acc_name = rs.getString("acc_name");
					int room_price = rs.getInt("room_price");
					double acc_latitude = rs.getDouble("acc_latitude");
					double acc_longitude = rs.getDouble("acc_longitude");
					String acc_type = rs.getString("acc_type");

					CAccommodationDto dto = new CAccommodationDto(acc_code, acc_name, room_price, acc_latitude,
							acc_longitude, acc_type);
					dtos.add(dto);

				}
			}
			rs.close();
			con.close();
			context.close();
		}

		return dtos;

	}

	public ReserveDto reserveInfo(ReserveDto dto, int accDays) throws Exception {

		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select a.acc_name,b.room_price from accommodation a inner join room b on a.acc_code=? and b.room_code = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getAcc_code());
		pstmt.setInt(2, dto.getRoom_code());
		rs = pstmt.executeQuery();
		while (rs.next()) {
			dto.setAcc_name(rs.getString("acc_name"));
			dto.setR_price(rs.getInt("room_price") * accDays);
		}
		rs.close();
		pstmt.close();
		con.close();
		context.close();
		return dto;

	}
	// 거리순, 가격순,추천순 ajax 작업중 일단 보류
	/*
	 * public ArrayList<CAccommodationDto> order(String[] accList,String order_)
	 * throws Exception {
	 * 
	 * Context context = new InitialContext(); DataSource dataSource = (DataSource)
	 * context.lookup("java:comp/env/jdbc/springorcl"); Connection con =
	 * dataSource.getConnection(); PreparedStatement pstmt = null; ResultSet rs =
	 * null; String order=""; if (order_ != null) { if(order_.equals("recommend"))
	 * {order = "order by acc_rating desc";} if(order_.equals("lowprice")) {order =
	 * "order by room_price";} if(order_.equals("highprice")) {order =
	 * "order by room_price desc";} if(order_.equals("distance")) {order =
	 * "order by distance";} } String
	 * sql="select a.*,CALC_DISTANCE(37.3995564, 126.97339350000001, a.acc_latitude, a.acc_longitude) AS DISTANCE from (select a.*,b.room_price,row_number() over(partition by a.acc_code order by b.room_price desc)as rnum from accommodation a,room b where a.acc_code=b.acc_code and a.acc_code=1) a where rnum=1 order by distance"
	 * ;
	 * 
	 * pstmt = con.prepareStatement(sql); ArrayList<CAccommodationDto> dtos = new
	 * ArrayList<CAccommodationDto>();
	 * 
	 * if(accList != null) { for(int i=0;i<accList.length;i++) { pstmt.setString(1,
	 * accList[i] ); rs = pstmt.executeQuery(); while (rs.next()) { int acc_code =
	 * rs.getInt("acc_code"); String acc_name = rs.getString("acc_name"); int
	 * room_price = rs.getInt("room_price"); double acc_latitude =
	 * rs.getDouble("acc_latitude"); double acc_longitude =
	 * rs.getDouble("acc_longitude"); String acc_type = rs.getString("acc_type");
	 * 
	 * CAccommodationDto dto = new
	 * CAccommodationDto(acc_code,acc_name,room_price,acc_latitude,acc_longitude,
	 * acc_type); dtos.add(dto);
	 * 
	 * } } rs.close(); con.close(); context.close(); }
	 * 
	 * 
	 * 
	 * return dtos;
	 * 
	 * 
	 * 
	 * 
	 * 
	 * }
	 */

	public ArrayList<ReserveCheckDto> reservationCheck(String mem_email) throws Exception {

		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		ArrayList<ReserveCheckDto> dtos = new ArrayList<ReserveCheckDto>();
		String sql = "select a.*,b.photo_name from (select res_code,acc_code,room_code,r_type,to_char(s_date,'yyyy/mm/dd') as s_date,to_char(e_date,'yyyy/mm/dd') "
				+ "as e_date,r_price,r_useremail,r_name,r_phone,acc_name,r_status,(e_date-s_date) as accdays from reserve) a inner join photo b on (a.acc_code = b.acc_code) "
				+ "where b.photo_type = 'MAIN' and a.r_useremail = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_email);
		rs = pstmt.executeQuery();
		if (rs != null) {
			while (rs.next()) {
				int acc_code = rs.getInt("acc_code");
				String acc_name = rs.getString("acc_name");
				int res_code = rs.getInt("res_code");
				int room_code = rs.getInt("room_code");
				String r_type = rs.getString("r_type");
				String s_date = rs.getString("s_date");
				String e_date = rs.getString("e_date");
				int r_price = rs.getInt("r_price");
				String r_name = rs.getString("r_name");
				String r_phone = rs.getString("r_phone");
				String r_status = rs.getString("r_status");
				int accdays = rs.getInt("accdays");
				String photo_name = rs.getString("photo_name");
				ReserveCheckDto dto = new ReserveCheckDto(acc_code, acc_name, res_code, room_code, r_type, s_date,
						e_date, r_price, r_name, r_phone, r_status, accdays, photo_name);
				dtos.add(dto);
			}

		}
		rs.close();
		pstmt.close();
		con.close();
		context.close();
		return dtos;

	}

	public ReserveCheckDto reserveinfo_detail(int res_code_) throws Exception {
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select a.*,b.photo_name from (select res_code,acc_code,room_code,r_type,to_char(s_date,'yyyy/mm/dd') as s_date,to_char(e_date,'yyyy/mm/dd') "
				+ "as e_date,r_price,r_useremail,r_name,r_phone,acc_name,r_status,(e_date-s_date) as accdays from reserve) a inner join photo b on (a.acc_code = b.acc_code) "
				+ "where b.photo_type = 'MAIN' and a.res_code = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, res_code_);
		rs = pstmt.executeQuery();
		rs.next();
		int acc_code = rs.getInt("acc_code");
		String acc_name = rs.getString("acc_name");
		int res_code = rs.getInt("res_code");
		int room_code = rs.getInt("room_code");
		String r_type = rs.getString("r_type");
		String s_date = rs.getString("s_date");
		String e_date = rs.getString("e_date");
		int r_price = rs.getInt("r_price");
		String r_name = rs.getString("r_name");
		String r_phone = rs.getString("r_phone");
		String r_status = rs.getString("r_status");
		int accdays = rs.getInt("accdays");
		String photo_name = rs.getString("photo_name");

		ReserveCheckDto dto = new ReserveCheckDto(acc_code, acc_name, res_code, room_code, r_type, s_date, e_date,
				r_price, r_name, r_phone, r_status, accdays, photo_name);
		
		rs.close();
		pstmt.close();
		con.close();
		context.close();

		return dto;
	}
	
	public void reb_reply_write(String reb_seq, String reb_reply_content) throws Exception { 
		
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE review_board SET RERE_CONTENT = ? WHERE reb_seq =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, reb_reply_content);
		pstmt.setString(2, reb_seq);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		context.close();
}
	
	public int checkReview(int res_code) throws Exception {
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_board where res_code = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, res_code);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			return 1;
		}
		
		
		return 0;
	}

	public void pw_modify(String email, String pw) throws Exception {
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
	
		
		String sql = "update member_info set mem_pw = ? where mem_email = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, email);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		context.close();
		
	}

	public void delete_user(String mem_email) throws Exception {
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
	
		
		String sql = "delete from member_info where mem_email=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_email);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		context.close();
		
		
	}
}
