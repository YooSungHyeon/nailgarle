package com.nailgarle01.nailgarle.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.member.dao.MemberDAO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return memberDAO.login(vo);
	}

	@Override
	public String overlapped(String id) throws Exception {
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public MemberVO selectIdMember(MemberVO vo) throws Exception {
		return memberDAO.selectIdMember(vo);

	}

	@Override
	public MemberVO selectPwMember(MemberVO vo) throws Exception {
		return memberDAO.selectPwMember(vo);

	}

	@Override
	public String idFind(MemberVO memberVO) throws Exception {
		return memberDAO.idFind(memberVO);
	}

	@Override
	public String pwFind(MemberVO memberVO) throws Exception {
		return memberDAO.pwFind(memberVO);
	}

	@Override
	public void updatePw(MemberVO vo) throws Exception {
		memberDAO.updatePw(vo);
	}

}
