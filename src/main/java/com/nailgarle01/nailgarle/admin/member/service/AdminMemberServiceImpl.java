package com.nailgarle01.nailgarle.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.admin.member.dao.AdminMemberDAO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception {
		return adminMemberDAO.listMember(condMap);
	}

	@Override
	public MemberVO memberdetail(MemberVO memberVO) throws Exception {
		return adminMemberDAO.memberdetail(memberVO);
	}

	@Override
	public SellerVO sellerdetail(SellerVO sellerVO) throws Exception {
		return adminMemberDAO.sellerdetail(sellerVO);
	}

	@Override
	public void modifyMember(MemberVO memberVO) throws Exception {
		adminMemberDAO.modifyMember(memberVO);
	}

	@Override
	public void modifySeller(SellerVO sellerVO) throws Exception {
		adminMemberDAO.modifySeller(sellerVO);
	}

	@Override
	public List<MemberVO> lineupMember(HashMap condMap) throws Exception {
		List<MemberVO> memberList = adminMemberDAO.lineupMember(condMap);
		return memberList;
	}

	@Override
	public List<MemberVO> sellerMember(HashMap condMap) throws Exception {
		List<MemberVO> memberList = adminMemberDAO.sellerMember(condMap);
		return memberList;
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		adminMemberDAO.updateMember(memberVO);
	}

	@Override
	public void updateSeller(SellerVO sellerVO) throws Exception {
		adminMemberDAO.updateSeller(sellerVO);
	}
}