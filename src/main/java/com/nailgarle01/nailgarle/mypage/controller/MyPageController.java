package com.nailgarle01.nailgarle.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;

public interface MyPageController {
	public ModelAndView myPageMain(@RequestParam(required = false, value = "message") String message,
			@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView PwCheck(@RequestParam("memberPw") String memberPw, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity modifyMyInfo(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView myPagePoint(@RequestParam(required = false, value = "message") String message,
			@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView mypageOrderList(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView cancelMyOrder(@RequestParam("orderNum") String orderNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView proReturnExchange(@RequestParam("orderNum") int orderNum,
			@RequestParam("productNum") int productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView productReturn(@ModelAttribute("OderVO") OrderVO orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView productExchange(@ModelAttribute("OrderVO") OrderVO orderVO,
			@RequestParam("option1") String option1, @RequestParam("option2") String option2,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

}
