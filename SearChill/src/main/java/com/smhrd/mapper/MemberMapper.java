package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Member;

import lombok.NonNull;

@Mapper
public interface MemberMapper {

	public void memberInsert(Member member);

	public Member memberSelectOne(Member member);

	public int memberUpdate(Member member);

	public Member IDCheck(String inputID);

	public String phoneCheck(String mem_id);

	public void updateMemberAlarm(String mem_id);
	
	
	public void resetMemberAlarm(String mem_id);

	public String alarmSelectOne(String mem_id);
	
}
