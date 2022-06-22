package com.nailgarle01.nailgarle.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.admin.sales.vo.AdminSalesVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;

public interface AdminGoodsService {
	public List<GoodsVO> adminMainList(AdminSalesVO adminSalesVO) throws DataAccessException;
	public List<String> categoryList(String categoryNum) throws DataAccessException;
	public int addNewGoods(Map newGoodsMap) throws Exception;
	public int getSubNum(Map newGoodsMap) throws Exception;
	public Map goodsDetail(int productNum) throws Exception;
	public void updateGoods(Map newGoodsMap) throws Exception;
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;
	public void deleteGoods(int productNum) throws Exception;
}
