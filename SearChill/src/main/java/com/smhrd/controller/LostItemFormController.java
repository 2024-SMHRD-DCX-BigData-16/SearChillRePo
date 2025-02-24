package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Lostitem;
import com.smhrd.entity.Member;
import com.smhrd.mapper.LostitemFormMapper;

@Controller
public class LostItemFormController {
    
    @Autowired
    private LostitemFormMapper lostitemFormMapper;
        
    @GetMapping("/qrScan/lostItemForm")
    public String lostItemForm(@RequestParam("mem_id") String mem_id) {
        return "LostItemForm";
    }
    
    @GetMapping("/lostItemForm")
    public String lostItemForm() {
    	return "LostItemForm";
    }
    
    @RequestMapping("/goSaveLostItem")
    public String goSaveLostItem() {
    	return "SaveLostItem";
    }
    
    
    // 스캔없이 페이지 접속하고 분실물 저장
    // mem_id가 null값
    @PostMapping("/saveLostItem")
    public String saveLostItem(Lostitem lostitem, HttpServletRequest request) {
        
		// 파일 업로드를 위한 객체 : MultipartRequest
		MultipartRequest multi = null;
		
        // 1. 요청객체(request)
        // 2. 파일을 저장할 폴더의 경로 (절대 경로 대신 상대 경로로 접근)
		
		try {
			// 1. 요청객체(request)
			// 2. 파일을 저장할 폴더의 경로(String)
			String savePath = request.getRealPath("resources/objectImages");
			System.out.println(savePath);
			// 3. 허용 용량 크기(int)
			int maxSize = 1024*1024*10; // 10MB
			// 4. 파일 이름의 인코딩 방식
			String encoding = "UTF-8";
			// 5. 중복이름 제거(DefaultfileRenamePolicy)
			DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();
			multi = new MultipartRequest(request, savePath, maxSize, encoding, dfrp);
			
			// 파일이름 가져오기
			String object_photo = multi.getFilesystemName("object_photo");
			
			lostitem.setObject_photo(object_photo);

			// 나머지 설정
			String object_name = multi.getParameter("object_name");
			String object_scan_loc = multi.getParameter("object_scan_loc");
			String object_keeping_place = multi.getParameter("object_keeping_place");
			String object_keeping_place_info = multi.getParameter("object_keeping_place_info");
			String mem_id = multi.getParameter("mem_id");
			String object_scan_loc_lat = multi.getParameter("object_scan_loc_lat");
			String object_scan_loc_lon = multi.getParameter("object_scan_loc_lon");
			String object_keeping_place_lat = multi.getParameter("object_keeping_place_lat");
			String object_keeping_place_lon = multi.getParameter("object_keeping_place_lon");
			String notice_msg = multi.getParameter("notice_msg");

			lostitem.setObject_name(object_name);
			lostitem.setObject_scan_loc(object_scan_loc);
			lostitem.setObject_photo(object_photo);
			lostitem.setObject_keeping_place(object_keeping_place);
			lostitem.setObject_keeping_place_info(object_keeping_place_info);
			lostitem.setMem_id(mem_id);
			lostitem.setObject_scan_loc_lat(object_scan_loc_lat);
			lostitem.setObject_scan_loc_lon(object_scan_loc_lon);
			lostitem.setObject_keeping_place_lat(object_keeping_place_lat);
			lostitem.setObject_keeping_place_lon(object_keeping_place_lon);
			lostitem.setNotice_msg(notice_msg);
			
			
			System.out.println(lostitem.toString());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	System.out.println(lostitem.toString());
    	
    	int result = lostitemFormMapper.insertLostitem(lostitem);
    	
    	if(result != 0) {
    		return "redirect:/goSaveLostItem"; // 성공 페이지
    	}else {
    		return "redirect:/main"; // 실패    		
    	}
    	
    }
    
    
    // 스캔으로 페이지 접속하고 분실물 저장
    @PostMapping("/qrScan/saveLostItem")
    public String saveLostItemScan(Lostitem lostitem) {
    	
    	System.out.println(lostitem.toString());
    	
    	int result = lostitemFormMapper.insertLostitem(lostitem);
    	
    	if(result != 0) {
    		return "redirect:/goSaveLostItem"; // 성공 페이지
    	}else {
    		return "redirect:/main"; // 실패    		
    	}
    	
    }
    
    @RequestMapping("myLostItemNotice")
    public String myLostItemNotice(HttpSession session) {
    	Member loginuser = (Member) session.getAttribute("loginuser");
    	System.out.println(loginuser.toString());
    	
    	if (loginuser != null) {
    		String mem_id = loginuser.getMem_id();
    		
    		System.out.println(mem_id);
    		List<Lostitem> lostItemList = lostitemFormMapper.myLostItemNotice(mem_id);
    		session.setAttribute("myLostItemList", lostItemList);
		}
    	
    	return "MyLostItemNotice";
    }
    
    
    // select
	//  조회
	@RequestMapping("/lostitemList")
	public @ResponseBody List<Lostitem> showMember(Model model) {
		List<Lostitem> lostitemList = lostitemFormMapper.getLostitemIsNull();
		model.addAttribute("lostitemList", lostitemList);
		
//		System.out.println(lostitemList.toString());
		
		return lostitemList;
	}

    
}
