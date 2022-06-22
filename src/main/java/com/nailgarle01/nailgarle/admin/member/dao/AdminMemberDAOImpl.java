package com.nailgarle01.nailgarle.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Repository("adminMemberDao")
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException {
		ArrayList<MemberVO> memberList = (ArrayList) sqlSession.selectList("mapper.admin.member.listMember", condMap);
		return memberList;
	}

	@Override
	public MemberVO memberdetail(MemberVO memberVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.member.memberdetail", memberVO);
	}

	@Override

	public SellerVO sellerdetail(SellerVO sellerVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.member.sellerdetail", sellerVO);
	}

	@Override
	public void modifyMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.update("mapper.admin.member.modifyMember", memberVO);
	}

	@Override
	public void modifySeller(SellerVO sellerVO) throws DataAccessException {
		sqlSession.update("mapper.admin.member.modifySeller", sellerVO);
	}

	@Override
	public List<MemberVO> lineupMember(HashMap condMap) throws DataAccessException {
		List<MemberVO> memberList = (ArrayList) sqlSession.selectList("mapper.admin.member.lineupMember", condMap);
		return memberList;
	}

	@Override
	public List<MemberVO> sellerMember(HashMap condMap) throws DataAccessException {
		List<MemberVO> memberList = (ArrayList) sqlSession.selectList("mapper.admin.member.sellerMember", condMap);
		return memberList;
	}

	@Override
	public void updateMember(MemberVO memberVO) throws DataAccessException {
		if (memberVO.getDel_yn().equals("n")) {
			sqlSession.update("mapper.admin.member.updateMember", memberVO);
		} else if (memberVO.getDel_yn().equals("y")) {
			sqlSession.update("mapper.admin.member.updateMember2", memberVO);
		}
	}

	@Override
	public void updateSeller(SellerVO sellerVO) throws DataAccessException {
		if (sellerVO.getDel_yn().equals("n")) {
			sqlSession.update("mapper.admin.member.updateSeller", sellerVO);
		} else if (sellerVO.getDel_yn().equals("y")) {
			sqlSession.update("mapper.admin.member.updateSeller2", sellerVO);
		}
	}
}
