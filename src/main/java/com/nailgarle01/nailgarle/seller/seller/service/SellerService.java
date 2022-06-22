package com.nailgarle01.nailgarle.seller.seller.service;

import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

public interface SellerService {

	public SellerVO login(SellerVO vo) throws Exception;

	public void addSeller(SellerVO sellerVO) throws Exception;

	public String overlapped(String id) throws Exception;

	public SellerVO modifySellerInfo(SellerVO vo) throws Exception;

	public void deleteSeller(String sellerId) throws Exception;

}
