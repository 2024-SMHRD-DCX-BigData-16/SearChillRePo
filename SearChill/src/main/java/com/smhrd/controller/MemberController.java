package com.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.entity.Member;
import com.smhrd.mapper.MemberMapper;

@Controller
public class MemberController {

	
	@Autowired
	private MemberMapper MemberMapper;

	

	
	
	@RequestMapping("/memberMain")
	public String goMain() {
		return "MemberMain";
	}
	
	@RequestMapping("/goJoinSuccess")
	public String goJoinSuccess() {
		return "JoinSuccess";
	}

	@RequestMapping("/goJoin")
	public String goJoin() {
		return "Join";
	}
	@RequestMapping("/qrScan/memberMain")
	public String goMainScan() {
		return "redirect:/memberMain";
	}
	
	@RequestMapping("/qrScan/goJoinSuccess")
	public String goJoinSuccessScan() {
		return "redirect:/goJoinSuccess";
	}
	
	@RequestMapping("/qrScan/goJoin")
	public String goJoinScan() {
		return "redirect:/goJoin";
	}
	
	@PostMapping("/memberInsert")
	public String memberInsert(Member member, Model model) {
		if (member.getMem_phone_open() == null || member.getMem_phone_open().isEmpty()) {
			member.setMem_phone_open("X"); // 기본값 설정
		}

		MemberMapper.memberInsert(member);
		return "redirect:/goJoinSuccess";
	}

   @GetMapping("/logout")
   public String logout(HttpSession session) {
	  //session.invalidate();
      session.removeAttribute("loginuser");
      return "redirect:/goMain";
   }

   @GetMapping("/qrScan/logout")
   public String logoutScan(HttpSession session) {
	   //session.invalidate();
	   session.removeAttribute("loginuser");
	   return "redirect:/goMain";
   }
	
   
	@RequestMapping("/updateUser")
	public String updateUser() {

		return "UpdateMember";
	}

	@RequestMapping("/qrScan/updateUser")
	public String updateUserScan() {
		
		return "redirect:/updateMember";
	}


	@RequestMapping("/phoneCheck")
	public String phoneCheck(@RequestParam("mem_id") String mem_id, Model model) {
		
		//mem_id로 조회해서 공개여부가 1이면 연락처 모델에 저장 아니면 비공개입니다
		String phone = MemberMapper.phoneCheck(mem_id);
		if(phone != null) {
			model.addAttribute("phone", phone);
			
			System.out.println(phone);
		}else {
			System.out.println(phone);
			model.addAttribute("phone", "비공개 상태입니다.");
		}
		return "PhoneCheck";
	}
	
	@RequestMapping("/qrScan/phoneCheck")
	public String phoneCheckScan(@RequestParam("mem_id") String mem_id, Model model) {
		
		//mem_id로 조회해서 공개여부가 1이면 연락처 모델에 저장 아니면 비공개입니다
		String phone = MemberMapper.phoneCheck(mem_id);
		if(phone != null) {
			model.addAttribute("phone", phone);
			
			System.out.println(phone);
		}else {
			System.out.println(phone);
			model.addAttribute("phone", "비공개 상태입니다.");
		}
		return "PhoneCheck";
	}
	
	
	@RequestMapping("/IDCheck")
	public @ResponseBody boolean IDCheck(@RequestParam("inputID") String inputID) {
		// 아이디 중복 여부 확인
		Member member = MemberMapper.IDCheck(inputID);

	
		if (member == null) {
			// 사용 가능한 이메일
			return true;
		} else {
			// 사용 불가한 이메일
			return false;
		}

	}

	
	
	@PostMapping("/memberLogin")
	public String memberJoin(Member member, Model model, HttpSession session) {

		Member loginMember = MemberMapper.memberSelectOne(member);
		String alarmCheck = MemberMapper.alarmSelectOne(member.getMem_id());
		
		if (loginMember == null) {
			// 로그인 실패
			System.out.println("로그인에 실패했습니다 id와 pw를 확인해주세요");
			session.removeAttribute("loginuser");
			session.removeAttribute("alarmCheck");
			return "MemberMain";
		} else {
			// 로그인 성공
			session.setAttribute("loginuser", loginMember);
			session.setAttribute("alarmCheck", alarmCheck);
			
			return "Main";
		}

	}

	@PostMapping("/UpdateMember")
	public String updateMember(@RequestParam("mem_pw") String mem_pw,
	                            @RequestParam("mem_phone") String mem_phone,
	                            @RequestParam("mem_email") String mem_email,
	                            @RequestParam("mem_name") String mem_name,
	                            @RequestParam("mem_phone_open") String mem_phone_open,
	                            HttpSession session) {

	    
	    Member loginMember = (Member) session.getAttribute("loginuser");
	    String mem_id = loginMember.getMem_id();

	    
	    Member member = new Member(mem_id, mem_pw, mem_email, mem_name, mem_phone, mem_phone_open);
	   
	    int result = MemberMapper.memberUpdate(member);

	    if (result > 0) {
	        // 회원정보 수정 성공
	        session.setAttribute("loginuser", member);
	        System.out.println("회원정보 수정 성공");
	        return "redirect:/memberMain";  // 수정 후 메인 페이지로 리다이렉트
	    } else {
	        // 회원정보 수정 실패
	    	System.out.println("회원정보 수정 실패");
	        return "UpdateMember";  // 수정 실패 시 수정 페이지로 리턴
	    }
	}
}