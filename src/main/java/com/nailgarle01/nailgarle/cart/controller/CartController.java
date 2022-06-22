package com.nailgarle01.nailgarle.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id, @RequestParam("goods_id") int cart_goods_qty,@RequestParam("option") String option, @RequestParam("option2") String option2, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView removeCartGood(@RequestParam("cart_id") int cart_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}