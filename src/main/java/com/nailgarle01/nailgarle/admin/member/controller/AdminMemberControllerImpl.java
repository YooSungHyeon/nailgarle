package com.nailgarle01.nailgarle.admin.member.controller;

import java.util.ArrayList;
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

import com.nailgarle01.nailgarle.admin.member.service.AdminMemberService;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.mypage.service.MyPageService;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

@Controller("adminMemberController")
@RequestMapping(value = "/admin/member")
public class AdminMemberControllerImpl extends BaseController implements AdminMemberController {
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private SellerVO sellerVO;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	@Autowired
	private MyPageService myPageService;

	@RequestMapping(value = "/adminMemberMain.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView adminMemberMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		String secNum = dateMap.get("secNum");
		String pageNum = dateMap.get("pageNum");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (secNum == null) {
			secNum = "1";
		}
		condMap.put("secNum", secNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		ArrayList<MemberVO> member_list = adminMemberService.listMember(condMap);
		mav.addObject("member_list", member_list);
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		return mav;

	}

	@Override
	@RequestMapping(value = "/admin_memberUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_memberUpdate(@RequestParam("memberNum") int memberNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		memberVO.setMemberNum(memberNum);
		memberVO = adminMemberService.memberdetail(memberVO);
		mav.addObject("member", memberVO);

		return mav;
	}

	@Override
	@RequestMapping(value = "/admin_sellerUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView admin_sellerUpdate(@RequestParam("sellerNum") int sellerNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		sellerVO.setSellerNum(sellerNum);
		sellerVO = adminMemberService.sellerdetail(sellerVO);

		mav.addObject("seller", sellerVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/modifyMember.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity modifyMember(@ModelAttribute("MemberVO") MemberVO memberVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		HttpSession session = request.getSession();
		try {
			// memberVO.setMemberPw(pwdEncoder.encode(memberVO.getMemberPw()));
			adminMemberService.modifyMember(memberVO);
			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/member/adminMemberMain.do';";
			message += " </script>";
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/admin/member/adminMemberMain.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/modifySeller.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity modifySeller(@ModelAttribute("SellerVO") SellerVO sellerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		HttpSession session = request.getSession();
		try {
			adminMemberService.modifySeller(sellerVO);
			session.removeAttribute("sellerInfo");
			session.setAttribute("sellerInfo", sellerVO);
			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/member/adminMemberMain.do';";
			message += " </script>";
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/admin/member/adminMemberMain.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/lineupMember.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView lineupMember(@RequestParam Map<String, String> dateMap, @RequestParam("member") String member,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String list = "list";
		String secNum = dateMap.get("secNum");
		String pageNum = dateMap.get("pageNum");
		String beginDate = dateMap.get("beginDate");
		String endDate = dateMap.get("endDate");
		String search_type = dateMap.get("search_type");
		String search_keyword = dateMap.get("search_keyword");

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (secNum == null) {
			secNum = "1";
		}
		condMap.put("secNum", secNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		if (search_type.equals("전체") && search_keyword.equals("")) {
			search_type = "";
		}
		condMap.put("pageNum", pageNum);
		condMap.put("beginDate", beginDate);
		condMap.put("endDate", endDate);
		condMap.put("search_type", search_type);
		condMap.put("search_keyword", search_keyword);

		if (member.equals("일반회원")) {
			condMap.put("del_yn", "n");
			List<MemberVO> memberList = adminMemberService.lineupMember(condMap);
			mav.addObject("member_list", memberList);
			mav.addObject("memberType", "일반회원");
		} else if (member.equals("탈퇴회원")) {
			condMap.put("del_yn", "y");
			List<MemberVO> memberList = adminMemberService.lineupMember(condMap);
			mav.addObject("member_list", memberList);
			mav.addObject("memberType", "탈퇴회원");
		} else if (member.equals("사업자회원")) {
			condMap.put("del_yn", "n");
			List<MemberVO> memberList = adminMemberService.sellerMember(condMap);
			mav.addObject("member_list", memberList);
			mav.addObject("memberType", "사업자회원");
		} else if (member.equals("탈퇴사업자")) {
			condMap.put("del_yn", "y");
			List<MemberVO> memberList = adminMemberService.sellerMember(condMap);
			mav.addObject("member_list", memberList);
			mav.addObject("memberType", "탈퇴사업자");
		}
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("beginDate", beginDate);
		mav.addObject("endDate", endDate);
		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.addObject("search_type", search_type);
		mav.addObject("search_keyword", search_keyword);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/update_Member.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView update_Member(@RequestParam("memberNum") int memberNum, @RequestParam("del_yn") String del_yn,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		memberVO.setMemberNum(memberNum);
		memberVO.setDel_yn(del_yn);
		adminMemberService.updateMember(memberVO);

		mav.setViewName("redirect:/admin/member/adminMemberMain.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/update_Seller.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView update_Seller(@RequestParam("sellerNum") int sellerNum, @RequestParam("del_yn") String del_yn,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		sellerVO.setSellerNum(sellerNum);
		sellerVO.setDel_yn(del_yn);
		adminMemberService.updateSeller(sellerVO);

		mav.setViewName("redirect:/admin/member/adminMemberMain.do");
		return mav;
	}

}