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
		
		//검색
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
			List<User> users = userService.findAllByOrderByIdDesc();
				for (User u: users) {
					Hibernate.initialize(u.getPhones());
				}
			model.addAttribute("users",users);
		}if(searchOption==1) {//이름으로 찾기
			List<User> users = userService.findUserByNameContaining(keyword);
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
