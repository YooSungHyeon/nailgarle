package com.nailgarle01.nailgarle.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

public interface AdminMemberDAO {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException;

	public MemberVO memberdetail(MemberVO memberVO) throws DataAccessException;

	public SellerVO sellerdetail(SellerVO sellerVO) throws DataAccessException;

	public void modifyMember(MemberVO memberVO) throws DataAccessException;

	public void modifySeller(SellerVO sellerVO) throws DataAccessException;

	public List<MemberVO> lineupMember(HashMap condMap) throws DataAccessException;

	public List<MemberVO> sellerMember(HashMap condMap) throws DataAccessException;

	public void updateMember(MemberVO memberVO) throws DataAccessException;

	public void updateSeller(SellerVO sellerVO) throws DataAccessException;
}
