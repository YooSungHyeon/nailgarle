package com.nailgarle01.nailgarle.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.service.dao.ServiceDAO;
import com.nailgarle01.nailgarle.service.vo.ServiceVO;

@Service("serviceService")
@Transactional(propagation = Propagation.REQUIRED)
public class ServiceServiceImpl implements ServiceService {
	@Autowired
	private ServiceDAO serviceDAO;

	public Map<String, List<ServiceVO>> qnalist(Map pageMap) throws Exception {
		Map<String, List<ServiceVO>> qnaMap = new HashMap<String, List<ServiceVO>>();
		List<ServiceVO> qnaList = serviceDAO.selectqnaList(pageMap);
		qnaMap.put("qnalist", qnaList);
		return qnaMap;
	}

	@Override
	public void addQna(ServiceVO serviceVO) throws Exception {
		serviceDAO.insertNewQna(serviceVO);
	}

	@Override
	public ServiceVO selectproductNum(ServiceVO serviceVO) throws Exception {
		return serviceDAO.selectproductNum(serviceVO);
	}

	@Override
	public String selectMemberId(String memberId2) throws Exception {
		return serviceDAO.selectMemberId(memberId2);

	}

	@Override
	public void deleteQna(ServiceVO serviceVO) throws Exception {
		serviceDAO.deleteQna(serviceVO);
	}

	@Override
	public void qnaAns(ServiceVO serviceVO) throws Exception {
		serviceDAO.qnaAns(serviceVO);
	}

	@Override
	public List<String> keywordSearch(String productName) throws Exception {
		List<String> list = serviceDAO.selectKeywordSearch(productName);
		return list;
	}

	@Override
	public ServiceVO selectQna(ServiceVO servicevO) throws Exception {
		return serviceDAO.selectQna(servicevO);
	}

	@Override
	public void updateQna(ServiceVO serviceVO) throws Exception {
		serviceDAO.updateQna(serviceVO);
	}
	
	@Override
	public Map<String, List<ServiceVO>> searchQna(Map pageMap) throws Exception {
		Map<String, List<ServiceVO>> qnaMap = new HashMap<String, List<ServiceVO>>();
		List<ServiceVO> qnaList = serviceDAO.searchQna(pageMap);
		qnaMap.put("qnalist", qnaList);
		return qnaMap;
	}
}