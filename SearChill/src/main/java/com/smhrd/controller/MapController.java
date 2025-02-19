package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.entity.MapAddress;
import com.smhrd.mapper.MemberMapper;

// POJO를 찾기위해서 필요한 조건 2가지
// 1. servlet-context.xml 파일에 Contoller 명시하기
// 2. 해당 파일에 Controller라고 명시하기
@Controller
public class MapController {

	@Autowired
	private MemberMapper memberMapper;

	
	@RequestMapping("/")
	public String main() {
		return "Main";
	}

	@RequestMapping("/mapMain")
	public String mapMain() {
		return "MapMain";
	}
	
	
	@GetMapping("/submitAddress")
	public String memberInsert(MapAddress mapAddress, HttpSession session, Model model, @RequestParam int pageNo) {
		
		session.setAttribute("mapAddress", mapAddress);
		model.addAttribute("pageNo", pageNo);
		return "LostList";
	}

	
//	@RequestMapping("/goMain")
//	public String goMain() {
//		return "Main";
//	}
//
//	@RequestMapping("/updateUser")
//	public String updateUser() {
//
//		return "UpdateMember";
//	}
//
//	@RequestMapping("/emailCheck") //@ResponseBody -> View(화면)이 아니라 데이터를 직접 반환할 때 사용한다!
//	public @ResponseBody boolean emailCheck(@RequestParam("inputE") String inputE) {
//		// 받아온 이메일을 가지고 데이터베이스에 동일한 email이 있는지 확인 
//		Member member= memberMapper.emailCheck(inputE);
//		
//		// member 객체안에는 
//		// 1. 동일한 email이 있다면 -> 해당 유저의 정보가! -> email 사용 불가 
//		// 2. 동일한 email이 없다면 -> null값이 있다! -> email 사용 가능
//		
//		// boolean 타입으로 되돌려주자!
//		if(member == null) {
//			// 사용 가능한 이메일 
//			return true;
//		}else {
//			// 사용 불가한 이메일 
//			return false;
//		}
//		
//		
//		
//		
//	}
//	
//	// 회원가입
//	// localhost:8082/controller/memberInsert
//	@PostMapping("/memberInsert")
//	public String memberInsert(Member member, Model model) { // email, pw, tel, address
////		System.out.println(member.toString());
//		memberMapper.memberInsert(member);
//		model.addAttribute("email", member.getEmail());
//		return "JoinSuccess";
//	}
//
//	// 로그아웃 기능
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
////		session.invalidate();
//		session.removeAttribute("loginuser");
//		return "Main";
//	}
//	
//	// ShowMember.jsp로 이동하는 기능 + 전체회원 조회
//	@GetMapping("/showMember")
//	public String showMember(Model model) {
//		List<Member> list = memberMapper.showMember();
//		model.addAttribute("list", list);
//		return "ShowMember";
//	}
//	
//	// admin계정으로 로그인 했을 때 회원삭제하기
//	// deleteMember?email=juhue
//	@GetMapping("/deleteMember")
//	public String deleteMember(@RequestParam("email") String email) {
//		
//		// 매개변수로 받아온 email값을 memberMapper 인터페이스에 넘기기
//		// 인터페이스에서 deleteMember(String email) 만들기
//		memberMapper.deleteMember(email);
//		// MemberMapper.xml에 id 값이 deleteMember인 쿼리 작성하기
//		// MySql 워크벤치에서 select 했을 때 해당 계정이 삭제됐는지 확인하기
//		
//		return "redirect:/showMember";
//	}
	
	
	
	
	
	
}
