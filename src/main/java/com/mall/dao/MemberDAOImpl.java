package com.mall.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sql;
	
	// 매퍼 
	private static String namespace = "com.mall.mappers.memberMapper";
	
	// 회원 가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
	}
	
	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
	
	// 유저목록 보기
	@Override
	public List<MemberVO> memberlist() {
		return sql.selectList(namespace + ".memberlist");
	}
	
	// 회원정보 조회
	@Override
	public MemberVO memberview(int useridx) throws Exception {
		return sql.selectOne(namespace + ".memberview", useridx);
	}
	
	// 회원정보 수정
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		sql.update(namespace +".memberModify", vo);
	}
	
	// 회원정보 삭제
	@Override
	public void memberDelete(int useridx) throws Exception {
		sql.delete(namespace + ".memberDelete", useridx);
	}
	
	// 아이디 중복체크


	
}