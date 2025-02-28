package com.smhrd.controller;

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
import com.smhrd.mapper.MemberMapper;
import com.smhrd.service.EmailService;

@Controller
public class LostItemFormController {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private LostitemFormMapper lostitemFormMapper;
    
    private final EmailService emailService;

    @Autowired
    public LostItemFormController(EmailService emailService) {
        this.emailService = emailService;
    }
    
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

    @PostMapping("/deleteLostItem")
    public String deleteLostItem(@RequestParam("object_idx") String object_idx) {
        lostitemFormMapper.deleteLostItem(object_idx);
        return "redirect:/myLostItemNotice";
    }

    @PostMapping("/saveLostItem")
    public String saveLostItem(Lostitem lostitem, HttpServletRequest request) {
        try {
            MultipartRequest multi = new MultipartRequest(request, request.getRealPath("resources/objectImages"),
                    1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());

            lostitem.setObject_photo(multi.getFilesystemName("object_photo"));
            lostitem.setObject_name(multi.getParameter("object_name"));
            lostitem.setObject_scan_loc(multi.getParameter("object_scan_loc"));
            lostitem.setObject_keeping_place(multi.getParameter("object_keeping_place"));
            lostitem.setObject_keeping_place_info(multi.getParameter("object_keeping_place_info"));
            lostitem.setMem_id(multi.getParameter("mem_id"));
            lostitem.setNotice_msg(multi.getParameter("notice_msg"));

        } catch (IOException e) {
            e.printStackTrace();
        }

        int result = lostitemFormMapper.insertLostitem(lostitem);
        
        if (result != 0) {
            return "redirect:/goSaveLostItem";
        } else {
            return "redirect:/main";
        }
    }
    
    @PostMapping("/qrScan/saveLostItem")
    public String saveLostItemScan(Lostitem lostitem, HttpServletRequest request, HttpSession session) {
    	try {
    		MultipartRequest multi = new MultipartRequest(request, request.getRealPath("resources/objectImages"),
    				1024 * 1024 * 10, "UTF-8", new DefaultFileRenamePolicy());
    		
    		lostitem.setObject_photo(multi.getFilesystemName("object_photo"));
    		lostitem.setObject_name(multi.getParameter("object_name"));
    		lostitem.setObject_scan_loc(multi.getParameter("object_scan_loc"));
    		lostitem.setObject_keeping_place(multi.getParameter("object_keeping_place"));
    		lostitem.setObject_keeping_place_info(multi.getParameter("object_keeping_place_info"));
    		lostitem.setMem_id(multi.getParameter("mem_id"));
    		lostitem.setNotice_msg(multi.getParameter("notice_msg"));
    		
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    	
    	int result = lostitemFormMapper.insertLostitem(lostitem);
    	
    	if (result != 0) {
    		// Alarm 업데이트
			memberMapper.updateMemberAlarm(lostitem.getMem_id());
			
			// 로그인한 상태면 본인 alarm 확인
			Member loginuser = (Member) session.getAttribute("loginuser");
	    	if(loginuser != null) {
	    		
	    		String loginuser_mem_id = loginuser.getMem_id();
	    		
	    		String alarmCheck = memberMapper.alarmSelectOne(loginuser_mem_id);
	    		
	    		session.setAttribute("alarmCheck", alarmCheck);
	    	}
	    	
	    	// email 보내기
    		String registeredEmail = lostitemFormMapper.findEmailByMemId(lostitem.getMem_id());
    		if (registeredEmail != null) {
    			emailService.sendLostItemNotification(registeredEmail, lostitem.getObject_name(), lostitem.getObject_keeping_place());
    		}
    		return "redirect:/goSaveLostItem?success=true";
    	} else {
    		return "redirect:/main";
    	}
    }

    @RequestMapping("/myLostItemNotice")
    public String myLostItemNotice(HttpSession session) {
        Member loginuser = (Member) session.getAttribute("loginuser");
        if (loginuser != null) {
            List<Lostitem> lostItemList = lostitemFormMapper.myLostItemNotice(loginuser.getMem_id());
            session.setAttribute("myLostItemList", lostItemList);
            memberMapper.resetMemberAlarm(loginuser.getMem_id());
            session.setAttribute("alarmCheck", "0");
        }
        return "MyLostItemNotice";
    }

    @RequestMapping("/qrScan/myLostItemNotice")
    public String myLostItemNoticeScan() {
        return "redirect:/myLostItemNotice";
    }

    @RequestMapping("/lostitemList")
    public @ResponseBody List<Lostitem> showMember(Model model) {
        List<Lostitem> lostitemList = lostitemFormMapper.getLostitemIsNull();
        model.addAttribute("lostitemList", lostitemList);
        return lostitemList;
    }
}
