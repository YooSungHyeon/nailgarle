package com.nailgarle01.nailgarle.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import com.nailgarle01.nailgarle.order.dao.OrderDAO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception {
		List<OrderVO> orderGoodsList;
		orderGoodsList = orderDAO.listMyOrderGoods(orderVO);
		return orderGoodsList;
	}

	public List<OrderVO> addNewOrder(List<OrderVO> myOrderList) throws Exception {
		myOrderList = orderDAO.insertNewOrder(myOrderList);
		// 카트에서 주문 상품 제거한다.
		orderDAO.removeGoodsFromCart(myOrderList);
		
		return myOrderList;
	}

	public OrderVO findMyOrder(String order_id) throws Exception {
		return orderDAO.findMyOrder(order_id);
	}

}
