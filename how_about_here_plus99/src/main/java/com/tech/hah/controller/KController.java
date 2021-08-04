package com.tech.hah.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.hah.dao.KDao;
import com.tech.hah.dto.UserDto;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class KController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/kdetail_page")
	public String detail(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		
		String acc_code = request.getParameter("acc_code");
		String date = request.getParameter("date");
		
		if (acc_code == null) {
			acc_code="1";
		}
		
		if (date == null) {
			Calendar cal = Calendar.getInstance();
			String format = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			date = sdf.format(cal.getTime());
			cal.add(cal.DATE, + 1);
			date += " - " + sdf.format(cal.getTime());
			System.out.println(date);
		}
		
		String in = date.substring(0,10);
		String out = date.substring(13);
		System.out.println(in);
		System.out.println(out);
		// review_board table 遺��ъ�ㅺ린
		model.addAttribute("review_board", dao.review_board(acc_code));
		model.addAttribute("review_total", dao.review_total(acc_code));
		model.addAttribute("acc", dao.acc_info(acc_code));		
		model.addAttribute("room", dao.room_info(acc_code, in, out));		
		model.addAttribute("room_price", dao.room_price(acc_code));		
		model.addAttribute("photo", dao.photo(acc_code));		
		model.addAttribute("in", in);
		model.addAttribute("out", out);
		
		return "kdetail_page";
	}

	@RequestMapping(value = "/kadmin_page")
	public String admin(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);

		// mybatis �ъ��
		JSONArray arr1 = new JSONArray();
		for (HashMap<String, String> hm : dao.chart_one()) {
			JSONObject obj = new JSONObject();
			String x = hm.get("X");
			String y = String.valueOf(hm.get("Y"));
			obj.put("x", x);
			obj.put("y", y);
			if (obj != null) {
				arr1.add(obj);
			}
		}
		model.addAttribute("arr1", arr1);

		JSONArray arr2 = new JSONArray();
		for (HashMap<String, String> hm : dao.chart_two()) {
			JSONObject obj = new JSONObject();
			String x = hm.get("X");
			String y = String.valueOf(hm.get("Y"));
			obj.put("x", x);
			obj.put("y", y);
			if (obj != null) {
				arr2.add(obj);
			}
		}
		model.addAttribute("arr2", arr2);

		JSONArray arr3 = new JSONArray();
		for (HashMap<String, String> hm : dao.chart_three()) {
			JSONObject obj = new JSONObject();
			String x = hm.get("X");
			String y = String.valueOf(hm.get("Y"));
			obj.put("x", x);
			obj.put("y", y);
			if (obj != null) {
				arr3.add(obj);
			}
		}
		model.addAttribute("arr3", arr3);

		JSONArray arr4 = new JSONArray();
		for (HashMap<String, String> hm : dao.chart_four()) {
			JSONObject obj = new JSONObject();
			String x = hm.get("X");
			String y = String.valueOf(hm.get("Y"));
			obj.put("x", x);
			obj.put("y", y);
			if (obj != null) {
				arr4.add(obj);
			}
		}
		model.addAttribute("arr4", arr4);
		
		
		//테스트
		HttpSession user = request.getSession();
		/*String loginUser = String.valueOf(user.getAttribute("loginUser"));*/
		UserDto userdto = (UserDto) user.getAttribute("loginUser");
		if (userdto.getMem_access().equals("0")) {
			return "admin/kadmin_page";
		}else {
			return "redirect:kreservation";
		}
	}

	@RequestMapping(value = "/kreservation")
	public String reservation(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		
		HttpSession user = request.getSession();
		/*String loginUser = String.valueOf(user.getAttribute("loginUser"));*/
		UserDto userdto = (UserDto) user.getAttribute("loginUser");
		
		
		// room table 遺��ъ�ㅺ린
		model.addAttribute("room", dao.room(userdto.getMem_access()));

		// reserve table 遺��ъ�ㅺ린
		model.addAttribute("res", dao.res(userdto.getMem_access()));

		return "admin/kreservation";
	}

	@RequestMapping(value = "/kaccommodation")
	public String accommodation(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);

		// accommodation table 遺��ъ�ㅺ린
		model.addAttribute("acc", dao.acc());

		return "admin/kaccommodation";
	}
	
	@RequestMapping(value = "/kmember")
	public String member(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		
		// accommodation table 遺��ъ�ㅺ린
		model.addAttribute("mem", dao.mem());
		
		return "admin/kmember";
	}
	
	@RequestMapping(value = "/kreview")
	public String review(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		
		HttpSession user = request.getSession();
		String loginUser = String.valueOf(user.getAttribute("loginUser"));
		UserDto userdto = (UserDto) user.getAttribute("loginUser");
/*//		String loginUser = "2";
*/		
		model.addAttribute("review", dao.review(userdto.getMem_access()));
		
		return "admin/kreview";
	}
	
	@RequestMapping(value = "/kreview_reb_re")
	public String kreview_reb_re(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		model.addAttribute("reb_re", dao.reb_re(request.getParameter("reb_seq")));
		
		return "admin/kreview_reb_re";
	}
	
	@RequestMapping(value = "/kinquiry")
	public String inquiry(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		
		model.addAttribute("inq", dao.inq());
		
		return "admin/kinquiry";
	}
	
	@RequestMapping(value = "/kinquiry_inq_re")
	public String kreview_inq_re(HttpServletRequest request, Model model) throws Exception {
		KDao dao = sqlSession.getMapper(KDao.class);
		model.addAttribute("inq_re", dao.inq_re(request.getParameter("inq_seq")));
		
		return "admin/kinquiry_inq_re";
	}
	
	@RequestMapping("/rere_write")
	public String rere_write(HttpServletRequest req, Model model) throws Exception {
		
		KDao dao = sqlSession.getMapper(KDao.class);
		dao.rere_write(req.getParameter("reb_seq"), req.getParameter("rere_content"));
		
		return "redirect:kreview";
	}
	
	@RequestMapping("/inre_write")
	public String inre_write(HttpServletRequest req, Model model) throws Exception {
		
		KDao dao = sqlSession.getMapper(KDao.class);
		dao.inre_write(req.getParameter("seq"), req.getParameter("inre_content"));
		
		return "redirect:kinquiry";
	}

	@RequestMapping("/room_write")
	public String room_write(HttpServletRequest req, Model model) throws Exception {

		KDao dao = sqlSession.getMapper(KDao.class);
		dao.room_write(req.getParameter("acc_code"), req.getParameter("room_type"), req.getParameter("room_price"));

		return "redirect:admin/kreservation";
	}

	@RequestMapping("/acc_write")
	public String acc_write(HttpServletRequest req, Model model) throws Exception {

		KDao dao = sqlSession.getMapper(KDao.class);
		dao.acc_write(req.getParameter("acc_name"), req.getParameter("acc_type"), req.getParameter("acc_city"),
				req.getParameter("acc_dist"), req.getParameter("acc_grade"), req.getParameter("acc_pool"),
				req.getParameter("acc_bre"), req.getParameter("acc_rating"), req.getParameter("acc_sauna"),
				req.getParameter("acc_pufit"), req.getParameter("acc_wifi"), req.getParameter("acc_addr"),
				req.getParameter("acc_latitude"), req.getParameter("acc_longitude"), req.getParameter("acc_golf")
				, req.getParameter("acc_spa"), req.getParameter("acc_minibar"), req.getParameter("acc_aircon")
				, req.getParameter("acc_pet"), req.getParameter("acc_smoking"), req.getParameter("acc_valet")
				, req.getParameter("acc_addrinfo"), req.getParameter("acc_event"));

		return "redirect:admin/kaccommodation";
	}

	@RequestMapping("/write")
	public String write(HttpServletRequest req, Model model) throws Exception {
		// upload
		String attachPath = "resources\\img\\";
		String uploadPath = req.getSession().getServletContext().getRealPath("/");

		System.out.println("uploadPath: " + uploadPath);

		String path = uploadPath + attachPath;

		// multipart request 援ъ��
		MultipartRequest request = new MultipartRequest(req, path, 1024 * 1024 * 20, "utf-8",
				new DefaultFileRenamePolicy());

		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String fName = request.getFilesystemName("file");

		if (fName == null) {
			fName = "";
		}

		KDao dao = sqlSession.getMapper(KDao.class);
		dao.write(bName, bTitle, bContent, fName);

		return "redirect:admin_page";
	}

	@RequestMapping("/delete")
	public String delete(HttpServletRequest req, Model model) {
		KDao dao = sqlSession.getMapper(KDao.class);
		String bid = req.getParameter("bid");
		String img = req.getParameter("img");

		dao.delete(bid);
		String attachPath = "resources\\img\\" + img + "\\";
		String uploadPath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("uploadPath: " + uploadPath);
		String path = uploadPath + attachPath;

		File file = new File(path);

		if (file.exists()) {
			if (file.delete()) {
				System.out.println("���쇱���� �깃났");
			} else {
				System.out.println("���쇱���� �ㅽ��");
			}
		} else {
			System.out.println("���쇱�� 議댁�ы��吏� ���듬����.");
		}

		return "redirect:admin_page";
	}

}
