package com.nailgarle01.nailgarle.admin.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.admin.board.dao.AdminBoardDAO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

@Service("adminBoardService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminBoardServiceImpl implements AdminBoardService {
	@Autowired
	private AdminBoardDAO adminBoardDAO;

	@Override
	public Map<String, List<PlanBoardVO>> planList() throws Exception {
		Map<String, List<PlanBoardVO>> planMap = new HashMap<String, List<PlanBoardVO>>();
		List<PlanBoardVO> planList = adminBoardDAO.planList();
		planMap.put("planList", planList);
		return planMap;
	}

	@Override
	public Map<String, List<ReviewBoardVO>> reviewList() throws Exception {
		Map<String, List<ReviewBoardVO>> reviewMap = new HashMap<String, List<ReviewBoardVO>>();
		List<ReviewBoardVO> reviewList = adminBoardDAO.reviewList();
		reviewMap.put("reviewList", reviewList);
		return reviewMap;
	}

	@Override
	public void deletePlan(PlanBoardVO planboardVO) throws Exception {
		adminBoardDAO.deletePlan(planboardVO);
	}

	@Override
	public ReviewImageVO reviewImage(int reviewNum) throws Exception {
		ReviewImageVO reviewimageVO = adminBoardDAO.reviewImage(reviewNum);
		return reviewimageVO;
	}

	@Override
	public void deleteReview(ReviewBoardVO reviewboardVO) throws Exception {
		adminBoardDAO.deleteReview(reviewboardVO);
	}

	@Override
	public Map<String, List<PlanBoardVO>> findPlan(Map wordMap) throws Exception {
		Map<String, List<PlanBoardVO>> planMap = new HashMap<String, List<PlanBoardVO>>();
		List<PlanBoardVO> planList = adminBoardDAO.findPlan(wordMap);
		planMap.put("planList", planList);
		return planMap;
	}

	@Override
	public Map<String, List<ReviewBoardVO>> findReview(Map wordMap) throws Exception {
		Map<String, List<ReviewBoardVO>> reviewMap = new HashMap<String, List<ReviewBoardVO>>();
		List<ReviewBoardVO> reviewList = adminBoardDAO.findReview(wordMap);
		reviewMap.put("reviewList", reviewList);
		return reviewMap;
	}
}
