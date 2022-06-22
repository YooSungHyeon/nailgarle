package com.nailgarle01.nailgarle.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.service.GoodsService;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;


@Controller("mainController")
public class MainController extends BaseController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "/main/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		Map<String, String> p_categoryMap =  new HashMap<String, String>();
		Map<String, List<GoodsVO>> goodsMap = goodsService.MainListGoods(p_categoryMap);
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}	
	
	@RequestMapping(value = "/*/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value = "/*/*/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
}
