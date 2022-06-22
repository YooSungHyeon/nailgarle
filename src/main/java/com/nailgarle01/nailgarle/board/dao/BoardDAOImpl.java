package com.nailgarle01.nailgarle.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.board.vo.CommentVO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewBoardVO> reviewList(Map condMap) throws DataAccessException {
		List<ReviewBoardVO> reviewList = (ArrayList) sqlSession.selectList("mapper.board.reviewList", condMap);
		return reviewList;
	}

	@Override
	public int insertNewReview(Map newreviewMap) throws DataAccessException {
		sqlSession.insert("mapper.board.addnewReview", newreviewMap);
		return (Integer) newreviewMap.get("productNum");
	}

	@Override
	public void insertReviewImageFile(List fileList) throws DataAccessException {
		for (int i = 0; i < fileList.size(); i++) {
			ReviewImageVO reviewimageVO = (ReviewImageVO) fileList.get(i);
			sqlSession.insert("mapper.board.insertReviewImageFile", reviewimageVO);
		}
	}

	@Override
	public List<ReviewImageVO> selectImage(ReviewBoardVO reviewboardVO) throws DataAccessException {
		List<ReviewImageVO> imageList = (ArrayList) sqlSession.selectList("mapper.board.selectImage", reviewboardVO);
		return imageList;
	}

	@Override
	public ReviewBoardVO reviewArticle(ReviewBoardVO reviewboardVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectReviewArticle", reviewboardVO);

	}

	@Override
	public void deleteImage(ReviewBoardVO reviewboardVO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteImage", reviewboardVO);
	}

	@Override
	public void deleteComment(ReviewBoardVO reviewboardVO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteComment", reviewboardVO);
	}

	@Override
	public void deleteReview(ReviewBoardVO reviewboardVO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteReview", reviewboardVO);
	}

	@Override
	public void addComment(ReviewBoardVO reviewboardVO) throws DataAccessException {
		sqlSession.insert("mapper.board.addComment", reviewboardVO);
	}

	@Override
	public List<CommentVO> selectComment(CommentVO commentVO) throws DataAccessException {
		List<CommentVO> comment = (ArrayList) sqlSession.selectList("mapper.board.selectComment", commentVO);
		return comment;
	}

	@Override
	public void deleteOneComment(CommentVO commentVO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteOneComment", commentVO);
	}

	@Override
	public void updateArticle(ReviewBoardVO reviewboardVO) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", reviewboardVO);
	}

	@Override
	public void newPlan(PlanBoardVO planboardVO) throws DataAccessException {
		sqlSession.insert("mapper.board.newPlan", planboardVO);
	}

	@Override
	public List<PlanBoardVO> planList(Map condMap) throws DataAccessException {
		List<PlanBoardVO> planList = (ArrayList) sqlSession.selectList("mapper.board.planList", condMap);
		return planList;
	}

	@Override
	public PlanBoardVO selectPlan(PlanBoardVO planboardVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectPlan", planboardVO);
	}

	@Override
	public void deletePlan(PlanBoardVO planboardVO) throws DataAccessException {
		sqlSession.delete("mapper.board.deletePlan", planboardVO);
	}

	@Override
	public void updatePlan(PlanBoardVO planboardVO) throws DataAccessException {
		sqlSession.update("mapper.board.updatePlan", planboardVO);
	}

	@Override
	public List<PlanBoardVO> searchPlan(Map searchword) throws DataAccessException {
		List<PlanBoardVO> planList = (ArrayList) sqlSession.selectList("mapper.board.searchPlan", searchword);
		return planList;
	}

	@Override
	public List<ReviewBoardVO> searchReview(Map searchword) throws DataAccessException {
		List<ReviewBoardVO> reviewList = (ArrayList) sqlSession.selectList("mapper.board.searchReview", searchword);
		return reviewList;
	}
}