package com.tech.hah.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.hah.dao.InfoDao;
import com.tech.hah.dao.ReviewDao;
import com.tech.hah.dto.ReviewDto;
import com.tech.hah.dto.UserDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	
	@RequestMapping("myinfo/myinfo_page")
	public String myinfo(HttpServletRequest request) {
		HttpSession user = request.getSession();
		UserDto userdto = (UserDto) user.getAttribute("loginUser");
		if(userdto == null) {
			return "redirect:../login";
		}
		
		
		
		return "myinfo/myinfo_page";
	}
	
	@RequestMapping("myinfo/nik_modify")
	public String nik_modify(HttpServletRequest request, UserDto dto, HttpSession session) throws Exception {
		
		String nik = request.getParameter("nik_modify_text");
		UserDto user = (UserDto) session.getAttribute("loginUser");
		InfoDao dao = new InfoDao();
		dao.nik_change(nik,user.getMem_email());
		user.setMem_nick(nik);
		session.setAttribute("loginUser", user);
				
		return "myinfo/myinfo_page";
	}
	
	@RequestMapping("myinfo/phone_modify")
	public String phone_modify(HttpServletRequest request, UserDto dto, HttpSession session) throws Exception {
		
		String phone = request.getParameter("phone_modify_text");
		System.out.println(phone);
		UserDto user = (UserDto) session.getAttribute("loginUser");
		InfoDao dao = new InfoDao();
		dao.phone_chane(phone, user.getMem_email());
		user.setMem_phone(phone);
		session.setAttribute("loginUser", user);
		
		return "myinfo/myinfo_page";
	}

	@RequestMapping("myinfo/myinfo_review_write")
	public String myinfo_review_write(HttpServletRequest request, HttpSession session) throws Exception {
		
		int res_code = Integer.parseInt(request.getParameter("res"));
		String review_title = request.getParameter("myinfo_review_title");
		int review_rating = Integer.parseInt(request.getParameter("rating"));
		String review_content = request.getParameter("myinfo_review_content");
		String review_emoji = request.getParameter("emoji");
		ReviewDao dao = new ReviewDao();
		ReviewDto dto = dao.review_info(res_code);
		
		UserDto user = (UserDto) session.getAttribute("loginUser");


		dao.review_write(dto, res_code, review_title,
				review_rating, review_content,review_emoji, user.getMem_nick());
		
		return "redirect:myinfo_reserve_detail?rc="+res_code;
	}
	
	
}
