package com.nailgarle01.nailgarle.admin.rental.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.admin.rental.dao.AdminRentalDAO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Service("adminRentalService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminRentalServiceImpl implements AdminRentalService{

	@Autowired
	private AdminRentalDAO adminRentalDAO;
	
	public ArrayList<OrderVO> listRental(HashMap condMap) throws Exception {
		return adminRentalDAO.listRental(condMap);
	}
}
