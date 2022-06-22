package com.nailgarle01.nailgarle.service.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.service.vo.ServiceVO;

public interface ServiceService {

	public Map<String, List<ServiceVO>> qnalist(Map pageMap) throws Exception;

	public void addQna(ServiceVO serviceVO) throws Exception;

	public ServiceVO selectproductNum(ServiceVO serviceVO) throws Exception;

	public String selectMemberId(String memberId2) throws Exception;

	public void deleteQna(ServiceVO serviceVO) throws Exception;

	public void qnaAns(ServiceVO serviceVO) throws Exception;

	public List<String> keywordSearch(String productName) throws Exception;

	public ServiceVO selectQna(ServiceVO servicevO) throws Exception;

	public void updateQna(ServiceVO serviceVO) throws Exception;
	
	public Map<String, List<ServiceVO>> searchQna(Map pageMap) throws Exception;
}
