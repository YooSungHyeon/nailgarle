package com.nailgarle01.nailgarle.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.goods.dao.GoodsDAO;
import com.nailgarle01.nailgarle.goods.vo.CategoryVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public Map<String, List<GoodsVO>> listGoods(Map<String, String> p_categoryMap) throws Exception {
		Map<String, List<GoodsVO>> goodsMap = new HashMap<String, List<GoodsVO>>();
		List<GoodsVO> goodsList = goodsDAO.selectGoodsList(p_categoryMap);
		goodsMap.put("allItem", goodsList);
		p_categoryMap.put("productDisplay", "bestItem");
		goodsList = goodsDAO.selectGoodsList(p_categoryMap);
		goodsMap.put("bestItem", goodsList);
		return goodsMap;
	}
	
	@Override
	public Map<String, List<GoodsVO>> MainListGoods(Map<String, String> p_categoryMap) throws Exception {
		Map<String, List<GoodsVO>> goodsMap = new HashMap<String, List<GoodsVO>>();
		p_categoryMap.put("productDisplay", "bestItem");
		List<GoodsVO> goodsList = goodsDAO.selectMainGoodsList(p_categoryMap);
		goodsMap.put("bestItem", goodsList);
		
		p_categoryMap.put("productDisplay", "MDPick");
		goodsList = goodsDAO.selectMainGoodsList(p_categoryMap);
		goodsMap.put("MDPick", goodsList);
		
		p_categoryMap.put("productDisplay", "NewItem");
		goodsList = goodsDAO.selectMainGoodsList(p_categoryMap);
		goodsMap.put("NewItem", goodsList);
		return goodsMap;
	}
	
	@Override
	public int listGoodsCount(Map<String, String> p_categoryMap) throws Exception {
		int cnt = goodsDAO.selectGoodsListCount(p_categoryMap);
		return cnt;
	}

	@Override
	public Map goodsDetail(String productNum) throws Exception {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(productNum);
		goodsMap.put("goodsVO", goodsVO);
		List<ImageFileVO> imageList = goodsDAO.selectGoodsDetailImage(productNum);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}	

	@Override
	public List<GoodsVO> searchGoods(Map<String, String> searchMap) throws Exception {
		List goodsList = goodsDAO.selectGoodsBySearchWord(searchMap);
		return goodsList;
	}
	
	@Override 
	public List<CategoryVO> searchGoodsCount(String searchWord) throws Exception {
		List categoryList = goodsDAO.selectGoodsBySearchWordCount(searchWord);
		return categoryList;
	}
	
	
}
