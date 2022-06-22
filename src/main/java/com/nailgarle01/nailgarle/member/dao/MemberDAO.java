package com.nailgarle01.nailgarle.member.dao;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.member.vo.MemberVO;

public interface MemberDAO {

	public MemberVO login(MemberVO vo) throws DataAccessException;

	public String selectOverlappedID(String id) throws DataAccessException;

	public void insertNewMember(MemberVO memberVO) throws DataAccessException;

	public MemberVO selectIdMember(MemberVO vo) throws DataAccessException;

	public MemberVO selectPwMember(MemberVO vo) throws DataAccessException;

	public String idFind(MemberVO memberVO) throws DataAccessException;

	public String pwFind(MemberVO memberVO) throws DataAccessException;

	public void updatePw(MemberVO vo) throws DataAccessException;

}
