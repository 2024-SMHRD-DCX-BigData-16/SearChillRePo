package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Member;

@Mapper
public interface MemberMapper {

	// ������ DAO ���� -> mapper.xml ������ sql������ ����
	public void memberInsert(Member member);
	
	public Member memberSelectOne(Member member);

	// ����Ÿ�� -> update �ϰ��� ���
	public int memberUpdate(Member member);

	// ��üȸ�� ��ȸ
	public List<Member> showMember();

	// ȸ������
	public void deleteMember(String email);
	
	// �ߺ� �̸��� Ȯ��
	// select * from Member where id = #{email}
	public Member emailCheck(String inputE);
	
	
}
