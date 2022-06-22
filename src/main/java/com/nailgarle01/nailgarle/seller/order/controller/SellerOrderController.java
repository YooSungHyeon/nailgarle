package com.nailgarle01.nailgarle.seller.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface SellerOrderController {

	public ModelAndView SellerOrderMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
