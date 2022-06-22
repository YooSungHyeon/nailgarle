package com.nailgarle01.nailgarle.admin.order.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.order.vo.OrderVO;


public interface AdminOrderService {
	public List<OrderVO> listNewOrder(Map condMap) throws Exception;

	public void modifyDeliveryState(Map deliveryMap) throws Exception;

	public Map orderDetail(int order_id) throws Exception;
}
