package com.nailgarle01.nailgarle.seller.goods.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface SellerGoodsController {

	public ModelAndView sellerGoodsMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public @ResponseBody String selectCategory(@RequestParam("categoryNum") String categoryNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView modifyGoodsForm(@RequestParam("productNum") int productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity modifyGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView deleteGoods(@RequestParam("productNum") int productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
