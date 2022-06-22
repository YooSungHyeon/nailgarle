package com.nailgarle01.nailgarle.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;

public interface BoardController {
	public ModelAndView reviewboard(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public @ResponseBody String keywordSearch(@RequestParam("productName") String productName,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView reviewArticle(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deleteReview(@RequestParam("reviewNum") int reviewNum,
			@RequestParam(required = false) String re_fileName, @RequestParam("productNum") int productNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String addComment(@RequestParam("reviewNum") int reviewNum, @RequestParam("comment") String comment,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redicrectAttributes)
			throws Exception;

	public String deleteComment(@RequestParam("reviewNum") int reviewNum, @RequestParam("commentNum") int commentNum,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception;

	public ModelAndView modifyArticle(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public void updateArticle(@RequestParam("reviewNum") int reviewNum, @RequestParam("re_Star") String re_Star,
			@RequestParam("re_Title") String re_Title, @RequestParam("re_Text") String re_Text,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception;

	public void newPlan(@RequestParam("Pl_Title") String Pl_Title, @RequestParam("Pl_Date1") String Pl_Date1,
			@RequestParam("Pl_Date2") String Pl_Date2, @RequestParam("Pl_Place") String Pl_Place,
			@RequestParam("Pl_Text") String Pl_Text, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView planboard(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView selectPlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView deletePlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView modifyPlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public void updatePlan(@ModelAttribute("PlanBoardVO") PlanBoardVO planboardVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView search_plan(@RequestParam Map<String, String> searchword, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView search_review(@RequestParam Map<String, String> searchword, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}