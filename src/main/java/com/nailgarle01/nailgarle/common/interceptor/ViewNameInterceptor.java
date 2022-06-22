package com.nailgarle01.nailgarle.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.nailgarle01.nailgarle.member.vo.MemberVO;

public class ViewNameInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {
			String viewName = getViewName(request);
			request.setAttribute("viewName", viewName);
			String urlCheck[]= viewName.split("/");
			HttpSession session = request.getSession();
			session = request.getSession();
			MemberVO memberVO = new MemberVO();
			memberVO =  (MemberVO)session.getAttribute("memberInfo");
			if(urlCheck[1].equals("admin")) {
				if(memberVO!=null) {
					if(memberVO.getMemberId().equals("admin")) {
						return true;
					}
				}				
				return false;
			}
			if(urlCheck[1].equals("mypage")) {
				if(memberVO!=null) {
					return true;
				}
				return false;
			}
			/*
			 * if(urlCheck[1].equals("seller")) { if(memberVO!=null) {
			 * if(memberVO.getMemberId().equals("seller")) { return true; } } return false;
			 * }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
		}
		return fileName;
	}
}

