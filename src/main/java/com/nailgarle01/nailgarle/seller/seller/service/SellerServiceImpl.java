package com.nailgarle01.nailgarle.seller.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.seller.seller.dao.SellerDAO;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Service("sellerService")
@Transactional(propagation = Propagation.REQUIRED)
public class SellerServiceImpl implements SellerService {
	@Autowired
	private SellerDAO sellerDAO;

	@Override
	public void addSeller(SellerVO sellerVO) throws Exception {
		sellerDAO.insertNewSeller(sellerVO);
	}

	@Override
	public String overlapped(String id) throws Exception {
		return sellerDAO.selectOverlappedID(id);
	}

	@Override
	public SellerVO login(SellerVO vo) throws Exception {
		return sellerDAO.login(vo);
	}

	@Override
	public SellerVO modifySellerInfo(SellerVO vo) throws Exception {
		String sellerId = (String) vo.getSellerId();
		sellerDAO.updateSellerInfo(vo);
		return sellerDAO.selectSellerInfo(sellerId);
	}

	@Override
	public void deleteSeller(String sellerId) throws Exception {
		sellerDAO.deleteSeller(sellerId);
	}

}
