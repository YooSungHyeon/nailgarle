package com.nailgarle01.nailgarle.admin.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

@Repository("adminBoardDAO")
public class AdminBoardDAOImpl implements AdminBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PlanBoardVO> planList() throws DataAccessException {
		List<PlanBoardVO> planList = (ArrayList) sqlSession.selectList("mapper.admin.board.planList");
		return planList;
	}

	@Override
	public List<ReviewBoardVO> reviewList() throws DataAccessException {
		List<ReviewBoardVO> reviewList = (ArrayList) sqlSession.selectList("mapper.admin.board.reviewList");
		return reviewList;
	}

	@Override
	public void deletePlan(PlanBoardVO planboardVO) throws DataAccessException {
		sqlSession.delete("mapper.admin.board.deletePlan", planboardVO);
	}

	@Override
	public ReviewImageVO reviewImage(int reviewNum) throws DataAccessException {
		ReviewImageVO reviewimageVO = sqlSession.selectOne("mapper.admin.board.reviewImage", reviewNum);
		return reviewimageVO;
	}

	@Override
	public void deleteReview(ReviewBoardVO reviewboardVO) throws DataAccessException {
		sqlSession.delete("mapper.admin.board.deleteComment", reviewboardVO);
		sqlSession.delete("mapper.admin.board.deleteImage", reviewboardVO);
		sqlSession.delete("mapper.admin.board.deleteReview", reviewboardVO);
	}

	@Override
	public List<PlanBoardVO> findPlan(Map wordMap) throws DataAccessException {
		List<PlanBoardVO> planList = (ArrayList) sqlSession.selectList("mapper.admin.board.findPlan", wordMap);
		return planList;
	}

	@Override
	public List<ReviewBoardVO> findReview(Map wordMap) throws DataAccessException {
		List<ReviewBoardVO> reviewList = (ArrayList) sqlSession.selectList("mapper.admin.board.findReview", wordMap);
		return reviewList;
	}
}
