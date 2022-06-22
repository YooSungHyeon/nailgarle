package com.nailgarle01.nailgarle.seller.order.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface SellerOrderService {

	public List<OrderVO> listNewOrder(Map condMap) throws Exception;

	public void modifyDeliveryState(Map deliveryMap) throws Exception;

}
