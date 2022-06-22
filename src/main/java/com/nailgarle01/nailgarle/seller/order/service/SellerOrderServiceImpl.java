package com.nailgarle01.nailgarle.seller.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.seller.order.dao.SellerOrderDAO;

@Service("sellerOrderService")
public class SellerOrderServiceImpl implements SellerOrderService {
	@Autowired
	private SellerOrderDAO sellerOrderDAO;

	public List<OrderVO> listNewOrder(Map condMap) throws Exception {
		return sellerOrderDAO.selectNewOrderList(condMap);
	}

	@Override
	public void modifyDeliveryState(Map deliveryMap) throws Exception {
		sellerOrderDAO.updateDeliveryState(deliveryMap);
	}

}
