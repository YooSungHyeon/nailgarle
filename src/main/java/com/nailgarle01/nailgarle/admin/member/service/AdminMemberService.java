package com.nailgarle01.nailgarle.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

public interface AdminMemberService {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;

	public MemberVO memberdetail(MemberVO memberVO) throws Exception;

	public SellerVO sellerdetail(SellerVO sellerVO) throws Exception;

	public void modifyMember(MemberVO memberVO) throws Exception;
	
	public void modifySeller(SellerVO sellerVO) throws Exception;

	public List<MemberVO> lineupMember(HashMap condMap) throws Exception;

	public List<MemberVO> sellerMember(HashMap condMap) throws Exception;

	public void updateMember(MemberVO memberVO) throws Exception;

	public void updateSeller(SellerVO sellerVO) throws Exception;
}
