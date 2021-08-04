package com.tech.hah.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tech.hah.dto.ReviewDto;

public class ReviewDao {
	
	public ReviewDto review_info(int res_code) throws Exception {
		
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql ="select room_code, r_type, acc_code from reserve where res_code = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, res_code);
		rs = pstmt.executeQuery();
		
		ReviewDto dto = null;
		
		while(rs.next()) {
			int room_code = rs.getInt("room_code");
			String r_type = rs.getString("r_type");
			int acc_code = rs.getInt("acc_code");
			
			dto = new ReviewDto(room_code, r_type, acc_code);
		}
		
		

		pstmt.close();
		con.close();
		context.close();
		
		return dto;
	}
	
	public void review_write(ReviewDto dto, int res_code, String review_title, int review_rating, 
			String review_content, String review_emoji, String nik) throws Exception {
	
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		System.out.println("sql전");
		String sql = "insert into review_board (reb_seq,r_num,reb_room,mem_id2,acc_code,reb_emoji,reb_title,reb_content,reb_regdate,reb_rating,res_code)"
				+ "values (reb_seq.nextval,?,?,?,?,?,?,?,sysdate,?,?)";
		System.out.println("sql후");
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getR_num());
		pstmt.setString(2, dto.getReb_room());
		pstmt.setString(3, nik);
		pstmt.setInt(4, dto.getAcc_code());
		pstmt.setString(5, review_emoji);
		pstmt.setString(6, review_title);
		pstmt.setString(7, review_content);
		pstmt.setInt(8, review_rating);
		pstmt.setInt(9, res_code);
		
		pstmt.executeUpdate();
		System.out.println("sql실행후");
		pstmt.close();
		con.close();
		context.close();

	}

}
