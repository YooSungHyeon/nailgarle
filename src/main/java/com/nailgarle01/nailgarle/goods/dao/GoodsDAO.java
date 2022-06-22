package com.nailgarle01.nailgarle.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.goods.vo.CategoryVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(Map<String, String> p_categoryMap) throws DataAccessException;
	public List<GoodsVO> selectMainGoodsList(Map<String, String> p_categoryMap) throws DataAccessException;
	public int selectGoodsListCount(Map<String, String> p_categoryMap) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String productNum) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String productNum) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(Map<String, String> searchMap) throws DataAccessException;
	public List<CategoryVO> selectGoodsBySearchWordCount(String searchWord) throws DataAccessException;
}
