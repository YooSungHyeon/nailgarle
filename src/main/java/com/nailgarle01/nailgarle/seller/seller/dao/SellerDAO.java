package com.nailgarle01.nailgarle.seller.seller.dao;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

public interface SellerDAO {

	public SellerVO login(SellerVO vo) throws DataAccessException;

	public void insertNewSeller(SellerVO sellerVO) throws DataAccessException;

	public String selectOverlappedID(String id) throws DataAccessException;

	public void updateSellerInfo(SellerVO vo) throws DataAccessException;

	public SellerVO selectSellerInfo(String sellerId) throws DataAccessException;

	public void deleteSeller(String sellerId) throws DataAccessException;

}
