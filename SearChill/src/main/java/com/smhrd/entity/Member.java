package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Member {

	@NonNull
	private String mem_id;
	@NonNull
	private String mem_pw;
	@NonNull
	private String mem_phone;
	private String mem_email;
	@NonNull
	private String mem_name;
	private String mem_phone_open ="x";
	
}
