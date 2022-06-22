package com.nailgarle01.nailgarle.admin.sales.controller;

import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.admin.sales.service.AdminSalesService;
import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Controller("adminSalesController")
@RequestMapping(value = "/admin/sales")
public class AdminSalesControllerImpl extends BaseController implements AdminSalesController{

	@Autowired
	private OrderVO orderVO;	
	@Autowired
	private AdminSalesVO adminSalesVO;
	@Autowired
	private AdminSalesService adminSalesService;
	
	@RequestMapping(value = "/adminMain.do", method = RequestMethod.GET)
	public ModelAndView adminMain(@RequestParam(value="secNum", required = false) String secNum,@RequestParam(value="pageNum", required = false) String pageNum,
			@RequestParam(value="startDate", required = false) String startDate,@RequestParam(value="endDate", required = false) String endDate,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		if (startDate == null || startDate == "n") {
			startDate = "n";
		}		
		if(endDate== null) {
			Date date = new Date();
			endDate = date.toInstant().atOffset(ZoneOffset.UTC).format( DateTimeFormatter.ofPattern("yyyy-MM-dd"));			
		}
		if (secNum == null) {
			secNum = "1";
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		adminSalesVO.setStartDate(startDate);
		adminSalesVO.setEndDate(endDate);
		adminSalesVO.setSecNum(Integer.parseInt(secNum));
		adminSalesVO.setPageNum(Integer.parseInt(pageNum));
		AdminSalesVO allSales = adminSalesService.adminAllSales(adminSalesVO);
		List<AdminSalesVO> salesList = adminSalesService.adminMainList(adminSalesVO);

		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("salesList", salesList);
		mav.addObject("allSales", allSales);
		return mav;
	}
	
	@RequestMapping(value = "/daySearch.do", method = RequestMethod.GET)
	public ModelAndView daySearch(@RequestParam("date") String date,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String secNum = "1";
		String pageNum = "1";

		adminSalesVO.setEndDate(date);
		adminSalesVO.setStartDate(date);
		AdminSalesVO allSales = adminSalesService.adminOneSales(adminSalesVO);
		List<AdminSalesVO> salesList = new ArrayList<AdminSalesVO>();
		salesList.add(allSales);
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("salesList", salesList);
		mav.addObject("allSales", allSales);
		return mav;
	}
	
}