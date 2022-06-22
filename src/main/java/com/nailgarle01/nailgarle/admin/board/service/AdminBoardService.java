package com.nailgarle01.nailgarle.admin.board.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

public interface AdminBoardService {
	public Map<String, List<PlanBoardVO>> planList() throws Exception;

	public Map<String, List<ReviewBoardVO>> reviewList() throws Exception;

	public void deletePlan(PlanBoardVO planboardVO) throws Exception;

	public ReviewImageVO reviewImage(int reviewNum) throws Exception;

	public void deleteReview(ReviewBoardVO reviewboardVO) throws Exception;

	public Map<String, List<PlanBoardVO>> findPlan(Map wordMap) throws Exception;

	public Map<String, List<ReviewBoardVO>> findReview(Map wordMap) throws Exception;

}
