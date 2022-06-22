package com.nailgarle01.nailgarle.common.error;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorSettingController {
	private static final Logger logger = LoggerFactory.getLogger(ErrorSettingController.class);
	
	@RequestMapping("/error404")
	public String Error404(HttpServletResponse response, Model model) {
		logger.warn("========Error 404 Page =========");
		model.addAttribute("code", "ERROR_404");
		return "Error/404";
	}

	@RequestMapping("/error500")
	public String Error500(HttpServletResponse response, Model model) {
		logger.warn("========Error 500 Page =========");
		model.addAttribute("code", "ERROR_500");
		return "Error/500";
	}
}
