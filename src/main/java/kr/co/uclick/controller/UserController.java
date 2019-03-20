package kr.co.uclick.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.uclick.entity.Phone;
import kr.co.uclick.entity.User;
import kr.co.uclick.service.PhoneService;
import kr.co.uclick.service.UserService;

@Controller
@Transactional
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PhoneService phoneService;
	
	@RequestMapping(value = "list")
	public String list(Model model, @RequestParam HashMap<String,String> map) {
		String stringpage = map.get("page"); //현재 페이지
		int page = userService.pagenow(stringpage).getPagenow(); // 현재 페이지
		int cnt = 10;// 보여줄 게시물 수
		int pagenum = 10;// 보여줄 번호 수
		
		
		///////////////////검색
		String keyword = map.get("keyword");//검색 키워드
		if(keyword==null) {//검색 키워드 디폴트
			keyword="";
		}
		String ssearchOption = map.get("searchOption");// 검색 옵션
		if(ssearchOption==null) {//검색 옵션 디폴트
			ssearchOption="0";
		}
		int searchOption = Integer.parseInt(ssearchOption);
		if(searchOption==0) {
			List<User> users = userService.findAllByOrderByIdDesc(page-1, cnt);
				for (User u: users) {
					Hibernate.initialize(u.getPhones());
				}
			model.addAttribute("users",users);
		}if(searchOption==1) {//이름으로 찾기
			List<User> users = userService.findUserByNameContaining(keyword,page-1, cnt);
			for (User u: users) {
				Hibernate.initialize(u.getPhones());
			}
			model.addAttribute("users",users);
		}if(searchOption==2) {//번호로 찾기
			List<User> users = new ArrayList<User>();
			List<Phone> phones = phoneService.findByNumContaining(keyword);
				for (Phone phone: phones) {
					users.add(phone.getUser());
				}
			users = new ArrayList<User>(new HashSet<User>(users));
				for (User u: users) {
					Hibernate.initialize(u.getPhones());
				}
			model.addAttribute("users",users);
		}
		/////////////페이지네이션
		int lastpage = userService.findPage(page, cnt, searchOption, keyword).getLastPage();//리스트 총 갯수
		Long totalpage = userService.findPage(page, cnt, searchOption, keyword).getTotalpage();//전체 데이터 수
		int prevpage = userService.makePage(page, pagenum, lastpage).getPrevpage();
		int nextpage = userService.makePage(page, pagenum, lastpage).getNextpage();
		int blockstart = userService.makePage(page, pagenum, lastpage).getBlockstart();
		int blockend = userService.makePage(page, pagenum, lastpage).getBlockend();
		
		model.addAttribute("lastpage",lastpage);// 마지막 페이지 번호
		model.addAttribute("totalpage",totalpage);// 전체 게시글 수
		model.addAttribute("viewpage", page);//현재 페이지
		model.addAttribute("start",blockstart);//블록 시작
		model.addAttribute("end",blockend);//블록 끝
		model.addAttribute("prev", prevpage);//이전 번호대
		model.addAttribute("next", nextpage);//다음 번호대
		model.addAttribute("searchOption", searchOption);//검색 옵션
		model.addAttribute("keyword", keyword);//검색 키워드
		
		return "list";
	}
	
	@RequestMapping(value = "oneView")
	public String oneView(Model model,@RequestParam HashMap<String,String> map) {
		String sid = map.get("id");
		long id = Long.parseLong(sid);
		List<User> users = userService.findAllById(id);
		for (User u: users) {
			Hibernate.initialize(u.getPhones());
		}
		model.addAttribute("oneView",users);	
		return "oneView";
	}
	
	@RequestMapping(value = "newForm")
	public String newForm(Model model,@RequestParam HashMap<String,String> map) {
		return "newForm";
	}
	
	@RequestMapping(value = "editForm")
	public String editForm(Model model,@RequestParam HashMap<String,String> map) {
		String sid = map.get("id");
		long id = Long.parseLong(sid);
		List<User> users = userService.findAllById(id);
		for (User u: users) {
			Hibernate.initialize(u.getPhones());
		}
		model.addAttribute("editView",users);	
		return "editForm";
	}
	
	@RequestMapping(value = "save")
	public String save(Model model,@RequestParam HashMap<String,String> map) {
		String id = map.get("id");
		String name = map.get("name");
		String depart = map.get("depart");
		String position = map.get("position");
		String address = map.get("address");
		String special = map.get("special");
		
		if(id == null) {
			userService.Create(name, depart, position, address, special);
		}else {
			long idl = Long.parseLong(id);
			userService.Update(idl, name, depart, position, address, special);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Model model,@RequestParam HashMap<String,String> map) {
		String sid = map.get("id");
		long id = Long.parseLong(sid);
		userService.Delete(id);
	
		return "redirect:list";
	}
	
	@RequestMapping(value = "phoneDelete")
	public String phoneDelete(Model model,@RequestParam HashMap<String,String> map) {
		String psid = map.get("id");
		long pid = Long.parseLong(psid);
		phoneService.deleteNum(pid);
	
		return "redirect:list";
	}
	

	@RequestMapping(value = "phoneSave")
	public String phoneSave(Model model,@RequestParam HashMap<String,String> map) {
		String sid = map.get("userid");
		
		String psid = map.get("phoneid");
		
		String num1 = map.get("addNum1");
		String num2 = map.get("addNum2");
		String num3 = map.get("addNum3");
		String num = num1 + "-" + num2 + "-"+ num3;		
		
		if(psid == null) {
			long id = Long.parseLong(sid);
			phoneService.AddNum(id, num);
		}else {
			long pid = Long.parseLong(psid);
			phoneService.UpdateNum(pid, num);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "PhoneEdit")
	public String PhoneEdit(Model model,@RequestParam HashMap<String,String> map) {
		String sid = map.get("id");
		long id = Long.parseLong(sid);
		List<User> users = userService.findAllById(id);
		for (User u: users) {
			Hibernate.initialize(u.getPhones());
		}
		model.addAttribute("phoneEdit",users);	
	
		return "PhoneEdit";
	}
	
	
}
