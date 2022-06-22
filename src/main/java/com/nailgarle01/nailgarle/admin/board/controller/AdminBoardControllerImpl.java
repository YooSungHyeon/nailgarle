package com.nailgarle01.nailgarle.admin.board.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.admin.board.service.AdminBoardService;
import com.nailgarle01.nailgarle.board.vo.CommentVO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;
import com.nailgarle01.nailgarle.common.base.BaseController;

@Controller("adminBoardController")
@RequestMapping(value = "/admin/board")
public class AdminBoardControllerImpl extends BaseController implements AdminBoardController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\nailgarle\\file_repo";
	@Autowired
	private ReviewBoardVO reviewboardVO;
	@Autowired
	private PlanBoardVO planboardVO;
	@Autowired
	private CommentVO commentVO;
	@Autowired
	private ReviewImageVO reviewimageVO;
	@Autowired
	private AdminBoardService adminBoardService;

	@Override
	@RequestMapping(value = "/adminNoticeBoard.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminNoticeBoard(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");

		Map<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);

		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);

		Map<String, List<PlanBoardVO>> planMap = adminBoardService.planList();
		Map<String, List<ReviewBoardVO>> reviewMap = adminBoardService.reviewList();
		mav.addObject("reviewList", reviewMap);
		mav.addObject("planList", planMap);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("boardType", "일정게시판");
		mav.addObject("controller", "adminNoticeBoard");

		return mav;

	}

	@Override
	@RequestMapping(value = "/deletePlan.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deletePlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		planboardVO.setPlanNum(planNum);
		adminBoardService.deletePlan(planboardVO);

		mav.setViewName("redirect:/admin/board/adminNoticeBoard.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/deleteReview.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deleteReview(@RequestParam("reviewNum") int reviewNum,
			@RequestParam("productNum") int productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		reviewimageVO = adminBoardService.reviewImage(reviewNum);
		String re_fileName = reviewimageVO.getRe_fileName();
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + "review_image" + "\\" + productNum + "\\" + re_fileName);

		if (file.exists()) {
			file.delete();
		}
		reviewboardVO.setReviewNum(reviewNum);
		adminBoardService.deleteReview(reviewboardVO);

		mav.setViewName("redirect:/admin/board/adminNoticeBoard.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/search_keyword.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView search_keyword(@RequestParam Map<String, String> wordMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

		String search_type = wordMap.get("search_type");
		String search_keyword = wordMap.get("search_keyword");
		String board_tab = wordMap.get("board_tab");
		String section = wordMap.get("section");
		String pageNum = wordMap.get("pageNum");

		if (section == null) {
			section = "1";
		}
		wordMap.put("section", section);

		if (pageNum == null) {
			pageNum = "1";
		}
		wordMap.put("pageNum", pageNum);

		if (search_type.equals("전체") && search_keyword.equals("")) {
			search_type = "";
		}
		wordMap.put("search_type", search_type);
		wordMap.put("search_keyword", search_keyword);
		if (board_tab.equals("일정 게시판") && !search_type.equals("상품명")) {
			Map<String, List<PlanBoardVO>> planMap = adminBoardService.findPlan(wordMap);
			mav.addObject("planList", planMap);
			mav.addObject("boardType", "일정 게시판");
		} else if (board_tab.equals("리뷰 게시판")) {
			Map<String, List<ReviewBoardVO>> reviewMap = adminBoardService.findReview(wordMap);
			mav.addObject("reviewList", reviewMap);
			mav.addObject("boardType", "리뷰 게시판");
		}
		mav.addObject("search_keyword", search_keyword);
		mav.addObject("search_type", search_type);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("controller", "search_keyword");
		mav.setViewName(viewName);
		return mav;
	}

}
