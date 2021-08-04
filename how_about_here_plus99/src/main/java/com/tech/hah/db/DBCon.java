package com.tech.hah.db;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCon {
	
	static Connection con;
	public static Connection getConnection() {
		try {
			Context context=new InitialContext();
			DataSource dataSource=
					(DataSource) context.lookup("java:comp/env/jdbc/springorcl");
			con=dataSource.getConnection();
			System.out.println("connnnn~~~~~");
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return con;
	}

}
