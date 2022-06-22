package com.nailgarle01.nailgarle.admin.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface AdminBoardController {
	public ModelAndView adminNoticeBoard(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deletePlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deleteReview(@RequestParam("reviewNum") int reviewNum,
			@RequestParam("productNum") int productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView search_keyword(@RequestParam Map<String, String> wordMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
