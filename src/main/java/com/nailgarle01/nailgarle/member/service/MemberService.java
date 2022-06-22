package com.nailgarle01.nailgarle.member.service;

import com.nailgarle01.nailgarle.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO vo) throws Exception;

	public String overlapped(String id) throws Exception;

	public void addMember(MemberVO memberVO) throws Exception;

	public MemberVO selectIdMember(MemberVO vo) throws Exception;

	public MemberVO selectPwMember(MemberVO vo) throws Exception;

	public String idFind(MemberVO memberVO) throws Exception;

	public String pwFind(MemberVO memberVO) throws Exception;

	public void updatePw(MemberVO vo) throws Exception;

}
