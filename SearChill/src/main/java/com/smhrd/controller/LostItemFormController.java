package com.smhrd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @PostMapping("/saveLostItem")
    public String saveLostItem(Lostitem lostitem) {
        
    	
    	System.out.println(lostitem.toString());
    	
    	int result = lostitemFormMapper.insertLostitem(lostitem);
    	
    	if(result != 0) {
    		return "SaveLostItem"; // 성공 페이지
    	}else {
    		return "Main"; // 실패    		
    	}
    	
    }
    
    @PostMapping("/qrScan/saveLostItem")
    public String saveLostItemScan(Lostitem lostitem) {
    	
    	
    	System.out.println(lostitem.toString());
    	
    	int result = lostitemFormMapper.insertLostitem(lostitem);
    	
    	if(result != 0) {
    		return "SaveLostItem"; // 성공 페이지
    	}else {
    		return "Main"; // 실패    		
    	}
    	
    }
}
