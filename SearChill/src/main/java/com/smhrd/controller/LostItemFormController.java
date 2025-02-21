package com.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.entity.Lostitem;
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
    public String saveLostItem(Lostitem lostitem) {
        
    	
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
