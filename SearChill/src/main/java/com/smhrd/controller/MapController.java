package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.MapAddress;
import com.smhrd.entity.Member;
import com.smhrd.mapper.MemberMapper;

// POJO를 찾기위해서 필요한 조건 2가지
// 1. servlet-context.xml 파일에 Contoller 명시하기
// 2. 해당 파일에 Controller라고 명시하기
@Controller
public class MapController {

	@Autowired
	private MemberMapper memberMapper;

	
	@RequestMapping("/")
	public String main(HttpSession session) {
		Member loginuser = (Member) session.getAttribute("loginuser");
    	if(loginuser != null) {
    		
    		String mem_id = loginuser.getMem_id();
    		
    		String alarmCheck = memberMapper.alarmSelectOne(mem_id);
    		
    		session.setAttribute("alarmCheck", alarmCheck);
    	}
		return "Main";
	}
	
	@RequestMapping("/goMain")
	public String goMain(HttpSession session) {
		
    	Member loginuser = (Member) session.getAttribute("loginuser");
    	if(loginuser != null) {
    		
    		String mem_id = loginuser.getMem_id();
    		
    		String alarmCheck = memberMapper.alarmSelectOne(mem_id);
    		
    		session.setAttribute("alarmCheck", alarmCheck);
    	}
		
		return "Main";
	}

	@RequestMapping("/qrScan/goMain")
	public String goMainScan() {
		return "redirect:/goMain";
	}
	
	@RequestMapping("/qrScan/Main")
	public String MainScan() {
		return "redirect:/goMain";
	}

	@RequestMapping("/mapMain")
	public String mapMain() {
		return "MapMain";
	}
	@RequestMapping("/qrScan/mapMain")
	public String mapMainScan() {
		return "redirect:/mapMain";
	}
	
	
	@GetMapping("/submitAddress")
	public String memberInsert(MapAddress mapAddress, HttpSession session, Model model, @RequestParam int pageNo) {
		
		session.setAttribute("mapAddress", mapAddress);
		model.addAttribute("pageNo", pageNo);
		return "LostList";
	}



	
	
	
	
	
	
}
