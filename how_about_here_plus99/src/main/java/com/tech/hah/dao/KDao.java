
package com.tech.hah.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface KDao {
	
//	愿�由ъ�� ���댁��� 李⑦�몃�� 留��ㅺ린 ���� table data 遺��ъ�ㅺ린 ���� 硫�����
	public ArrayList<HashMap<String, String>> chart_one();
	
	public ArrayList<HashMap<String, String>> chart_two();

	public ArrayList<HashMap<String, String>> chart_three();
	
	public ArrayList<HashMap<String, String>> chart_four();
	
//	愿�由ъ�� ���댁��� ���대� ���깆�� ���� 硫�����
	public void write(String bName, String bTitle, String bContent, String fName);
	
//	愿�由ъ�� ���댁��� ������ �곗�댄�곕�� �������� 硫�����
	public void delete(String bid);
	
//	愿�由ъ�� ���댁��� accommodation table�� 蹂댁�ъ＜湲� ���� 硫�����
	public ArrayList<HashMap<String, String>> acc();

	public void acc_write(String parameter, String parameter2, String parameter3, String parameter4, String parameter5,
			String parameter6, String parameter7, String parameter8, String parameter9, String parameter10,
			String parameter11, String parameter12, String parameter13, String parameter14, String string, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9);

	public ArrayList<HashMap<String, String>> room(String loginUser);

	public ArrayList<HashMap<String, String>> res(String loginUser);

	public void room_write(String parameter, String parameter2, String parameter3);

	public ArrayList<HashMap<String, String>> review_board(String acc_code);

	public HashMap<String, String> review_total(String acc_code);

	public HashMap<String, String> acc_info(String acc_code);

	public ArrayList<HashMap<String, String>> room_info(String acc_code, String in, String out);

	public HashMap<String, String> room_price(String acc_code);

	public ArrayList<HashMap<String, String>> photo(String acc_code);

	public ArrayList<HashMap<String, String>> review(String loginUser);

	public void rere_write(String reb_seq, String rere_content);

	public ArrayList<HashMap<String, String>> mem();

	public ArrayList<HashMap<String, String>> inq();

	public HashMap<String, String> reb_re(String reb_seq);

	public HashMap<String, String> inq_re(String inq_seq);

	public void inre_write(String seq, String inre_content);


	
	
}
