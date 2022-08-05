package com.mall.dao;

import java.util.List;

import com.mall.domain.MemberVO;

public interface MemberDAO {

	// 회원 가입
	public void signup(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 유저목록 보기
	public List<MemberVO> memberlist();
	
	// 회원정보 조회
	public MemberVO memberview(int useridx) throws Exception;
	
	// 회원정보 수정
	public void memberModify(MemberVO vo) throws Exception;
	
	// 회원정보 삭제
	public void memberDelete(int useridx) throws Exception;
	
	// 아이디 중복체크


}
