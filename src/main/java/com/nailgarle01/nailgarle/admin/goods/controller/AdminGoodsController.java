package com.nailgarle01.nailgarle.admin.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminGoodsController {
	public ModelAndView adminGoodsMain(@RequestParam(value="secNum", required = false) String secNum,@RequestParam(value="pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String selectCategory(@RequestParam("categoryNum") String categoryNum,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
