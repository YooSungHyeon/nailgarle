package com.nailgarle01.nailgarle.board.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.board.vo.CommentVO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

public interface BoardService {
	public Map<String, List<ReviewBoardVO>> reviewList(Map condMap) throws Exception;

	public int addReview(Map newreviewMap) throws Exception;

	public Map<String, List<ReviewImageVO>> selectImage(ReviewBoardVO reviewboardVO) throws Exception;

	public ReviewBoardVO reviewArticle(ReviewBoardVO reviewboardVO) throws Exception;

	public void deleteReview(ReviewBoardVO reviewboardVO) throws Exception;

	public void addComment(ReviewBoardVO reviewboardVO) throws Exception;

	public Map<String, List<CommentVO>> selectComment(CommentVO commentVO) throws Exception;

	public void deleteOneComment(CommentVO commentVO) throws Exception;

	public void updateArticle(ReviewBoardVO reviewboardVO) throws Exception;

	public void newPlan(PlanBoardVO planboardVO) throws Exception;

	public Map<String, List<PlanBoardVO>> planList(Map condMap) throws Exception;

	public PlanBoardVO selectPlan(PlanBoardVO planboardVO) throws Exception;

	public void deletePlan(PlanBoardVO planboardVO) throws Exception;

	public void updatePlan(PlanBoardVO planboardVO) throws Exception;

	public Map<String, List<PlanBoardVO>> searchPlan(Map searchword) throws Exception;

	public Map<String, List<ReviewBoardVO>> searchReview(Map searchword) throws Exception;
}