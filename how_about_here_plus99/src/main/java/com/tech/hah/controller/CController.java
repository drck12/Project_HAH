package com.tech.hah.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.hah.dao.CDao;
import com.tech.hah.dao.CDao2;
import com.tech.hah.dto.CAccommodationDto;
import com.tech.hah.dto.LoginDto;
import com.tech.hah.dto.ReserveCheckDto;
import com.tech.hah.dto.ReserveDto;
import com.tech.hah.dto.UserDto;
import com.tech.hah.dto.requestDto;
import com.tech.hah.service.CAccMapService;
import com.tech.hah.service.maskInfo;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class CController {
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;

	

	@RequestMapping(value = "/hotel")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String acc_type = "'hotel')";
		CDao dao = new CDao();
		
		String latitude_ = request.getParameter("user_latitude");
		String longitude_ = request.getParameter("user_longitude");
		String order_ = request.getParameter("order");
		String[] checkList_ = request.getParameterValues("checklist");
		String[] bedType_ = request.getParameterValues("bedtype");
		String[] hGrade_ = request.getParameterValues("grade");
		String person_ = request.getParameter("person");
		String date_ = request.getParameter("date");
		String dist_ = request.getParameter("dist");
		response.setContentType("text/html;charset=UTF-8");
		if (hGrade_ != null) {
			for (int i = 0; i < hGrade_.length; i++) {
				model.addAttribute(hGrade_[i], hGrade_[i]);}};

		if (checkList_ != null) {
			for (int i = 0; i < checkList_.length; i++) {
				model.addAttribute(checkList_[i], checkList_[i]);}};
		
		if (bedType_ != null) {
			for (int i = 0; i < bedType_.length; i++) {
				model.addAttribute(bedType_[i], bedType_[i]);}};
	

		ArrayList<CAccommodationDto> dtos = dao.list(acc_type,checkList_, bedType_, person_, date_, hGrade_, order_, latitude_,longitude_, dist_);
		model.addAttribute("date", date_);
		model.addAttribute("dist", dist_);
		model.addAttribute("person", person_);
		model.addAttribute("hotel", dtos);
		model.addAttribute("order", order_);

		return "hotel";
	}
	@RequestMapping(value = "/myplace")
	public String myplace(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String acc_type = "'hotel' or acc_type = 'motel' or acc_type = 'pension')";
		CDao dao = new CDao();
		
		String latitude_ = request.getParameter("user_latitude");
		String longitude_ = request.getParameter("user_longitude");
		String order_ = request.getParameter("order");
		String[] checkList_ = request.getParameterValues("checklist");
		String[] bedType_ = request.getParameterValues("bedtype");
		String[] hGrade_ = request.getParameterValues("grade");
		String person_ = request.getParameter("person");
		String date_ = request.getParameter("date");
		String dist_ = "myplace";
		response.setContentType("text/html;charset=UTF-8");
		if (hGrade_ != null) {
			for (int i = 0; i < hGrade_.length; i++) {
				model.addAttribute(hGrade_[i], hGrade_[i]);}};
				
				if (checkList_ != null) {
					for (int i = 0; i < checkList_.length; i++) {
						model.addAttribute(checkList_[i], checkList_[i]);}};
						
						if (bedType_ != null) {
							for (int i = 0; i < bedType_.length; i++) {
								model.addAttribute(bedType_[i], bedType_[i]);}};
	
								
		ArrayList<CAccommodationDto> dtos = dao.list(acc_type,checkList_, bedType_, person_, date_, hGrade_, order_, latitude_,longitude_, dist_);
		model.addAttribute("latitude",latitude_);
		model.addAttribute("longitude",longitude_);
		model.addAttribute("date", date_);
		model.addAttribute("dist", dist_);
		model.addAttribute("person", person_);
		model.addAttribute("hotel", dtos);
		model.addAttribute("order", order_);
								
		return "myplace";
	}

	@RequestMapping(value = "/openmap", produces = "application/text; charset=utf8")
	@ResponseBody
	public String test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String[] accList = request.getParameterValues("acclist");
		CDao dao = new CDao();
		ArrayList<CAccommodationDto> dtos = dao.map(accList);

		CAccMapService ams = new CAccMapService();
		String json = ams.getJSON(dtos);
		
		
		return json;
	}
	
	@RequestMapping("/join")
	public String list() throws Exception {
		
	
		return "join";
	}
	@RequestMapping("/motel")
	public String motel(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		String acc_type = "'motel')";
		CDao dao = new CDao();
		String dist_ = request.getParameter("dist");
		ArrayList<CAccommodationDto> dtos = dao.list(acc_type, null, null, null, null, null, null, null, null, dist_);
		model.addAttribute("motel",dtos);
		return "motel";
	}
	@RequestMapping("/pension")
	public String pesion(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {

		CDao dao = new CDao();
		String acc_type = "'pension')";
		String latitude_ = request.getParameter("user_latitude");
		String longitude_ = request.getParameter("user_longitude");
		String order_ = request.getParameter("order");
		String[] checkList_ = request.getParameterValues("checklist");
		String[] bedType_ = request.getParameterValues("bedtype");
		String[] hGrade_ = request.getParameterValues("grade");
		String person_ = request.getParameter("person");
		String date_ = request.getParameter("date");
		String dist_ = request.getParameter("dist");
		if(dist_ == null) {
			dist_ = "17";
		}
		response.setContentType("text/html;charset=UTF-8");
		if (hGrade_ != null) {
			for (int i = 0; i < hGrade_.length; i++) {
				model.addAttribute(hGrade_[i], hGrade_[i]);}};

		if (checkList_ != null) {
			for (int i = 0; i < checkList_.length; i++) {
				model.addAttribute(checkList_[i], checkList_[i]);}};
		
		if (bedType_ != null) {
			for (int i = 0; i < bedType_.length; i++) {
				model.addAttribute(bedType_[i], bedType_[i]);}};


		ArrayList<CAccommodationDto> dtos = dao.list(acc_type,checkList_, bedType_, person_, date_, hGrade_, order_, latitude_,longitude_, dist_);
		model.addAttribute("date", date_);
		model.addAttribute("dist", dist_);
		model.addAttribute("person", person_);
		model.addAttribute("hotel", dtos);
		model.addAttribute("order", order_);
		
		
		return "pension";
	}
	
	@RequestMapping(value = "/sendsms", produces = "application/text; charset=utf8")
	@ResponseBody
	public void sendsms(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String phone = request.getParameter("phone");
			HttpSession smskey = request.getSession();
			smskey.setMaxInactiveInterval(60*3);
			String certificationNumber = String.valueOf((int)((Math.random()*8999)+1000));
			smskey.setAttribute(phone,certificationNumber);
			String a = (String) smskey.getAttribute(phone);
			System.out.println(certificationNumber);
			
			/*해당 아래 부분은 실제로 문자를 전송하는 기능임. 주석처리시 문자는 전송되지 않고, 
			 * 랜덤키 4자리숫자만 생성되고 세션에 수신핸드폰 번호와 같이 저장한 뒤 콘솔에 인증번호 출력*/
			
		   /*String api_key = "NCSARFMORQJX1ZOP";
		    String api_secret = "M8MMSSJLHKS6HQATSZMT3MVRDMCRL94X";
		    Message coolsms = new Message(api_key, api_secret);

		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phone);
		    params.put("from", "01029504062");
		    params.put("type", "SMS");
		    params.put("text", "[The value %] 인증번호 ["+certificationNumber+"]를 입력해주세요.");
		    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }*/
			
	}
	@RequestMapping(value = "/checksms", produces = "application/text; charset=utf8")
	@ResponseBody
	public String checksms(requestDto dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession smskey = request.getSession();
		if(!dto.getCertificationNumber().equals(smskey.getAttribute(dto.getPhone()))){
			return "fail";	}
		
		
		return "success";
		
	}
	
	@RequestMapping("/mainjoin")
	public String mainjoin(HttpServletRequest request,requestDto dto) {
		if(dto.getSelCheck1() == null) {dto.setSelCheck1("no");}
		if(dto.getSelCheck2() == null) {dto.setSelCheck2("no");}
		dto.setPw(pwEncoder.encode(dto.getPw()));
		CDao2 cdao = sqlSession.getMapper(CDao2.class); 
		cdao.joinMember(dto);
			
	
		return "main";
	}
	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	@RequestMapping("/reservationCheck")
	public String reservationCheck() {
		
		return "reservationCheck";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession user = request.getSession();
		user.invalidate();
		
		return "main";
	}
	@RequestMapping("/reserve")
	public String reserve(HttpServletRequest request,ReserveDto dto,Model model) throws Exception {
		
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(dto.getS_date());
		Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(dto.getE_date());
		long diffSec = (format1.getTime() - format2.getTime()) / 1000; // 珥� 李⑥��
		long diffDays = diffSec / (24 * 60 * 60); // �쇱���� 李⑥��
		int accDays = (int) Math.abs(diffDays);
		
		CDao dao = new CDao();
		ReserveDto reserveInfo = dao.reserveInfo(dto,accDays); 
		model.addAttribute("reserve",dto);
		model.addAttribute("accdays",accDays);
		return "reserve";
	}
	
	
	@RequestMapping("/guest")
	public String guest_check() {
		
		return "guest";
	}
	@RequestMapping("/pwchange")
	public String pwchange() {
		
		return "pwchange";
	}
	@RequestMapping("/pw_modify")
	public String pw_modify(HttpServletRequest request) throws Exception {
	    String email = request.getParameter("email");
	    String pw = pwEncoder.encode(request.getParameter("pw"));
	    CDao dao = new CDao();
	    dao.pw_modify(email,pw);
	    
		
		return "main";
	}
	@RequestMapping("/myinfo/delete_user")
	public String delete_user(HttpServletRequest request, HttpSession session) throws Exception {
		UserDto dto = (UserDto) session.getAttribute("loginUser");
		CDao dao = new CDao();
		dao.delete_user(dto.getMem_email());
		session.invalidate();
		return "redirect:../main";
	}
	@RequestMapping("/selectConfirm")
	public String selectConfirm(LoginDto dto, HttpServletRequest request, Model model, RedirectAttributes rttr) {
		String email = request.getParameter("email");
		CDao2 dao = sqlSession.getMapper(CDao2.class);
		UserDto user = dao.loginuser(dto);
		maskInfo mask = new maskInfo();
		if(user == null) {
			rttr.addFlashAttribute("msg","해당하는 계정 정보가 없습니다.");
			return "redirect:pwchange";
		}
		model.addAttribute("email",mask.getMaskedEmail(user.getMem_email()));
		model.addAttribute("phone",mask.getMaskedPhoneNum(user.getMem_phone()));
		model.addAttribute("email_",user.getMem_email());
		model.addAttribute("phone_",user.getMem_phone());
		return "selectConfirm";
	}

	
	@RequestMapping("/guest_reservation_detail")
	public String guestcheck(ReserveDto dto, Model model,HttpServletRequest request) {
		
			CDao2 dao2 = sqlSession.getMapper(CDao2.class);
			ReserveCheckDto dtos = dao2.reserve_check(dto);
			
			if(dtos == null){
				
				model.addAttribute("msg", "일치하는 예약 정보가 없습니다.");
		        return "guest";
				
		    }else {
		    	model.addAttribute("reservation",dtos);
		        return "guest_reservation_detail";
				
			}
		    	
	}
	
	@RequestMapping("/user_login")
	public String userLogin(HttpServletRequest request, LoginDto dto,Model model, RedirectAttributes rttr) {
		HttpSession user = request.getSession();
		CDao2 cdao = sqlSession.getMapper(CDao2.class);
		UserDto loginUser = cdao.loginuser(dto);
		if(loginUser != null && pwEncoder.matches(dto.getPw(), loginUser.getMem_pw())) {
		        user.setAttribute("loginUser", loginUser);		       
		        return "redirect:main";
		    }

				rttr.addFlashAttribute("msga", "로그인 정보가 맞지 않습니다");
		        return "redirect:login";
		
	}
	
	@RequestMapping("/emailcheck")
	@ResponseBody
	public String emailcheck(requestDto dto) {
		CDao2 cdao = sqlSession.getMapper(CDao2.class);
		int result_ = cdao.emailCheck(dto);
		String result="";
		if(result_>0) result="fail";
		if(result_==0) result="success";
		return result;
	}
	
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public String reserve(ReserveDto dto,HttpServletRequest request,Model model) {
		HttpSession user = request.getSession();
		UserDto userdto = (UserDto) user.getAttribute("loginUser");
		CDao2 cdao = sqlSession.getMapper(CDao2.class);
		String useremail = "비회원";
		if(userdto != null) {
		useremail = userdto.getMem_email();} 
		dto.setR_useremail(useremail);
		cdao.insertReservation(dto);
		System.out.println(dto.getRes_code());
		if(userdto == null) {
			model.addAttribute("res_code",dto.getRes_code());
			model.addAttribute("r_phone",dto.getR_phone());
			return "redirect:guest_reservation_detail";
			
		}

		return "redirect:main";
	}
	
	@RequestMapping("myinfo/myinfo_reserve")
	public String myinfo(HttpServletRequest request, Model model) throws Exception {
		HttpSession user = request.getSession();
		UserDto userdto = (UserDto) user.getAttribute("loginUser");
		if(userdto == null) {
			return "redirect:../reservationCheck";
		}
		CDao dao = new CDao();
		ArrayList<ReserveCheckDto> dtos = dao.reservationCheck(userdto.getMem_email());
		model.addAttribute("reservation",dtos);
	
		return "myinfo/myinfo_reservation";
	}
	
	@RequestMapping("myinfo/myinfo_reserve_detail")
	public String myinfo_detail(HttpServletRequest request, Model model) throws Exception {
		int res_code = Integer.parseInt(request.getParameter("rc"));
		CDao dao = new CDao();
		ReserveCheckDto dto = dao.reserveinfo_detail(res_code);
		model.addAttribute("rsdetail",dto);
		int reviewCheck = dao.checkReview(res_code);
		model.addAttribute("reviewCheck",reviewCheck);

		return "myinfo/myinfo_reservation_detail";
	}
	
	@RequestMapping("/review_reply")
	public String review_reply(HttpServletRequest request) throws Exception {
		String reb_seq = request.getParameter("reb_seq");
		String reb_reply_content = request.getParameter("reb_reply_content");
		String acc_code = request.getParameter("acc_code");
		CDao dao = new CDao();
		dao.reb_reply_write(reb_seq,reb_reply_content);
		

		return "redirect:kdetail_page?acc_code="+acc_code;
	}	
	
	@RequestMapping(value = "/mailSending", produces = "application/text; charset=utf8")
	@ResponseBody
	public void mailSending(HttpServletRequest request) {
		String email = request.getParameter("email");
		HttpSession smskey = request.getSession();
		smskey.setMaxInactiveInterval(60*5);
		String certificationNumber = String.valueOf((int)((Math.random()*8999)+1000));
		smskey.setAttribute(email,certificationNumber);
		
		String setfrom = "hahtestid@gmail.com";
		String email_receiver = request.getParameter("email"); // 받는 사람 이메일
		String title = "저기어때 인증번호 메일입니다"; // 제목
		String content = "저기어때 인증번호 "+certificationNumber+" 를 입력해주십시오"; // 내용
		
		

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(email_receiver); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
			System.out.println(certificationNumber);
		} catch (Exception e) {
			System.out.println(e);
		}

	
	}
	
}
