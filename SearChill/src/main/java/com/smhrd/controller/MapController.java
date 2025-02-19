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

// POJO�� ã�����ؼ� �ʿ��� ���� 2����
// 1. servlet-context.xml ���Ͽ� Contoller ����ϱ�
// 2. �ش� ���Ͽ� Controller��� ����ϱ�
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
//	@RequestMapping("/emailCheck") //@ResponseBody -> View(ȭ��)�� �ƴ϶� �����͸� ���� ��ȯ�� �� ����Ѵ�!
//	public @ResponseBody boolean emailCheck(@RequestParam("inputE") String inputE) {
//		// �޾ƿ� �̸����� ������ �����ͺ��̽��� ������ email�� �ִ��� Ȯ�� 
//		Member member= memberMapper.emailCheck(inputE);
//		
//		// member ��ü�ȿ��� 
//		// 1. ������ email�� �ִٸ� -> �ش� ������ ������! -> email ��� �Ұ� 
//		// 2. ������ email�� ���ٸ� -> null���� �ִ�! -> email ��� ����
//		
//		// boolean Ÿ������ �ǵ�������!
//		if(member == null) {
//			// ��� ������ �̸��� 
//			return true;
//		}else {
//			// ��� �Ұ��� �̸��� 
//			return false;
//		}
//		
//		
//		
//		
//	}
//	
//	// ȸ������
//	// localhost:8082/controller/memberInsert
//	@PostMapping("/memberInsert")
//	public String memberInsert(Member member, Model model) { // email, pw, tel, address
////		System.out.println(member.toString());
//		memberMapper.memberInsert(member);
//		model.addAttribute("email", member.getEmail());
//		return "JoinSuccess";
//	}
//
//	// �α׾ƿ� ���
//	@GetMapping("/logout")
//	public String logout(HttpSession session) {
////		session.invalidate();
//		session.removeAttribute("loginuser");
//		return "Main";
//	}
//	
//	// ShowMember.jsp�� �̵��ϴ� ��� + ��üȸ�� ��ȸ
//	@GetMapping("/showMember")
//	public String showMember(Model model) {
//		List<Member> list = memberMapper.showMember();
//		model.addAttribute("list", list);
//		return "ShowMember";
//	}
//	
//	// admin�������� �α��� ���� �� ȸ�������ϱ�
//	// deleteMember?email=juhue
//	@GetMapping("/deleteMember")
//	public String deleteMember(@RequestParam("email") String email) {
//		
//		// �Ű������� �޾ƿ� email���� memberMapper �������̽��� �ѱ��
//		// �������̽����� deleteMember(String email) �����
//		memberMapper.deleteMember(email);
//		// MemberMapper.xml�� id ���� deleteMember�� ���� �ۼ��ϱ�
//		// MySql ��ũ��ġ���� select ���� �� �ش� ������ �����ƴ��� Ȯ���ϱ�
//		
//		return "redirect:/showMember";
//	}
	
	
	
	
	
	
}
