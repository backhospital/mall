package com.mall.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.mall.dao.MemberDAO;
import com.mall.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	// 회원 가입
	@Override 
	public void signup(MemberVO vo) throws Exception {
		dao.signup(vo);		
	}
	
	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}

	// 로그아웃
	@Override
	public void signout(HttpSession session) throws Exception {
		session.invalidate();  // 세션 정보를 제거
	}
	
	// 회원목록 보기
	@Override
	public List<MemberVO> memberlist() throws Exception {
		return dao.memberlist();
	}
	
	// 회원정보 조회하기
	@Override
	public MemberVO memberview(int useridx) throws Exception {
		return dao.memberview(useridx);
	}
	
	// 회원정보 수정하기
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		dao.memberModify(vo);
	}
	
	// 회원정보 삭제하기
	@Override
	public void memberDelete(int useridx) throws Exception {
		dao.memberDelete(useridx);
	}
	
	// 아이디 중복체크


} 
