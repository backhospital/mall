package com.mall.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mall.domain.MemberVO;

public interface MemberService {

	// 회원 가입
	public void signup(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 로그아웃
	public void signout(HttpSession session) throws Exception;
	
	// 회원 목록보기
	public List<MemberVO> memberlist() throws Exception;
	
	// 회원정보 조회하기
	public MemberVO memberview(int useridx) throws Exception;
	
	// 회원정보 수정하기
	public void memberModify(MemberVO vo) throws Exception;
	
	// 회원정보 삭제하기
	public void memberDelete(int useridx) throws Exception;
	
	// 아이디 중복체크


}