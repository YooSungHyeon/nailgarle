package com.nailgarle01.nailgarle.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> selectGoodsList(Map<String, String> p_categoryMap) throws DataAccessException {
		List<GoodsVO> goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsList", p_categoryMap);
		return goodsList;
	}
	@Override
	public List<GoodsVO> selectMainGoodsList(Map<String, String> p_categoryMap) throws DataAccessException {
		List<GoodsVO> goodsList = (ArrayList) sqlSession.selectList("mapper.goods.selectMainGoodsList", p_categoryMap);
		return goodsList;
	}
	@Override
	public int selectGoodsListCount(Map<String, String> p_categoryMap) throws DataAccessException {
		int cnt = (Integer) sqlSession.selectOne("mapper.goods.selectGoodsListCount", p_categoryMap);
		return cnt;
	}
	
	@Override
	public GoodsVO selectGoodsDetail(String productNum) throws DataAccessException {
		GoodsVO goodsVO = (GoodsVO) sqlSession.selectOne("mapper.goods.selectGoodsDetail", productNum);
		return goodsVO;
	}
	@Override
	public List<ImageFileVO> selectGoodsDetailImage(String productNum) throws DataAccessException {
		List<ImageFileVO> imageList = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsDetailImage", productNum);
		return imageList;
	}

	@Override
	public ArrayList selectGoodsBySearchWord(Map<String, String> searchMap) throws DataAccessException {
		ArrayList list = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsBySearchWord", searchMap);
		return list;
	}
	
	@Override
	public ArrayList selectGoodsBySearchWordCount(String searchWord) throws DataAccessException {
		ArrayList list = (ArrayList) sqlSession.selectList("mapper.goods.selectGoodsBySearchWordCount", searchWord);
		return list;
	}
	
}
