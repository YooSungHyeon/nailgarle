package com.nailgarle01.nailgarle.order.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;

	public List<OrderVO> addNewOrder(List<OrderVO> myOrderList) throws Exception;

	public OrderVO findMyOrder(String order_id) throws Exception;

}
