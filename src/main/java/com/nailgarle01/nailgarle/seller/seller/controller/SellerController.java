package com.nailgarle01.nailgarle.seller.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

public interface SellerController {

	public ModelAndView login(@ModelAttribute("sellerVO") SellerVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity addSeller(@ModelAttribute("sellerVO") SellerVO _sellerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView PwCheck(@RequestParam("sellerPw") String sellerPw, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity modifyMyInfo(@ModelAttribute("sellerVO") SellerVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
