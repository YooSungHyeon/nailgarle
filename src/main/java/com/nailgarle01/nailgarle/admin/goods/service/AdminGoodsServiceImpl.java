package com.nailgarle01.nailgarle.admin.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.admin.goods.dao.AdminGoodsDAO;
import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

@Service("adminGoodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminGoodsServiceImpl implements AdminGoodsService{

	@Autowired
	private AdminGoodsDAO adminGoodsDAO;
	
	@Override
	public List<GoodsVO> adminMainList(AdminSalesVO adminSalesVO) throws DataAccessException{
		List<GoodsVO> adminGoodsList = adminGoodsDAO.selectAdminGoodsList(adminSalesVO);		
		return adminGoodsList;
	}
	@Override
	public List<String> categoryList(String categoryNum) throws DataAccessException{
		List<String> categoryList = adminGoodsDAO.selectCategoryList(categoryNum);		
		return categoryList;
	}
	
	@Override
	public int addNewGoods(Map newGoodsMap) throws Exception {
		int goods_id = adminGoodsDAO.insertNewGoods(newGoodsMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList) newGoodsMap.get("imageFileList");
		for (ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setProductNum(goods_id);
		}
		adminGoodsDAO.insertGoodsImageFile(imageFileList);
		return goods_id;
	}
	@Override
	public int getSubNum(Map newGoodsMap) throws Exception {
		int subNum = adminGoodsDAO.selectSubNum(newGoodsMap);
		return subNum;
	}
	
	@Override
	public Map goodsDetail(int productNum) throws Exception {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = adminGoodsDAO.selectGoodsDetail(productNum);
		List imageFileList = adminGoodsDAO.selectGoodsImageFileList(productNum);
		goodsMap.put("goods", goodsVO);
		goodsMap.put("imageFileList", imageFileList);
		return goodsMap;
	}
	
	@Override
	public void updateGoods(Map newGoodsMap) throws Exception {
		adminGoodsDAO.updateGoods(newGoodsMap);
	}
	
	@Override
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception {
		adminGoodsDAO.updateGoodsImage(imageFileList);
	}
	
	@Override
	public void deleteGoods(int productNum) throws Exception {
		adminGoodsDAO.deleteGoodsImage(productNum);
		adminGoodsDAO.deleteGoods(productNum);
	}
	
}
