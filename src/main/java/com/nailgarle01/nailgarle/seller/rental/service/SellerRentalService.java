package com.nailgarle01.nailgarle.seller.rental.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface SellerRentalService {

	public ArrayList<OrderVO> rentalList(HashMap condMap) throws Exception;

}
