package com.nailgarle01.nailgarle.service.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.service.service.ServiceService;
import com.nailgarle01.nailgarle.service.vo.ServiceVO;

import net.sf.json.JSONObject;

@Controller("serviceController")
@RequestMapping(value = "/service")

public class ServiceControllerImpl extends BaseController implements ServiceController {
	@Autowired
	private ServiceService serviceService;
	@Autowired
	private ServiceVO serviceVO;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value = "/serviceqna.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView serviceqna(@RequestParam Map<String, String> pageMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String section = pageMap.get("section");
		String pageNum = pageMap.get("pageNum");
		
		if (section == null) {
			section = "1";
		}
		pageMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		pageMap.put("pageNum", pageNum);

		Map<String, List<ServiceVO>> qnaMap = serviceService.qnalist(pageMap);
		mav.addObject("qnalist", qnaMap);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("list","list");

		return mav;
	}

	@Override
	@RequestMapping(value = "/addQna.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView addQna(@RequestParam("qnaType") String qnaType, @RequestParam("qnaTitle") String qnaTitle,
			@RequestParam("productName") String productName, @RequestParam("qnaText") String qnaText,
			@RequestParam("qnaSecret") String qnaSecret, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		ServiceVO serviceVO = new ServiceVO();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		if (!(productName.equals("")) && qnaType.equals("상품문의")) {
			serviceVO.setProductName(productName);
			serviceVO = serviceService.selectproductNum(serviceVO);
			serviceVO.setProductName(productName);
		}
		String memberId = memberVO.getMemberId();
		Integer memberNum = memberVO.getMemberNum();

		serviceVO.setMemberId(memberId);
		serviceVO.setMemberNum(memberNum);
		serviceVO.setQnaType(qnaType);
		serviceVO.setQnaTitle(qnaTitle);
		serviceVO.setQnaText(qnaText);
		serviceVO.setQnaSecret(qnaSecret);

		serviceService.addQna(serviceVO);

		mav.setViewName("redirect:/service/serviceqna.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/deleteQna.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity deleteQna(@RequestParam("memberId") String memberId, @RequestParam("qnaNum") int qnaNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ServiceVO serviceVO = new ServiceVO();
		String admin = "admin";
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId2 = memberVO.getMemberId();
		serviceVO.setMemberId(memberId2);
		serviceVO.setQnaNum(qnaNum);
		try {
			if (serviceService.selectMemberId(memberId2).equals(memberId) || memberId2.equals(admin)) {
				serviceService.deleteQna(serviceVO);
				message = "<script>";
				message += "location.href='" + request.getContextPath() + "/service/serviceqna.do';";
				message += "</script>";
			} else {
				message = "<script>";
				message += " alert('작성자 본인만 삭제할 수 있습니다.');";
				message += "location.href='" + request.getContextPath() + "/service/serviceqna.do';";
				message += "</script>";
			}
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/service/serviceqna.do';";
			message += "</script>";
			e.printStackTrace();
		}
		ResponseEntity resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/qnaAns.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView qnaAns(@RequestParam("qnaNum") int qnaNum, @RequestParam("qnaAns") String qnaAns,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:serviceqna.do");
		ServiceVO serviceVO = new ServiceVO();
		serviceVO.setQnaNum(qnaNum);
		serviceVO.setQnaAns(qnaAns);
		serviceService.qnaAns(serviceVO);

		return mav;
	}

	@Override
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String keywordSearch(@RequestParam("productName") String productName,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		// System.out.println(keyword);
		if (productName == null || productName.equals(""))
			return null;

		productName = productName.toUpperCase();
		List<String> keywordList = serviceService.keywordSearch(productName);

		// 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("productName", keywordList);

		String jsonInfo = jsonObject.toString();
		// System.out.println(jsonInfo);
		return jsonInfo;
	}

	@Override
	@RequestMapping(value = "/selectQna.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectQna(@RequestParam("memberId") String memberId, @RequestParam("qnaNum") int qnaNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		ServiceVO serviceVO = new ServiceVO();
		HttpSession session = request.getSession();
		String admin = "admin";
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId2 = memberVO.getMemberId();
		serviceVO.setMemberId(memberId);
		serviceVO.setQnaNum(qnaNum);

		if (memberId.equals(memberId2) || memberId2.equals(admin)) {
			serviceVO = serviceService.selectQna(serviceVO);
			mav.addObject("Qna", serviceVO);
		}

		return mav;
	}

	@Override
	@RequestMapping(value = "/updateQna.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void updateQna(@RequestParam("qnaNum") int qnaNum, @RequestParam("qnaType") String qnaType,
			@RequestParam("qnaTitle") String qnaTitle, @RequestParam("productName") String productName,
			@RequestParam("qnaText") String qnaText, @RequestParam("qnaSecret") String qnaSecret,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String memberId = memberVO.getMemberId();
		Integer memberNum = memberVO.getMemberNum();
		ServiceVO serviceVO = new ServiceVO();

		if (qnaType.equals("건의사항") || qnaType.equals("기타") || productName.equals("")) {
			serviceVO.setProductName("");
			serviceVO.setProductNum(0);
			serviceVO.setQnaType(qnaType);
		} else if (qnaType.equals("상품문의")) {
			serviceVO.setProductName(productName);
			serviceVO = serviceService.selectproductNum(serviceVO);
			serviceVO.setProductName(productName);
			serviceVO.setQnaType(qnaType);
		}
		serviceVO.setQnaNum(qnaNum);
		serviceVO.setMemberId(memberId);
		serviceVO.setMemberNum(memberNum);
		serviceVO.setQnaTitle(qnaTitle);
		serviceVO.setQnaText(qnaText);
		serviceVO.setQnaSecret(qnaSecret);

		serviceService.updateQna(serviceVO);

		out.println("<script>");
		out.println("alert('수정이 완료되었습니다');");
		out.println("location.href='" + request.getContextPath() + "/service/serviceqna.do'");
		out.println("</script>");
		out.flush();

	}
	
	@Override
	@RequestMapping(value = "/searchQna.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchQna(@RequestParam Map<String, String> pageMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String section = pageMap.get("section");
		String pageNum = pageMap.get("pageNum");
		String search_type = pageMap.get("search_type");
		String search_keyword = pageMap.get("search_keyword");
		
		if (section == null) {
			section = "1";
		}
		pageMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		pageMap.put("pageNum", pageNum);
		if (search_type.equals("전체") && search_keyword.equals("")) {
			search_type = "";
		}
		pageMap.put("search_type", search_type);
		pageMap.put("search_keyword", search_keyword);
		
		Map<String, List<ServiceVO>> qnaMap = serviceService.searchQna(pageMap);
		
		mav.addObject("qnalist", qnaMap);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("search_keyword", search_keyword);
		mav.addObject("search_type", search_type);

		return mav;
	}

}
