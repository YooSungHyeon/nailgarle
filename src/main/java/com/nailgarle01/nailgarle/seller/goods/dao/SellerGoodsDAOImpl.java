package com.nailgarle01.nailgarle.seller.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

@Repository("sellerGoodsDAO")
public class SellerGoodsDAOImpl implements SellerGoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> sellerGoodsList(Map dateMap) throws DataAccessException {
		List<GoodsVO> sellerGoodsList = (List) sqlSession.selectList("mapper.seller.goods.sellerGoodsSearch", dateMap);
		return sellerGoodsList;
	}

	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.seller.goods.insertNewGoods", newGoodsMap);
		int productNum = sqlSession.selectOne("mapper.seller.goods.selectProductNum");
		return productNum;
	}

	@Override
	public void insertGoodsImageFile(List fileList) throws DataAccessException {
		for (int i = 0; i < fileList.size(); i++) {
			ImageFileVO imageFileVO = (ImageFileVO) fileList.get(i);
			sqlSession.insert("mapper.seller.goods.insertGoodsImageFile", imageFileVO);

		}
	}

	@Override
	public List<String> selectCategoryList(String categoryNum) throws DataAccessException {
		List<String> categoryList = (ArrayList) sqlSession.selectList("mapper.seller.goods.selectCategoryList",
				categoryNum);
		return categoryList;
	}

	@Override
	public int selectSubNum(Map newGoodsMap) throws DataAccessException {
		int subNum = sqlSession.selectOne("mapper.seller.goods.selectSubNum", newGoodsMap);
		return subNum;
	}
	
	@Override
	public GoodsVO selectGoodsDetail(int productNum) throws DataAccessException {
		GoodsVO goodsBean = new GoodsVO();
		goodsBean = (GoodsVO) sqlSession.selectOne("mapper.seller.goods.selectGoodsDetail", productNum);
		return goodsBean;
	}

	@Override
	public List selectGoodsImageFileList(int productNum) throws DataAccessException {
		List imageList = new ArrayList();
		imageList = (List) sqlSession.selectList("mapper.seller.goods.selectGoodsImageFileList", productNum);
		return imageList;
	}
	
	@Override
	public void updateGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.update("mapper.seller.goods.updateGoods", newGoodsMap);
	}
	
	@Override
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException {
		for (int i = 0; i < imageFileList.size(); i++) {
			ImageFileVO imageFileVO = imageFileList.get(i);
			sqlSession.update("mapper.seller.goods.updateGoodsImage", imageFileVO);
		}
	}
	
	@Override
	public void deleteGoods(int productNum) throws DataAccessException {
		sqlSession.delete("mapper.seller.goods.deleteGoods", productNum);
	}	
	@Override
	public void deleteGoodsImage(int productNum) throws DataAccessException {
		sqlSession.delete("mapper.seller.goods.deleteGoodsImage", productNum);
	}

}
