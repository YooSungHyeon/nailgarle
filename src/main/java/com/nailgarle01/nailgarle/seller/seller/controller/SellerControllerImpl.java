package com.nailgarle01.nailgarle.seller.seller.controller;

import java.io.PrintWriter;

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
import com.nailgarle01.nailgarle.seller.seller.service.SellerService;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Controller("sellerController")
@RequestMapping(value = "/seller")
public class SellerControllerImpl extends BaseController implements SellerController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\nailgarle\\file_repo";
	@Autowired
	SellerService sellerService;
	@Autowired
	SellerVO sellerVO;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("sellerVO") SellerVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		sellerVO = sellerService.login(vo);
		String _n = new String("n");
		String _N = new String("N");

		if (sellerVO == null) {
			String message = "일치하는 회원이 없습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/login");

		} else if (!sellerVO.getDel_yn().equals(_n) && !sellerVO.getDel_yn().equals(_N)) {
			String message = "탈퇴한 회원입니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/login");
		} else {

			/* 비밀번호 복호화 */
			boolean pwdMatch = pwdEncoder.matches(vo.getSellerPw(), sellerVO.getSellerPw());

			if (sellerVO != null && sellerVO.getSellerId() != null && pwdMatch == true) {
				HttpSession session = request.getSession();
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("sellerInfo", sellerVO);
				mav.setViewName("redirect:/seller/goods/sellerGoodsMain.do");

			} else {
				String message = "아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.";
				mav.addObject("message", message);
				mav.setViewName("/member/login");
			}
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("sellerInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String result = sellerService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/addSeller.do", method = RequestMethod.POST)
	public ResponseEntity addSeller(@ModelAttribute("sellerVO") SellerVO _sellerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {

			/*
			 * 비밀번호 암호화 String inputPass = _memberVO.getMemberPw(); String pwd =
			 * pwdEncoder.encode(inputPass); _memberVO.setMemberPw(pwd);
			 */

			if (_sellerVO.getSellerId() == "") {
				message = "<script>";
				message += " alert('중복체크를 해주세요.');";
				message += " location.href='" + request.getContextPath() + "/member/sellerForm.do';";
				message += " </script>";
			} else if (_sellerVO.getSellerPw() == "") {
				message = "<script>";
				message += " alert('비밀번호를 입력해주세요.');";
				message += " location.href='" + request.getContextPath() + "/member/sellerForm.do';";
				message += " </script>";
			} else {
				_sellerVO.setSellerPw(pwdEncoder.encode(_sellerVO.getSellerPw()));
				sellerService.addSeller(_sellerVO);
				message = "<script>";
				message += " alert('회원가입이 완료되었습니다. 로그인창으로 이동합니다.');";
				message += " location.href='" + request.getContextPath() + "/member/login.do';";
				message += " </script>";
			}

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/member/sellerForm.do';";
			message += " </script>";
			e.printStackTrace();
		}

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/sellerPwCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mypagePwCheck(@RequestParam("seller") String seller, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session = request.getSession();
		session.setAttribute("seller", seller);
		return mav;
	}

	@Override
	@RequestMapping(value = "/PwCheck.do", method = RequestMethod.POST)
	public ModelAndView PwCheck(@RequestParam("sellerPw") String sellerPw, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session = request.getSession();

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		String sellerId = sellerVO.getSellerId();
		String seller = (String) session.getAttribute("seller");
		String update = new String("update");
		String delete = new String("delete");

		boolean pwdMatch = pwdEncoder.matches(sellerPw, sellerVO.getSellerPw());
		if (pwdMatch == true && seller.equals(update)) {
			mav.setViewName("redirect:/seller/sellerInfoUpdate.do");

		} else if (pwdMatch == true && seller.equals(delete)) {

			sellerService.deleteSeller(sellerId);
			session.removeAttribute("sellerInfo");
			session.setAttribute("sellerInfo", sellerVO);
			session.setAttribute("isLogOn", false);
			session.removeAttribute("sellerInfo");
			session.removeAttribute("seller");

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
			mav.setViewName("/seller/sellerPwCheck");
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/modifySellerInfo.do", method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@ModelAttribute("sellerVO") SellerVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		HttpSession session = request.getSession();
		sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		String sellerId = sellerVO.getSellerId();
		vo.setSellerId(sellerId);
		try {
			vo.setSellerPw(pwdEncoder.encode(vo.getSellerPw()));
			sellerVO = (SellerVO) sellerService.modifySellerInfo(vo);
			session.removeAttribute("sellerInfo");
			session.setAttribute("sellerInfo", sellerVO);
			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/seller/goods/sellerGoodsMain.do';";
			message += " </script>";
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/seller/modifySellerInfo.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
