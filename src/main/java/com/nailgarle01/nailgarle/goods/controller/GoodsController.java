package com.nailgarle01.nailgarle.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {
	public ModelAndView main(@RequestParam(value = "selectSort", required = false) String selectSort,@RequestParam("p_subNum") String p_subNum,@RequestParam("p_mainNum") String p_mainNum,@RequestParam(value="section", required = false) String section,@RequestParam(value="pageNum", required = false) String pageNum, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord, @RequestParam("p_mainNum") String p_mainNum,  
			HttpServletRequest request,	HttpServletResponse response) throws Exception;
}
