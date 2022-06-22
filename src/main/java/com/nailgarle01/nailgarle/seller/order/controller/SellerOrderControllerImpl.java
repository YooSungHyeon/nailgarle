package com.nailgarle01.nailgarle.seller.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.seller.order.service.SellerOrderService;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Controller("sellerOrderController")
@RequestMapping(value = "/seller/order")
public class SellerOrderControllerImpl extends BaseController implements SellerOrderController {
	@Autowired
	private SellerOrderService sellerOrderService;
	@Autowired
	private SellerVO sellerVO;

	@Override
	@RequestMapping(value = "/sellerOrderMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView SellerOrderMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String beginDate = dateMap.get("beginDate");
		String endDate = dateMap.get("endDate");
		String searchType = dateMap.get("searchType");
		String keyword = dateMap.get("keyword");

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		int sellerNum = sellerVO.getSellerNum();

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}

		condMap.put("pageNum", pageNum);
		condMap.put("sellerNum", sellerNum);
		condMap.put("beginDate", beginDate);
		condMap.put("endDate", endDate);
		condMap.put("searchType", searchType);
		condMap.put("keyword", keyword);

		List<OrderVO> newOrderList = sellerOrderService.listNewOrder(condMap);

		mav.addObject("newOrderList", newOrderList);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("beginDate", beginDate);
		mav.addObject("endDate", endDate);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);

		return mav;
	}

	@Override
	@RequestMapping(value = "/modifyDeliveryState.do", method = { RequestMethod.POST })
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deliveryState = deliveryMap.get("deliveryState");
		if (deliveryState.equals("주문취소")) {
			deliveryState = "주문취소완료";
			deliveryMap.put("deliveryState", deliveryState);
		} else if (deliveryState.equals("반품접수중")) {
			deliveryState = "반품처리완료";
			deliveryMap.put("deliveryState", deliveryState);
		} else if (deliveryState.equals("교환접수중")) {
			deliveryState = "교환처리완료";
			deliveryMap.put("deliveryState", deliveryState);
		}
		sellerOrderService.modifyDeliveryState(deliveryMap);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
