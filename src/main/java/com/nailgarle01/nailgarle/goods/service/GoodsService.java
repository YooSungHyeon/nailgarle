package com.nailgarle01.nailgarle.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.goods.vo.CategoryVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;

public interface GoodsService {
	public Map<String, List<GoodsVO>> listGoods(Map<String, String> p_categoryMap) throws Exception;
	public Map<String, List<GoodsVO>> MainListGoods(Map<String, String> p_categoryMap) throws Exception;
	public int listGoodsCount(Map<String, String> p_categoryMap) throws Exception;
	public Map goodsDetail(String productNum) throws Exception;
	public List<GoodsVO> searchGoods(Map<String, String> searchMap) throws Exception;
	public List<CategoryVO> searchGoodsCount(String searchWord) throws Exception;
}
