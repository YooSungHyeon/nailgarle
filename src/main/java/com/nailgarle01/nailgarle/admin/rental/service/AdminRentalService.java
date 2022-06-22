package com.nailgarle01.nailgarle.admin.rental.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface AdminRentalService {
	public ArrayList<OrderVO> listRental(HashMap condMap) throws Exception;
}
