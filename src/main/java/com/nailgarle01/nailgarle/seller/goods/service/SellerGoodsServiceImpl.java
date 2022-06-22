package com.nailgarle01.nailgarle.seller.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;
import com.nailgarle01.nailgarle.seller.goods.dao.SellerGoodsDAO;

@Service("sellerGoodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class SellerGoodsServiceImpl implements SellerGoodsService {
	@Autowired
	private SellerGoodsDAO sellerGoodsDAO;

	@Override
	public List<GoodsVO> sellerGoodsList(Map condMap) throws Exception {
		return sellerGoodsDAO.sellerGoodsList(condMap);
	}

	@Override
	public int addNewGoods(Map newGoodsMap) throws Exception {
		int productNum = sellerGoodsDAO.insertNewGoods(newGoodsMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList) newGoodsMap.get("imageFileList");
		for (ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setProductNum(productNum);
		}
		sellerGoodsDAO.insertGoodsImageFile(imageFileList);
		return productNum;
	}

	@Override
	public List<String> categoryList(String categoryNum) throws Exception {
		List<String> categoryList = sellerGoodsDAO.selectCategoryList(categoryNum);
		return categoryList;
	}

	@Override
	public int getSubNum(Map newGoodsMap) throws Exception {
		int subNum = sellerGoodsDAO.selectSubNum(newGoodsMap);
		return subNum;
	}

	@Override
	public Map goodsDetail(int productNum) throws Exception {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = sellerGoodsDAO.selectGoodsDetail(productNum);
		List imageFileList = sellerGoodsDAO.selectGoodsImageFileList(productNum);
		goodsMap.put("goods", goodsVO);
		goodsMap.put("imageFileList", imageFileList);
		return goodsMap;
	}

	@Override
	public void updateGoods(Map newGoodsMap) throws Exception {
		sellerGoodsDAO.updateGoods(newGoodsMap);
	}

	@Override
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception {
		sellerGoodsDAO.updateGoodsImage(imageFileList);
	}

	@Override
	public void deleteGoods(int productNum) throws Exception {
		sellerGoodsDAO.deleteGoodsImage(productNum);
		sellerGoodsDAO.deleteGoods(productNum);
	}

}
