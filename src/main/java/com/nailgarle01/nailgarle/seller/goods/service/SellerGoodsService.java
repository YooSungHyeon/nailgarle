package com.nailgarle01.nailgarle.seller.goods.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

public interface SellerGoodsService {

	public List<GoodsVO> sellerGoodsList(Map condMap) throws Exception;

	public int addNewGoods(Map newGoodsMap) throws Exception;

	public List<String> categoryList(String categoryNum) throws Exception;

	public int getSubNum(Map newGoodsMap) throws Exception;

	public Map goodsDetail(int productNum) throws Exception;

	public void updateGoods(Map newGoodsMap) throws Exception;

	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;

	public void deleteGoods(int productNum) throws Exception;

}
