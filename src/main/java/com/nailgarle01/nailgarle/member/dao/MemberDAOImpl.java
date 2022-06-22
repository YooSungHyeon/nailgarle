package com.nailgarle01.nailgarle.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO login(MemberVO vo) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.login", vo);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectOverlappedID", id);
		return result;
	}

	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}
	
	@Override
	public MemberVO selectIdMember(MemberVO vo) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectIdMember", vo);
	}

	@Override
	public MemberVO selectPwMember(MemberVO vo) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectPwMember", vo);
	}

	@Override
	public String idFind(MemberVO memberVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectIdFind", memberVO);
		return result;
	}

	@Override
	public String pwFind(MemberVO memberVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.member.selectPwFind", memberVO);
		return result;
	}

	@Override
	public void updatePw(MemberVO vo) throws DataAccessException {
		sqlSession.update("mapper.member.updatePw", vo);
	}

}
