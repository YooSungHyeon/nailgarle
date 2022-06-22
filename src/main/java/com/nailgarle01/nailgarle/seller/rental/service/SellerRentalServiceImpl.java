package com.nailgarle01.nailgarle.seller.rental.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.seller.rental.dao.SellerRentalDAO;

@Service("sellerRentalSerivce")
public class SellerRentalServiceImpl implements SellerRentalService {
	@Autowired
	private SellerRentalDAO sellerRentalDAO;

	@Override
	public ArrayList<OrderVO> rentalList(HashMap condMap) throws Exception {
		return sellerRentalDAO.rentalList(condMap);

	}

}
