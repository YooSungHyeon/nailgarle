package com.nailgarle01.nailgarle.admin.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl implements AdminGoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GoodsVO> selectAdminGoodsList(AdminSalesVO adminSalesVO) throws DataAccessException {
		List<GoodsVO> goodsList = (ArrayList) sqlSession.selectList("mapper.admin.goods.selectAdminGoodsList",adminSalesVO);
		return goodsList;
	}
	
	@Override
	public List<String> selectCategoryList(String categoryNum) throws DataAccessException {
		List<String> categoryList = (ArrayList) sqlSession.selectList("mapper.admin.goods.selectCategoryList",categoryNum);
		return categoryList;
	}
	
	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.admin.goods.insertNewGoods", newGoodsMap);
		int productNum =  sqlSession.selectOne("mapper.admin.goods.selectProductNum");
		return productNum;
	}

	@Override
	public void insertGoodsImageFile(List fileList) throws DataAccessException {
		for (int i = 0; i < fileList.size(); i++) {
			ImageFileVO imageFileVO = (ImageFileVO) fileList.get(i);
			sqlSession.insert("mapper.admin.goods.insertGoodsImageFile", imageFileVO);
		}
	}
	
	@Override
	public int selectSubNum(Map newGoodsMap) throws DataAccessException {
		int subNum = sqlSession.selectOne("mapper.admin.goods.selectSubNum", newGoodsMap);
		return subNum;
	}
	
	@Override
	public GoodsVO selectGoodsDetail(int productNum) throws DataAccessException {
		GoodsVO goodsBean = new GoodsVO();
		goodsBean = (GoodsVO) sqlSession.selectOne("mapper.admin.goods.selectGoodsDetail", productNum);
		return goodsBean;
	}

	@Override
	public List selectGoodsImageFileList(int productNum) throws DataAccessException {
		List imageList = new ArrayList();
		imageList = (List) sqlSession.selectList("mapper.admin.goods.selectGoodsImageFileList", productNum);
		return imageList;
	}
	
	@Override
	public void updateGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.update("mapper.admin.goods.updateGoods", newGoodsMap);
	}
	
	@Override
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException {
		for (int i = 0; i < imageFileList.size(); i++) {
			ImageFileVO imageFileVO = imageFileList.get(i);
			sqlSession.update("mapper.admin.goods.updateGoodsImage", imageFileVO);
		}

	}
	
	@Override
	public void deleteGoods(int productNum) throws DataAccessException {
		sqlSession.delete("mapper.admin.goods.deleteGoods", productNum);
	}	
	@Override
	public void deleteGoodsImage(int productNum) throws DataAccessException {
		sqlSession.delete("mapper.admin.goods.deleteGoodsImage", productNum);
	}
	
	
	
}
