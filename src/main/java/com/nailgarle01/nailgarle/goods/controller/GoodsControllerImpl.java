package com.nailgarle01.nailgarle.goods.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.service.GoodsService;
import com.nailgarle01.nailgarle.goods.vo.CategoryVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;

import net.sf.json.JSONObject;

@Controller("goodsController")
@RequestMapping(value = "/goods")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	@Autowired
	private GoodsService goodsService;

	@Override
	@RequestMapping(value = "/GoodsList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(@RequestParam(value="selectSort", required = false) String selectSort, @RequestParam(value="p_subNum", required = false) String p_subNum,
			@RequestParam("p_mainNum") String p_mainNum, @RequestParam(value="section", required = false) String section,@RequestParam(value="pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		Map<String, String> p_categoryMap =  new HashMap<String, String>();
		if(section==null && pageNum ==null) {
			section="1";
			pageNum="1";
		}
		if(p_subNum==null) {
			p_subNum="not_select";
		}
		p_categoryMap.put("p_mainNum", p_mainNum);
		p_categoryMap.put("p_subNum", p_subNum);
		p_categoryMap.put("section", section);
		p_categoryMap.put("pageNum", pageNum);
		p_categoryMap.put("selectSort", selectSort);
		Map<String, List<GoodsVO>> goodsMap = goodsService.listGoods(p_categoryMap);
		int allAmount =  goodsService.listGoodsCount(p_categoryMap);
		int lastPage = (int) Math.ceil(allAmount*1.0 / 16); 

		mav.addObject("lastPage", lastPage);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("selectSort", selectSort);
		mav.addObject("p_mainNum", p_mainNum);
		mav.addObject("p_subNum", p_subNum);
		mav.addObject("allAmount", allAmount);
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@RequestMapping(value = "/productdetail.do", method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map goodsMap = goodsService.goodsDetail(productNum);
		GoodsVO goodsVO = (GoodsVO)goodsMap.get("goodsVO");
		String option = goodsVO.getProductOption();
		String option2 = goodsVO.getProductOption2();
		int mainNum= goodsVO.getP_mainNum();
		List<String> optionlist=null;
		List<String> optionlist2=null;
		if(!option.equals("n")) {
			String[] str= option.split("/");
			optionlist = Arrays.asList(str);
		}
		if(!option2.equals("n")) {
			String[] str2= option2.split("/");
			optionlist2 = Arrays.asList(str2);
		}
		if(mainNum==6) {
			viewName="/goods/rentaldetail";
		}
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("optionlist", optionlist);
		mav.addObject("optionlist2", optionlist2);
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	

	@RequestMapping(value = "/searchGoods.do", method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord, @RequestParam(value="p_mainNum", required = false) String p_mainNum,  
			HttpServletRequest request,	HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, String> searchMap =  new HashMap<String, String>();
		searchMap.put("searchWord", searchWord);
		searchMap.put("p_mainNum", p_mainNum);
		List<GoodsVO> goodsList = goodsService.searchGoods(searchMap);
		List<CategoryVO> goodsCount = goodsService.searchGoodsCount(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("searchWord", searchWord);
		mav.addObject("p_mainNum", p_mainNum);
		mav.addObject("goodsCount", goodsCount);
		mav.addObject("goodsList", goodsList);
		return mav;

	}
	
	
}
