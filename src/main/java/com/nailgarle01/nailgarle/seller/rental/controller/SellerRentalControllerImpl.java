package com.nailgarle01.nailgarle.seller.rental.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.seller.rental.service.SellerRentalService;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Controller("sellerRentalController")
@RequestMapping(value = "/seller/rental")
public class SellerRentalControllerImpl extends BaseController implements SellerRentalController {
	@Autowired
	private SellerRentalService sellerRentalService;
	@Autowired
	private SellerVO sellerVO;

	@Override
	@RequestMapping(value = "/sellerRentalMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView SellerRentalMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();
		
		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");

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

		ArrayList<OrderVO> rental_list = sellerRentalService.rentalList(condMap);

		mav.addObject("rental_list", rental_list);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);

		return mav;
	}

}
