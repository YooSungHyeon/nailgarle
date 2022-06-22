package com.nailgarle01.nailgarle.board.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nailgarle01.nailgarle.board.service.BoardService;
import com.nailgarle01.nailgarle.board.vo.CommentVO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.service.service.ServiceService;

import net.sf.json.JSONObject;

@Controller("boardController")
@RequestMapping(value = "/board")
public class BoardControllerImpl extends BaseController implements BoardController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\nailgarle\\file_repo";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ServiceService serviceService;
	@Autowired
	private ReviewBoardVO reviewboardVO;
	@Autowired
	private ReviewImageVO reviewimageVO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CommentVO commentVO;
	@Autowired
	private PlanBoardVO planboardVO;

	@Override
	@RequestMapping(value = "/reviewboard.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reviewboard(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
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

		Map<String, List<ReviewBoardVO>> reviewMap = boardService.reviewList(condMap);
		mav.addObject("reviewList", reviewMap);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("review", "review");

		return mav;

	}

	@Override
	@RequestMapping(value = "addReview.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity addReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName = null;
		UUID uuid = UUID.randomUUID();

		Map newreviewMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newreviewMap.put(name, value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		Integer memberNum = memberVO.getMemberNum();
		String to = Integer.toString(memberNum);
		newreviewMap.put("memberNum", memberNum);
		newreviewMap.put("memberId", memberId);

		List<ReviewImageVO> imageFileList = reviewUpload(multipartRequest);
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ReviewImageVO reviewimageVO : imageFileList) {
				reviewimageVO.setMemberId(memberId);
			}
			newreviewMap.put("imageFileList", imageFileList);
		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			int productNum = boardService.addReview(newreviewMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ReviewImageVO reviewimageVO : imageFileList) {
					imageFileName = reviewimageVO.getRe_fileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "review_image" + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('리뷰를 등록했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/reviewboard.do';";
			message += "</script>";
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ReviewImageVO reviewimageVO : imageFileList) {
					imageFileName = reviewimageVO.getRe_fileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += " alert('오류가 발생했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/reviewboard.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String keywordSearch(@RequestParam("productName") String productName,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if (productName == null || productName.equals(""))
			return null;

		productName = productName.toUpperCase();
		List<String> keywordList = serviceService.keywordSearch(productName);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("productName", keywordList);

		String jsonInfo = jsonObject.toString();
		return jsonInfo;
	}

	@Override
	@RequestMapping(value = "/reviewArticle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewArticle(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ReviewBoardVO reviewboardVO = new ReviewBoardVO();
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");

		reviewboardVO.setReviewNum(reviewNum);
		Map<String, List<ReviewImageVO>> reviewimageVO2 = boardService.selectImage(reviewboardVO);

		commentVO.setReviewNum(reviewNum);
		Map<String, List<CommentVO>> commentMap = boardService.selectComment(commentVO);

		reviewboardVO.setReviewNum(reviewNum);
		reviewboardVO = boardService.reviewArticle(reviewboardVO);
		mav.addObject("reviewImage", reviewimageVO2);
		mav.addObject("reviewArticle", reviewboardVO);
		mav.addObject("commentList", commentMap);

		return mav;
	}

	@Override
	@RequestMapping(value = "/deleteReview.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteReview(@RequestParam("reviewNum") int reviewNum,
			@RequestParam(required = false) String re_fileName, @RequestParam("productNum") int productNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		ModelAndView mav = new ModelAndView();
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + "review_image" + "\\" + productNum + "\\" + re_fileName);

		if (file.exists()) {
			file.delete();
		}

		reviewboardVO.setReviewNum(reviewNum);
		boardService.deleteReview(reviewboardVO);
		
		if(memberVO.getMemberId().equals("admin")) {
			mav.setViewName("redirect://admin/board/adminNoticeBoard.do");
		}else if(!(memberVO.getMemberId().equals("admin"))) {
			mav.setViewName("redirect://board/reviewboard.do");
		}
		return mav;

	}

	@Override
	@RequestMapping(value = "/addComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addComment(@RequestParam("reviewNum") int reviewNum, @RequestParam("comment") String comment,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redicrectAttributes)
			throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		int memberNum = memberVO.getMemberNum();

		reviewboardVO.setMemberId(memberId);
		reviewboardVO.setMemberNum(memberNum);
		reviewboardVO.setComment(comment);
		reviewboardVO.setReviewNum(reviewNum);

		boardService.addComment(reviewboardVO);

		redicrectAttributes.addAttribute("reviewNum", reviewNum);
		return "redirect:/board/reviewArticle.do";
	}

	@Override
	@RequestMapping(value = "/deleteComment.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteComment(@RequestParam("reviewNum") int reviewNum, @RequestParam("commentNum") int commentNum,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {

		commentVO.setReviewNum(reviewNum);
		commentVO.setCommentNum(commentNum);
		boardService.deleteOneComment(commentVO);

		redirectAttributes.addAttribute("reviewNum", reviewNum);
		return "redirect:/board/reviewArticle.do";

	}

	@Override
	@RequestMapping(value = "/modifyArticle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modifyArticle(@RequestParam("reviewNum") int reviewNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		reviewboardVO.setReviewNum(reviewNum);
		Map<String, List<ReviewImageVO>> reviewimageVO2 = boardService.selectImage(reviewboardVO);

		reviewboardVO.setReviewNum(reviewNum);
		reviewboardVO = boardService.reviewArticle(reviewboardVO);

		mav.addObject("reviewImage", reviewimageVO2);
		mav.addObject("reviewArticle", reviewboardVO);

		return mav;
	}

	@Override
	@RequestMapping(value = "/updateArticle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void updateArticle(@RequestParam("reviewNum") int reviewNum, @RequestParam("re_Star") String re_Star,
			@RequestParam("re_Title") String re_Title, @RequestParam("re_Text") String re_Text,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");

		reviewboardVO.setReviewNum(reviewNum);
		reviewboardVO.setRe_Title(re_Title);
		reviewboardVO.setRe_Text(re_Text);
		reviewboardVO.setRe_Star(re_Star);

		boardService.updateArticle(reviewboardVO);

		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정이 완료되었습니다');");
		out.println("location.href='" + request.getContextPath() + "/board/reviewboard.do'");
		out.println("</script>");
		out.flush();

	}

	@Override
	@RequestMapping(value = "/newPlan.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void newPlan(@RequestParam("Pl_Title") String Pl_Title, @RequestParam("Pl_Date1") String Pl_Date1,
			@RequestParam("Pl_Date2") String Pl_Date2, @RequestParam("Pl_Place") String Pl_Place,
			@RequestParam("Pl_Text") String Pl_Text, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// mav.setViewName("redirect:/board/planboard.do");
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		int memberNum = memberVO.getMemberNum();
		String boardType = "일정게시판";

		planboardVO.setMemberId(memberId);
		planboardVO.setMemberNum(memberNum);
		planboardVO.setBoardType(boardType);
		planboardVO.setPl_Title(Pl_Title);
		planboardVO.setPl_Date1(Pl_Date1);
		planboardVO.setPl_Date2(Pl_Date2);
		planboardVO.setPl_Place(Pl_Place);
		planboardVO.setPl_Text(Pl_Text);

		boardService.newPlan(planboardVO);

		return;
	}

	@Override
	@RequestMapping(value = "/planboard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView planboard(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
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

		Map<String, List<PlanBoardVO>> planMap = boardService.planList(condMap);
		mav.addObject("planList", planMap);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("plan", "planlist");

		return mav;
	}

	@Override
	@RequestMapping(value = "/selectPlan.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectPlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		planboardVO.setPlanNum(planNum);
		planboardVO = boardService.selectPlan(planboardVO);
		mav.addObject("Plan", planboardVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/deletePlan.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deletePlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		ModelAndView mav = new ModelAndView();
		planboardVO.setPlanNum(planNum);
		boardService.deletePlan(planboardVO);
		
		if(memberVO.getMemberId().equals("admin")) {
			mav.setViewName("redirect://admin/board/adminNoticeBoard.do");
		}else if(!(memberVO.getMemberId().equals("admin"))) {
			mav.setViewName("redirect://board/planboard.do");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/modifyPlan.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modifyPlan(@RequestParam("planNum") int planNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		planboardVO.setPlanNum(planNum);
		planboardVO = boardService.selectPlan(planboardVO);
		mav.addObject("Plan", planboardVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/updatePlan.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void updatePlan(@ModelAttribute("PlanBoardVO") PlanBoardVO planboardVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		boardService.updatePlan(planboardVO);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('수정이 완료되었습니다');");
		out.println("location.href='" + request.getContextPath() + "/board/planboard.do'");
		out.println("</script>");
		out.flush();
	}

	@Override
	@RequestMapping(value = "/search_plan.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView search_plan(@RequestParam Map<String, String> searchword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String section = searchword.get("section");
		String pageNum = searchword.get("pageNum");
		String search_keyword = searchword.get("search_keyword");
		Map<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		Map<String, List<PlanBoardVO>> planMap = boardService.searchPlan(searchword);
		mav.addObject("planList", planMap);
		mav.addObject("section", section);
		mav.addObject("search_keyword", search_keyword);
		mav.addObject("pageNum", pageNum);
		return mav;
	}

	@Override
	@RequestMapping(value = "/search_review.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView search_review(@RequestParam Map<String, String> searchword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String section = searchword.get("section");
		String pageNum = searchword.get("pageNum");
		String search_keyword = searchword.get("search_keyword");
		if (section == null) {
			section = "1";
		}
		searchword.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		searchword.put("pageNum", pageNum);
		Map<String, List<ReviewBoardVO>> reviewMap = boardService.searchReview(searchword);
		mav.addObject("search_keyword", search_keyword);
		mav.addObject("reviewList", reviewMap);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
}