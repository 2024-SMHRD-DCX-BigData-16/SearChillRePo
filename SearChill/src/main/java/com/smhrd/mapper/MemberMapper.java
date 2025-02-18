package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Member;

@Mapper
public interface MemberMapper {

	// 기존의 DAO 역할 -> mapper.xml 파일의 sql쿼리를 실행
	public void memberInsert(Member member);
	
	public Member memberSelectOne(Member member);

	// 리턴타입 -> update 하고나서 결과
	public int memberUpdate(Member member);

	// 전체회원 조회
	public List<Member> showMember();

	// 회원삭제
	public void deleteMember(String email);
	
	// 중복 이메일 확인
	// select * from Member where id = #{email}
	public Member emailCheck(String inputE);
	
	
}
