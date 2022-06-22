package com.nailgarle01.nailgarle.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.service.vo.ServiceVO;

public interface ServiceDAO {
	public List<ServiceVO> selectqnaList(Map pageMap) throws DataAccessException;

	public void insertNewQna(ServiceVO serviceVO) throws DataAccessException;

	public ServiceVO selectproductNum(ServiceVO serviceVO) throws DataAccessException;

	public String selectMemberId(String memberId2) throws DataAccessException;

	public void deleteQna(ServiceVO serviceVO) throws DataAccessException;

	public void qnaAns(ServiceVO serviceVO) throws DataAccessException;

	public List<String> selectKeywordSearch(String productName) throws DataAccessException;

	public ServiceVO selectQna(ServiceVO servicevO) throws Exception;

	public void updateQna(ServiceVO serviceVO) throws Exception;
	
	public List<ServiceVO> searchQna(Map pageMap) throws DataAccessException;
}
