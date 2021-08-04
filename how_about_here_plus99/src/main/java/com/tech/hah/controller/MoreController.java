package com.tech.hah.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.hah.dao.CDao2;
import com.tech.hah.dto.Inquiry;
import com.tech.hah.dto.UserDto;

@Controller
public class MoreController {
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Autowired
	private SqlSession sqlSession;

	
	@RequestMapping("more/notice")
	public String notice() {
	
		return "notice";
	}
	
	@RequestMapping("more/terms")
	public String terms() {
		
		return "terms";
	}
	
	@RequestMapping(value = "more/faq/1")
	public String faq() {
	
		return "faq1";
	}
	@RequestMapping(value = "more/faq/2")
	public String faq2() {
		return "faq2";
	}
	@RequestMapping(value = "more/faq/3")
	public String faq3() {
		return "faq3";
	}
	@RequestMapping(value = "more/faq/4")
	public String faq4() {
		return "faq4";
	}
	@RequestMapping(value = "more/faq/5")
	public String faq5() {
		return "faq5";
	}
	@RequestMapping(value = "more/faq/6")
	public String faq6() {
		return "faq6";
	}
	@RequestMapping(value = "more/faq/7")
	public String faq7() {
		return "faq7";
	}
	@RequestMapping(value = "more/faq/8")
	public String faq8() {
		return "faq8";
	}
	@RequestMapping(value = "more/faq/9")
	public String faq9() {
		return "faq9";
	}
	
	@RequestMapping(value = "more/inquirywrite")
	public String inquirywrite(Inquiry Dto, HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("useremail", "none");
		if(user != null) {
			map.put("useremail",user.getMem_email());
		}
		map.put("email", Dto.getUemail());
		map.put("phone", Dto.getPhone());
		map.put("room_type", Dto.getRoom_type());
		map.put("inquiry_type", Dto.getInquiry_type());
		map.put("inquiry_content", Dto.getInquiry_content());
		CDao2 dao2 = sqlSession.getMapper(CDao2.class);
		dao2.inquiry(map);

		return "redirect:inquiry";
	}
	@RequestMapping(value = "more/inquiry")
	public String inquiry(HttpSession session, Model model) {
		UserDto user = (UserDto) session.getAttribute("loginUser");
		if(user != null) {
			CDao2 dao2 = sqlSession.getMapper(CDao2.class);
			ArrayList<Inquiry> dtos = new ArrayList<Inquiry>();
			dtos = dao2.inquiryCheck(user);
			model.addAttribute("inquiry",dtos);	
		}
		return "inquiry";
	}
	
	@RequestMapping(value = "pay")
	public String pay() {
		return "pay";
	}
	
	
	
	
	
	
}
