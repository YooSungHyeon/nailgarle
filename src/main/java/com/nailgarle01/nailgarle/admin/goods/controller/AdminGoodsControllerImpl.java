package com.nailgarle01.nailgarle.admin.goods.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.admin.goods.service.AdminGoodsService;
import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;

import net.sf.json.JSONObject;

@Controller("adminGoodsController")
@RequestMapping(value = "/admin/goods")
public class AdminGoodsControllerImpl extends BaseController implements AdminGoodsController{
	@Autowired
	private AdminSalesVO adminSalesVO;
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\nailgarle\\file_repo";
	
	@RequestMapping(value = "/adminGoodsMain.do", method = RequestMethod.GET)
	public ModelAndView adminGoodsMain(@RequestParam(value="secNum", required = false) String secNum,@RequestParam(value="pageNum", required = false) String pageNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		if (secNum == null) {
			secNum = "1";
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		adminSalesVO.setSecNum(Integer.parseInt(secNum));
		adminSalesVO.setPageNum(Integer.parseInt(pageNum));
		List<GoodsVO> goodsList = adminGoodsService.adminMainList(adminSalesVO);
		mav.addObject("secNum", secNum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("goodsList", goodsList);
		return mav;
	}
	
	@RequestMapping(value = "/addGoods.do", method = RequestMethod.POST)
	public ModelAndView addGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
	@RequestMapping(value = "/selectCategory.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String selectCategory(@RequestParam("categoryNum") String categoryNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception{

		List<String> categoryList = new ArrayList<String>();
		categoryList= adminGoodsService.categoryList(categoryNum);	
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("category", categoryList);

		String jsonInfo = jsonObject.toString();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		return jsonInfo;
	}

	@RequestMapping(value = "/addNewGoods.do", method = { RequestMethod.POST })
	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;

		Map newGoodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newGoodsMap.put(name, value);
		}
      
		int p_subNum = adminGoodsService.getSubNum(newGoodsMap);
		newGoodsMap.put("p_subNum", p_subNum);
		newGoodsMap.put("sellerNum", 1);
		newGoodsMap.put("productStar", 1);
		
		HttpSession session = multipartRequest.getSession();
		//MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String reg_id = "admin";

		List<ImageFileVO> imageFileList = upload(multipartRequest);
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setRegId(reg_id);
			}
			newGoodsMap.put("imageFileList", imageFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int goods_id = adminGoodsService.addNewGoods(newGoodsMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('새상품을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/goods/adminGoodsMain.do';";
			message += ("</script>");
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/goods/addNewGoodsForm.do';";
			message += ("</script>");
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value = "/modifyGoodsForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modifyGoodsForm(@RequestParam("productNum") int productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		Map goodsMap = adminGoodsService.goodsDetail(productNum);
		mav.addObject("goodsMap", goodsMap);

		return mav;
	}

	@RequestMapping(value = "/modifyGoods.do", method = { RequestMethod.POST })
	public ResponseEntity modifyGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;

		Map newGoodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newGoodsMap.put(name, value);
		}
      
		int p_subNum = adminGoodsService.getSubNum(newGoodsMap);
		newGoodsMap.put("p_subNum", p_subNum);

		adminGoodsService.updateGoods(newGoodsMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		List<ImageFileVO> imageFileList = null;
		int productNum = 0;
		try {
			imageFileList = upload(multipartRequest);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					productNum = Integer.parseInt((String) newGoodsMap.get("productNum"));
					imageFileVO.setProductNum(productNum);
				}
				adminGoodsService.modifyGoodsImage(imageFileList);
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}		
		message = "<script>";
		message += " alert('상품을 수정했습니다.');";
		message += " location.href='" + multipartRequest.getContextPath() + "/admin/goods/adminGoodsMain.do';";
		message += ("</script>");

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value = "/deleteGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteGoods(@RequestParam("productNum") int productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		adminGoodsService.deleteGoods(productNum);
		File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + productNum);
		FileUtils.deleteDirectory(srcFile);
		mav.setViewName("redirect:/admin/goods/adminGoodsMain.do");
		return mav;
	}
	
}
