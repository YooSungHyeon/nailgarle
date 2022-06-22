package com.nailgarle01.nailgarle.service.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface ServiceController {
	public ModelAndView serviceqna(@RequestParam Map<String, String> pageMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView addQna(@RequestParam("qnaType") String qnaType, @RequestParam("qnaTitle") String qnaTitle,
			@RequestParam("productName") String productName, @RequestParam("qnaText") String qnaText,
			@RequestParam("qnaSecret") String qnaSecret, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity deleteQna(@RequestParam("memberId") String memberId, @RequestParam("qnaNum") int qnaNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView qnaAns(@RequestParam("qnaNum") int qnaNum, @RequestParam("qnaAns") String qnaAns,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public @ResponseBody String keywordSearch(@RequestParam("productName") String productName,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView selectQna(@RequestParam("memberId") String memberId, @RequestParam("qnaNum") int qnaNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void updateQna(@RequestParam("qnaNum") int qnaNum, @RequestParam("qnaType") String qnaType,
			@RequestParam("qnaTitle") String qnaTitle, @RequestParam("productName") String productName,
			@RequestParam("qnaText") String qnaText, @RequestParam("qnaSecret") String qnaSecret,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView searchQna(@RequestParam Map<String, String> pageMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
