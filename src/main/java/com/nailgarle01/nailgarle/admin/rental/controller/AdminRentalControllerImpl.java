package com.nailgarle01.nailgarle.admin.rental.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.admin.rental.service.AdminRentalService;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Controller("adminRentalController")
@RequestMapping(value = "/admin/rental")
public class AdminRentalControllerImpl extends BaseController implements AdminRentalController {

	@Autowired
	private AdminRentalService adminRentalService;
	
	@RequestMapping(value = "/adminRentalMain.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminRentalMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String secNum = dateMap.get("secNum");
		String pageNum = dateMap.get("pageNum");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (secNum == null) {
			secNum = "1";
		}
		condMap.put("secNum", secNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		ArrayList<OrderVO> rental_list = adminRentalService.listRental(condMap);
		mav.addObject("rental_list", rental_list);
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		return mav;

	}
}
