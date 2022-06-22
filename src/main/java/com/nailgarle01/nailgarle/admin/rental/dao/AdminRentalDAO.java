package com.nailgarle01.nailgarle.admin.rental.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface AdminRentalDAO {
	public ArrayList<OrderVO> listRental(HashMap condMap) throws DataAccessException;
}
