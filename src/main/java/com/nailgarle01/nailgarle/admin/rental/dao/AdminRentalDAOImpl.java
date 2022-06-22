package com.nailgarle01.nailgarle.admin.rental.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.order.vo.OrderVO;


@Repository("adminRentalDao")
public class AdminRentalDAOImpl implements AdminRentalDAO{

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<OrderVO> listRental(HashMap condMap) throws DataAccessException {
		ArrayList<OrderVO> rentalList = (ArrayList) sqlSession.selectList("mapper.admin.rental.listRental", condMap);
		return rentalList;
	}
	
}
