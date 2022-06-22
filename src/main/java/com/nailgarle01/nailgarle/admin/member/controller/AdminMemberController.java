package com.nailgarle01.nailgarle.admin.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

public interface AdminMemberController {
	public ModelAndView adminMemberMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView admin_memberUpdate(@RequestParam("memberNum") int memberNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView admin_sellerUpdate(@RequestParam("sellerNum") int sellerNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity modifyMember(@ModelAttribute("MemberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ResponseEntity modifySeller(@ModelAttribute("SellerVO") SellerVO sellerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView lineupMember(@RequestParam Map<String, String> dateMap, @RequestParam("member") String member,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView update_Member(@RequestParam("memberNum") int memberNum, @RequestParam("del_yn") String del_yn,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView update_Seller(@RequestParam("sellerNum") int sellerNum, @RequestParam("del_yn") String del_yn,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
