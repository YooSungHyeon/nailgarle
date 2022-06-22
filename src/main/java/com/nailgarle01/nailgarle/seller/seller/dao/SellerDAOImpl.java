package com.nailgarle01.nailgarle.seller.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Repository("sellerDAO")
public class SellerDAOImpl implements SellerDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public SellerVO login(SellerVO vo) throws DataAccessException {
		return sqlSession.selectOne("mapper.seller.login", vo);
	}

	@Override
	public void insertNewSeller(SellerVO sellerVO) throws DataAccessException {
		sqlSession.insert("mapper.seller.insertNewSeller", sellerVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.seller.selectOverlappedID", id);
		return result;
	}

	@Override
	public void updateSellerInfo(SellerVO vo) throws DataAccessException {
		sqlSession.update("mapper.seller.updateSellerInfo", vo);
	}

	@Override
	public SellerVO selectSellerInfo(String sellerId) throws DataAccessException {
		SellerVO sellerVO = (SellerVO) sqlSession.selectOne("mapper.seller.selectSellerInfo", sellerId);
		return sellerVO;
	}

	@Override
	public void deleteSeller(String sellerId) throws DataAccessException {
		sqlSession.update("mapper.seller.sellerDelete", sellerId);
	}

}
