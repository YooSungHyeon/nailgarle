package com.nailgarle01.nailgarle.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

public interface AdminGoodsDAO {
	public List<GoodsVO> selectAdminGoodsList(AdminSalesVO adminSalesVO) throws DataAccessException;
	public List<String> selectCategoryList(String categoryNum) throws DataAccessException;
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public void insertGoodsImageFile(List fileList) throws DataAccessException;
	public int selectSubNum(Map newGoodsMap) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int productNum) throws DataAccessException;
	public List selectGoodsImageFileList(int productNum) throws DataAccessException;
	public void updateGoods(Map newGoodsMap) throws DataAccessException;
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException;
	public void deleteGoods(int productNum) throws DataAccessException;
	public void deleteGoodsImage(int productNum) throws DataAccessException;
}
