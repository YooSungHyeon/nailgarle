package com.nailgarle01.nailgarle.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.member.vo.MemberVO;

public interface MemberController {

	public ModelAndView login(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView findPw(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity pwFind(@RequestParam("memberId") String memberId,
			@RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView findId(@RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity idFind(@RequestParam("memberName") String memberName,
			@RequestParam("memberEmail") String memberEmail, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView updatePw(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
