package com.nailgarle01.nailgarle.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.board.vo.CommentVO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

public interface BoardDAO {
	public List<ReviewBoardVO> reviewList(Map condMap) throws DataAccessException;

	public int insertNewReview(Map newreviewMap) throws DataAccessException;

	public void insertReviewImageFile(List fileList) throws DataAccessException;

	public List<ReviewImageVO> selectImage(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public ReviewBoardVO reviewArticle(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public void deleteImage(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public void deleteComment(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public void deleteReview(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public void addComment(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public List<CommentVO> selectComment(CommentVO commentVO) throws DataAccessException;

	public void deleteOneComment(CommentVO commentVO) throws DataAccessException;

	public void updateArticle(ReviewBoardVO reviewboardVO) throws DataAccessException;

	public void newPlan(PlanBoardVO planboardVO) throws DataAccessException;

	public List<PlanBoardVO> planList(Map condMap) throws DataAccessException;

	public PlanBoardVO selectPlan(PlanBoardVO planboardVO) throws DataAccessException;

	public void deletePlan(PlanBoardVO planboardVO) throws DataAccessException;

	public void updatePlan(PlanBoardVO planboardVO) throws DataAccessException;

	public List<PlanBoardVO> searchPlan(Map searchword) throws DataAccessException;

	public List<ReviewBoardVO> searchReview(Map searchword) throws DataAccessException;
}