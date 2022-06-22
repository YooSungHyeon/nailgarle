package com.nailgarle01.nailgarle.admin.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.admin.order.service.AdminOrderService;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;


@Controller("adminOrderController")
@RequestMapping(value = "/admin/order")
public class AdminOrderControllerImpl extends BaseController implements AdminOrderController {
	@Autowired
	private AdminOrderService adminOrderService;

	@RequestMapping(value = "/adminOrderMain.do", method = RequestMethod.GET)
	public ModelAndView adminOrderMain(@RequestParam(value="secNum", required = false) String secNum,@RequestParam(value="pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		if (secNum == null) {
			secNum = "1";
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		HashMap<String, Object> condMap = new HashMap<String, Object>();
		condMap.put("secNum", secNum);
		condMap.put("pageNum", pageNum);
		List<OrderVO> newOrderList = adminOrderService.listNewOrder(condMap);
		mav.addObject("newOrderList", newOrderList);
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	@Override
	@RequestMapping(value = "/modifyDeliveryState.do", method = { RequestMethod.POST })
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		adminOrderService.modifyDeliveryState(deliveryMap);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;

	}

	@Override
	@RequestMapping(value = "/orderDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderDetail(@RequestParam("order_id") int order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map orderMap = adminOrderService.orderDetail(order_id);
		mav.addObject("orderMap", orderMap);
		return mav;
	}

}
