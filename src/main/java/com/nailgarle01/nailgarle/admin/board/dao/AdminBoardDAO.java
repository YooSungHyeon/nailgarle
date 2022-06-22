package com.nailgarle01.nailgarle.admin.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

public interface AdminBoardDAO {
	public List<PlanBoardVO> planList() throws DataAccessException;

	public List<ReviewBoardVO> reviewList() throws DataAccessException;

	public void deletePlan(PlanBoardVO planboardVO) throws DataAccessException;

	public ReviewImageVO reviewImage(int reviewNum) throws DataAccessException;

	public void deleteReview(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public List<PlanBoardVO> findPlan(Map wordMap) throws DataAccessException;

	public List<ReviewBoardVO> findReview(Map wordMap) throws DataAccessException;
}
