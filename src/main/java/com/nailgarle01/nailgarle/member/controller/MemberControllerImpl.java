package com.nailgarle01.nailgarle.member.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.member.service.MemberService;
import com.nailgarle01.nailgarle.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value = "/member")
public class MemberControllerImpl extends BaseController implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	@Autowired
	private JavaMailSender mailSender;

	final static Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);

	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(vo);
		String _n = new String("n");
		String _N = new String("N");

		if (memberVO == null) {
			String message = "일치하는 회원이 없습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/login");

		} else if (!memberVO.getDel_yn().equals(_n) && !memberVO.getDel_yn().equals(_N)) {
			String message = "탈퇴한 회원입니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/login");
		} else {

			/* 비밀번호 복호화 */
			boolean pwdMatch = pwdEncoder.matches(vo.getMemberPw(), memberVO.getMemberPw());

			if (memberVO != null && memberVO.getMemberId() != null && pwdMatch == true) {
				HttpSession session = request.getSession();
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("memberInfo", memberVO);
				mav.setViewName("redirect:/main/main.do");

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
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request,
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

			if (_memberVO.getMemberId() == "") {
				message = "<script>";
				message += " alert('중복체크를 해주세요.');";
				message += " location.href='" + request.getContextPath() + "/member/memberForm.do';";
				message += " </script>";
			} else if (_memberVO.getMemberPw() == "") {
				message = "<script>";
				message += " alert('비밀번호를 입력해주세요.');";
				message += " location.href='" + request.getContextPath() + "/member/memberForm.do';";
				message += " </script>";
			} else {
				_memberVO.setMemberPw(pwdEncoder.encode(_memberVO.getMemberPw()));
				memberService.addMember(_memberVO);
				message = "<script>";
				message += " alert('회원가입이 완료되었습니다. 로그인창으로 이동합니다.');";
				message += " location.href='" + request.getContextPath() + "/member/login.do';";
				message += " </script>";
			}

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/member/memberForm.do';";
			message += " </script>";
			e.printStackTrace();
		}

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	// 비밀번호 찾기 아이디, 이름, 이메일주소 회원 매칭
	@Override
	@RequestMapping(value = "/idFind.do", method = RequestMethod.POST)
	public ResponseEntity idFind(@RequestParam("memberName") String memberName,
			@RequestParam("memberEmail") String memberEmail, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ResponseEntity resEntity = null;
		String[] email = memberEmail.split("@");
		String memberEmail1 = email[0];
		String memberEmail2 = email[1];

		/*
		 * if (memberId.equals("findId")) { memberVO.setMemberName(memberName);
		 * memberVO.setMemberEmail1(memberEmail1);
		 * memberVO.setMemberEmail2(memberEmail2);
		 * System.out.println("+++++++++++++++++++++"+ memberId);
		 * 
		 * String result = memberService.memberFind(memberVO); resEntity = new
		 * ResponseEntity(result, HttpStatus.OK);
		 * 
		 * } else {
		 */

		memberVO.setMemberName(memberName);
		memberVO.setMemberEmail1(memberEmail1);
		memberVO.setMemberEmail2(memberEmail2);

		String result = memberService.idFind(memberVO);
		resEntity = new ResponseEntity(result, HttpStatus.OK);

		return resEntity;
	}

	// 비밀번호 찾기 아이디, 이름, 이메일주소 회원 매칭
	@Override
	@RequestMapping(value = "/pwFind.do", method = RequestMethod.POST)
	public ResponseEntity pwFind(@RequestParam("memberId") String memberId,
			@RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		ResponseEntity resEntity = null;
		String[] email = memberEmail.split("@");
		String memberEmail1 = email[0];
		String memberEmail2 = email[1];

		/*
		 * if (memberId.equals("findId")) { memberVO.setMemberName(memberName);
		 * memberVO.setMemberEmail1(memberEmail1);
		 * memberVO.setMemberEmail2(memberEmail2);
		 * System.out.println("+++++++++++++++++++++"+ memberId);
		 * 
		 * String result = memberService.memberFind(memberVO); resEntity = new
		 * ResponseEntity(result, HttpStatus.OK);
		 * 
		 * } else {
		 */
		memberVO.setMemberId(memberId);
		memberVO.setMemberName(memberName);
		memberVO.setMemberEmail1(memberEmail1);
		memberVO.setMemberEmail2(memberEmail2);

		String result = memberService.pwFind(memberVO);
		resEntity = new ResponseEntity(result, HttpStatus.OK);

		return resEntity;
	}

	// 이메일 인증발송
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("memberEmail") String memberEmail) throws Exception {
		int serti = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
		String from = "nailgarle@company.com";
		String to = memberEmail;
		String title = "내일갈래? 이메일 인증입니다.";
		String content = "[인증번호] " + serti + " 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
		String num = "";
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);
			mailSender.send(mail);
			num = Integer.toString(serti);
		} catch (Exception e) {
			num = "error";
		}
		return num;
	}

	@Override
	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public ModelAndView findId(@RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		MemberVO memVO = new MemberVO();
		
		String[] email = memberEmail.split("@");
		String memberEmail1 = email[0];
		String memberEmail2 = email[1];
		memVO.setMemberEmail1(memberEmail1);
		memVO.setMemberName(memberName);
		memberVO = memberService.selectIdMember(memVO);

		if (memVO.getMemberName().equals(memberVO.getMemberName()) && memberEmail1.equals(memberVO.getMemberEmail1())) {
			String memberId = memberVO.getMemberId();
			mav.addObject("memberId", memberId);
			mav.addObject("memberName", memberName);
			mav.setViewName("/member/findIdEnd");

			return mav;

		} else {
			mav.setViewName("/member/find");

			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public ModelAndView findPw(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		memberVO = memberService.selectPwMember(vo);
		String memberId = memberVO.getMemberId();
		String memberName = memberVO.getMemberName();

		if (vo.getMemberId().equals(memberVO.getMemberId()) && vo.getMemberName().equals(memberVO.getMemberName())) {
			mav.addObject("memberId", memberId);
			mav.addObject("memberName", memberName);
			mav.setViewName("/member/newPw");

			return mav;

		} else {
			mav.setViewName("/member/find");

			return mav;
		}
	}

	@Override
	@RequestMapping(value = "/updatePw.do", method = RequestMethod.POST)
	public ModelAndView updatePw(@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();

		vo.setMemberPw(pwdEncoder.encode(vo.getMemberPw()));
		memberService.updatePw(vo);

		String message = "비밀번호가 정상적으로 변경되었습니다.";
		mav.addObject("message", message);
		mav.setViewName("/member/login");

		return mav;
	}
}
