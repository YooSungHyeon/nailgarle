package com.nailgarle01.nailgarle.seller.order.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Repository("sellerOrderDAO")
public class SellerOrderDAOImpl implements SellerOrderDAO {
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<OrderVO> selectNewOrderList(Map condMap) throws DataAccessException {
		ArrayList<OrderVO> orderList = (ArrayList) sqlSession.selectList("mapper.seller.order.selectNewOrderList",
				condMap);
		return orderList;
	}
	
	public void updateDeliveryState(Map deliveryMap) throws DataAccessException {
		sqlSession.update("mapper.seller.order.updateDeliveryState", deliveryMap);
	}

}
