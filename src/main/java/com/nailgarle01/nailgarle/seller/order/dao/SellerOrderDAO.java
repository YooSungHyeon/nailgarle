package com.nailgarle01.nailgarle.seller.order.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface SellerOrderDAO {

	public ArrayList<OrderVO> selectNewOrderList(Map condMap) throws DataAccessException;

	public void updateDeliveryState(Map deliveryMap) throws DataAccessException;

}
