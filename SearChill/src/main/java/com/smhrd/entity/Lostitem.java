package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class Lostitem {
	//<!-- 자동등록 : 분실물 고유번호 object_idx, QR 고유번호 qr_idx, 분실물 스캔 날짜 object_date-->

    private String object_idx; 
    private String object_name;
    private String object_scan_loc; 
    private String object_date;  
    private String object_photo; 
    private String object_keeping_place;
    private String object_keeping_place_info;
    private String mem_id;
    private String object_scan_loc_lat; 
    private String object_scan_loc_lon;
    private String object_keeping_place_lat; 
    private String object_keeping_place_lon;
    private String notice_msg;
    
//    private String object_idx; 
//    @NonNull
//    private String object_name;
//    @NonNull
//    private String object_scan_loc; 
//    private String object_date;  
//    @NonNull
//    private String object_photo; 
//    @NonNull
//    private String object_keeping;
//    @NonNull
//    private String object_keeping_info;
//    private String qr_idx;
//    @NonNull
//    private String object_scan_loc_lat; 
//    @NonNull
//    private String object_scan_loc_lon;
//    @NonNull
//    private String object_keeping_place_lat; 
//    @NonNull
//    private String object_keeping_place_lon;
//    @NonNull
//    private String notice_msg;
    
    
    
}
