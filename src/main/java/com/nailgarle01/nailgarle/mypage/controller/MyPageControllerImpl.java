package com.nailgarle01.nailgarle.mypage.controller;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.mypage.service.MyPageService;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.order.vo.PointVO;

@Controller("myPageController")
@RequestMapping(value = "/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController {
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@Override
	@RequestMapping(value = "/mypageMain.do", method = RequestMethod.GET)
	public ModelAndView myPageMain(@RequestParam(required = false, value = "message") String message,
			@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String searchType = dateMap.get("searchType");
		String keyword = dateMap.get("keyword");

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		int memberNum = memberVO.getMemberNum();

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		condMap.put("memberNum", memberNum);
		condMap.put("searchType", searchType);
		condMap.put("keyword", keyword);

		List<OrderVO> myOrderList = myPageService.listMyOrderProduct(condMap);

		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);

		return mav;
	}

	@RequestMapping(value = "/mypagePwCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypagePwCheck(@RequestParam("my") String my, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session = request.getSession();
		session.setAttribute("my", my);
		return mav;
	}

	@Override
	@RequestMapping(value = "/PwCheck.do", method = RequestMethod.POST)
	public ModelAndView PwCheck(@RequestParam("memberPw") String memberPw, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session = request.getSession();

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		String my = (String) session.getAttribute("my");
		String update = new String("update");
		String delete = new String("delete");

		boolean pwdMatch = pwdEncoder.matches(memberPw, memberVO.getMemberPw());
		if (pwdMatch == true && my.equals(update)) {
			mav.setViewName("redirect:/mypage/mypageUpdate.do");

		} else if (pwdMatch == true && my.equals(delete)) {

			myPageService.deleteMember(memberId);
			session.removeAttribute("memberInfo");
			session.setAttribute("memberInfo", memberVO);
			session.setAttribute("isLogOn", false);
			session.removeAttribute("memberInfo");
			session.removeAttribute("my");

			out.println("<script>");
			out.println("alert('회원이 탈퇴되었습니다.')");
			out.println("location.href='" + request.getContextPath() + "/main/main.do'");
			out.println("</script>");
			out.flush();

			/*
			 * String message = "회원이 탈퇴되었습니다."; mav.addObject("message", message);
			 * mav.setViewName("redirect:/main/main.do");
			 */

		} else {
			String message = "비밀번호가 틀립니다. 다시 입력 해주세요.";
			mav.addObject("message", message);
			mav.setViewName("/mypage/mypagePwCheck");
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/modifyMyInfo.do", method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		vo.setMemberId(memberId);
		try {
			vo.setMemberPw(pwdEncoder.encode(vo.getMemberPw()));
			memberVO = (MemberVO) myPageService.modifyMyInfo(vo);
			session.removeAttribute("memberInfo");
			session.setAttribute("memberInfo", memberVO);
			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage/mypageMain.do';";
			message += " </script>";
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/mypage/modifyMyInfo.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/mypagePoint.do", method = RequestMethod.GET)
	public ModelAndView myPagePoint(@RequestParam(required = false, value = "message") String message,
			@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String beginDate = dateMap.get("beginDate");
		String endDate = dateMap.get("endDate");
		String searchType = dateMap.get("searchType");
		String keyword = dateMap.get("keyword");

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		int memberNum = memberVO.getMemberNum();

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		condMap.put("memberNum", memberNum);
		condMap.put("beginDate", beginDate);
		condMap.put("endDate", endDate);
		condMap.put("searchType", searchType);
		condMap.put("keyword", keyword);

		List<PointVO> myPointList = myPageService.listMyPoint(condMap);

		mav.addObject("message", message);
		mav.addObject("myPointList", myPointList);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("beginDate", beginDate);
		mav.addObject("endDate", endDate);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);

		return mav;
	}

	@Override
	@RequestMapping(value = "/mypageOrderList.do", method = RequestMethod.GET)
	public ModelAndView mypageOrderList(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();

		String section = dateMap.get("section");
		String pageNum = dateMap.get("pageNum");
		String beginDate = dateMap.get("beginDate");
		String endDate = dateMap.get("endDate");
		String searchType = dateMap.get("searchType");
		String keyword = dateMap.get("keyword");

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		int memberNum = memberVO.getMemberNum();

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		condMap.put("memberNum", memberNum);
		condMap.put("beginDate", beginDate);
		condMap.put("endDate", endDate);
		condMap.put("searchType", searchType);
		condMap.put("keyword", keyword);

		List<OrderVO> myOrderList = myPageService.mypageOrderList(condMap);

		mav.addObject("myOrderList", myOrderList);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("beginDate", beginDate);
		mav.addObject("endDate", endDate);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);

		return mav;
	}

	@Override
	@RequestMapping(value = "/cancelMyOrder.do", method = RequestMethod.POST)
	public ModelAndView cancelMyOrder(@RequestParam("orderNum") String orderNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.cancelOrder(orderNum);

		mav.setViewName("redirect:/mypage/mypageOrderList.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/proReturnExchange.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView proReturnExchange(@RequestParam("orderNum") int orderNum,
			@RequestParam("productNum") int productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		OrderVO orderVO = new OrderVO();
		GoodsVO goodsVO = new GoodsVO();
		orderVO.setOrderNum(orderNum);
		orderVO = myPageService.selectProduct(orderVO);
		goodsVO.setProductNum(productNum);
		goodsVO = myPageService.selectOption(goodsVO);
		String option1 = goodsVO.getProductOption();
		String option2 = goodsVO.getProductOption2();
		String orginOpt = orderVO.getProductOption();
		int productsStock = goodsVO.getProductsStock();
		int mainNum = goodsVO.getP_mainNum();
		List<String> optionlist = null;
		List<String> optionlist2 = null;
		List<String> optionlist3 = null;
		if (!option1.equals("n")) {
			String[] str = option1.split("/");
			optionlist = Arrays.asList(str);
		}
		if (!option2.equals("n")) {
			String[] str2 = option2.split("/");
			optionlist2 = Arrays.asList(str2);
		}
		if (orginOpt.equals("n")) {
			String orginOpt1 = "-";
			String orginOpt2 = "-";

			mav.addObject("orginOpt1", orginOpt1);
			mav.addObject("orginOpt2", orginOpt2);
		} else if (orginOpt.indexOf("/") == -1) {
			String orginOpt1 = orderVO.getProductOption();
			String orginOpt2 = "-";

			mav.addObject("orginOpt1", orginOpt1);
			mav.addObject("orginOpt2", orginOpt2);
		} else if (!orginOpt.equals("n")) {
			String[] str3 = orginOpt.split("/");
			optionlist3 = Arrays.asList(str3);
			String orginOpt1 = optionlist3.get(0);
			String orginOpt2 = optionlist3.get(1);

			mav.addObject("orginOpt1", orginOpt1);
			mav.addObject("orginOpt2", orginOpt2);
		}
		if (mainNum == 6) {
			viewName = "/goods/rentaldetail";
		}
		mav.addObject("optionlist", optionlist);
		mav.addObject("optionlist2", optionlist2);
		mav.addObject("productsStock", productsStock);
		mav.addObject(orderVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/productReturn.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productReturn(@ModelAttribute("OderVO") OrderVO orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		if (orderVO.getReturn_Option().equals("직접입력")) {
			String return_Option = "반품";
			orderVO.setReturn_Option(return_Option);
		}

		myPageService.productReturn(orderVO);

		return mav;
	}

	@Override
	@RequestMapping(value = "/productExchange.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView productExchange(@ModelAttribute("OrderVO") OrderVO orderVO,
			@RequestParam("option1") String option1, @RequestParam("option2") String option2,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String productOption = option1 + "/" + option2;
		orderVO.setProductOption(productOption);

		if (orderVO.getExchange_Option().equals("직접입력")) {
			String exchange_Option = "교환";
			orderVO.setExchange_Option(exchange_Option);
		}

		myPageService.productExchange(orderVO);

		return mav;
	}
}
