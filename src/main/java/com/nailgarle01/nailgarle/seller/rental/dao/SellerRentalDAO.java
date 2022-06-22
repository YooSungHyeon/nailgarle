package com.nailgarle01.nailgarle.seller.rental.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface SellerRentalDAO {

	public ArrayList<OrderVO> rentalList(HashMap condMap) throws DataAccessException;

}
