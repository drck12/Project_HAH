package com.tech.hah.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class InfoDao {

	public void nik_change(String nik, String email) throws Exception {
		
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		
		String sql ="update member_info set mem_nick = ? where mem_email = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, nik);
		pstmt.setString(2, email);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		context.close();
		
	}
	
	public void phone_chane(String phone, String email) throws Exception {
		
		Context context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/springorcl");
		Connection con = dataSource.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update member_info set mem_phone =? where mem_email =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, phone);
		pstmt.setString(2, email);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		context.close();
	}
	
}
