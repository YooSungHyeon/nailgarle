package com.nailgarle01.nailgarle.service.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.service.vo.ServiceVO;

@Repository("serviceDAO")
public class ServiceDAOImpl implements ServiceDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ServiceVO> selectqnaList(Map pageMap) throws DataAccessException {
		List<ServiceVO> qnaList = (ArrayList) sqlSession.selectList("mapper.service.selectqnaList", pageMap);
		return qnaList;

	}

	@Override
	public void insertNewQna(ServiceVO serviceVO) throws DataAccessException {
		sqlSession.insert("mapper.service.insertNewQna", serviceVO);
	}

	@Override
	public ServiceVO selectproductNum(ServiceVO serviceVO) throws DataAccessException {
		ServiceVO VO = sqlSession.selectOne("mapper.service.selectproductNum", serviceVO);
		return VO;
	}

	@Override
	public String selectMemberId(String memberId2) throws DataAccessException {
		return sqlSession.selectOne("mapper.service.selectMemberId", memberId2);

	}

	@Override
	public void deleteQna(ServiceVO serviceVO) throws DataAccessException {
		sqlSession.selectOne("mapper.service.deleteQna", serviceVO);
	}

	@Override
	public void qnaAns(ServiceVO serviceVO) throws DataAccessException {
		sqlSession.update("mapper.service.qnaAns", serviceVO);
	}

	@Override
	public List<String> selectKeywordSearch(String productName) throws DataAccessException {
		List<String> list = (ArrayList) sqlSession.selectList("mapper.service.selectKeywordSearch", productName);
		return list;
	}

	@Override
	public ServiceVO selectQna(ServiceVO serviceVO) throws Exception {
		return sqlSession.selectOne("mapper.service.selectQna", serviceVO);
	}

	@Override
	public void updateQna(ServiceVO serviceVO) throws Exception {
		sqlSession.update("mapper.service.updateQna", serviceVO);
	}
	
	@Override
	public List<ServiceVO> searchQna(Map pageMap) throws DataAccessException {
		List<ServiceVO> qnaList = (ArrayList) sqlSession.selectList("mapper.service.searchQna", pageMap);
		return qnaList;

	}
}
