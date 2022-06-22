package com.nailgarle01.nailgarle.seller.rental.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Repository("sellerRentalDAO")
public class SellerRentalDAOImpl implements SellerRentalDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<OrderVO> rentalList(HashMap condMap) throws DataAccessException {
		ArrayList<OrderVO> rentalList = (ArrayList) sqlSession.selectList("mapper.seller.rental.rentalList", condMap);
		return rentalList;
	}

}
