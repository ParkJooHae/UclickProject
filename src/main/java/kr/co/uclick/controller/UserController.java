package kr.co.uclick.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.uclick.entity.Sample;
import kr.co.uclick.entity.User;
import kr.co.uclick.service.PhoneService;
import kr.co.uclick.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	@Autowired
	private PhoneService phoneService;
	
	@RequestMapping(value = "list")
	public String list(Model model,@RequestParam HashMap<String,String> map) {
		List<User> users = userService.findAllByOrderByIdDesc();
		model.addAttribute("users",users);
		return "list";
	}
	
	@RequestMapping(value = "newForm")
	public String newForm(Model model,@RequestParam HashMap<String,String> map) {
		return "newForm";
	}
	
	@RequestMapping(value = "editForm")
	public String editForm(Model model,@RequestParam HashMap<String,String> map) {
		
		//userService.findAllById(id);
		return "editForm";
	}
	
	@RequestMapping(value = "save")
	public String save(Model model,@RequestParam HashMap<String,String> map) {
		
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(Model model,@RequestParam HashMap<String,String> map) {
		return "redirect:list";
	}
	
}
