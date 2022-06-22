package com.nailgarle01.nailgarle.seller.goods.controller;

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

import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;
import com.nailgarle01.nailgarle.seller.goods.service.SellerGoodsService;
import com.nailgarle01.nailgarle.seller.seller.vo.SellerVO;

import net.sf.json.JSONObject;

@Controller("sellerGoodsController")
@RequestMapping(value = "/seller/goods")
public class SellerGoodsControllerImpl extends BaseController implements SellerGoodsController {
	@Autowired
	private SellerGoodsService sellerGoodsService;
	@Autowired
	private SellerVO sellerVO;

	private static final String CURR_IMAGE_REPO_PATH = "C:\\nailgarle\\file_repo";

	@RequestMapping(value = "/sellerGoodsMain.do", method = RequestMethod.GET)
	public ModelAndView sellerGoodsMain(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
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
		sellerVO = (SellerVO) session.getAttribute("sellerInfo");
		int sellerNum = sellerVO.getSellerNum();

		HashMap<String, Object> condMap = new HashMap<String, Object>();
		if (section == null) {
			section = "1";
		}
		condMap.put("section", section);
		if (pageNum == null) {
			pageNum = "1";
		}
		condMap.put("pageNum", pageNum);
		condMap.put("sellerNum", sellerNum);
		condMap.put("beginDate", beginDate);
		condMap.put("endDate", endDate);
		condMap.put("searchType", searchType);
		condMap.put("keyword", keyword);

		List<GoodsVO> sellerGoodsList = sellerGoodsService.sellerGoodsList(condMap);

		mav.addObject("sellerGoodsList", sellerGoodsList);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("beginDate", beginDate);
		mav.addObject("endDate", endDate);
		mav.addObject("searchType", searchType);
		mav.addObject("keyword", keyword);

		return mav;
	}

	@RequestMapping(value = "/selectCategory.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String selectCategory(@RequestParam("categoryNum") String categoryNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<String> categoryList = new ArrayList<String>();
		categoryList = sellerGoodsService.categoryList(categoryNum);
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

		int p_subNum = sellerGoodsService.getSubNum(newGoodsMap);
		HttpSession session = multipartRequest.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerInfo");

		newGoodsMap.put("p_subNum", p_subNum);
		newGoodsMap.put("sellerNum", sellerVO.getSellerNum());
		newGoodsMap.put("productStar", 1);
		newGoodsMap.put("productDisplay", "-");

		String regId = sellerVO.getSellerId();

		List<ImageFileVO> imageFileList = upload(multipartRequest);
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setRegId(regId);
			}
			newGoodsMap.put("imageFileList", imageFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int productNum = sellerGoodsService.addNewGoods(newGoodsMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + productNum);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('새상품을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/seller/goods/sellerGoodsMain.do';";
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
			message += " location.href='" + multipartRequest.getContextPath() + "/seller/goods/sellerAddGoods.do';";
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

		Map goodsMap = sellerGoodsService.goodsDetail(productNum);
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

		int p_subNum = sellerGoodsService.getSubNum(newGoodsMap);
		newGoodsMap.put("p_subNum", p_subNum);

		sellerGoodsService.updateGoods(newGoodsMap);

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
				sellerGoodsService.modifyGoodsImage(imageFileList);
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
		message += " location.href='" + multipartRequest.getContextPath() + "/seller/goods/sellerGoodsMain.do';";
		message += ("</script>");

		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/deleteGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView deleteGoods(@RequestParam("productNum") int productNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		sellerGoodsService.deleteGoods(productNum);
		File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + productNum);
		FileUtils.deleteDirectory(srcFile);
		mav.setViewName("redirect:/seller/goods/sellerGoodsMain.do");
		return mav;
	}

}
