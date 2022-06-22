package com.nailgarle01.nailgarle.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.board.dao.BoardDAO;
import com.nailgarle01.nailgarle.board.vo.CommentVO;
import com.nailgarle01.nailgarle.board.vo.PlanBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewBoardVO;
import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public Map<String, List<ReviewBoardVO>> reviewList(Map condMap) throws Exception {
		Map<String, List<ReviewBoardVO>> reviewMap = new HashMap<String, List<ReviewBoardVO>>();
		List<ReviewBoardVO> reviewList = boardDAO.reviewList(condMap);
		reviewMap.put("reviewList", reviewList);
		return reviewMap;
	}

	@Override
	public int addReview(Map newreviewMap) throws Exception {
		int productNum = boardDAO.insertNewReview(newreviewMap);
		ArrayList<ReviewImageVO> imageFileList = (ArrayList) newreviewMap.get("imageFileList");
		for (ReviewImageVO reviewimageVO : imageFileList) {
			reviewimageVO.setProductNum(productNum);
		}
		boardDAO.insertReviewImageFile(imageFileList);
		return productNum;
	}

	@Override
	public Map<String, List<ReviewImageVO>> selectImage(ReviewBoardVO reviewboardVO) throws Exception {
		Map<String, List<ReviewImageVO>> imageMap = new HashMap<String, List<ReviewImageVO>>();
		List<ReviewImageVO> imageList = boardDAO.selectImage(reviewboardVO);
		imageMap.put("imageList", imageList);
		return imageMap;
	}

	@Override
	public ReviewBoardVO reviewArticle(ReviewBoardVO reviewboardVO) throws Exception {
		return boardDAO.reviewArticle(reviewboardVO);

	}

	@Override
	public void deleteReview(ReviewBoardVO reviewboardVO) throws Exception {
		boardDAO.deleteImage(reviewboardVO);
		boardDAO.deleteComment(reviewboardVO);
		boardDAO.deleteReview(reviewboardVO);
	}

	@Override
	public void addComment(ReviewBoardVO reviewboardVO) throws Exception {
		boardDAO.addComment(reviewboardVO);
	}

	@Override
	public Map<String, List<CommentVO>> selectComment(CommentVO commentVO) throws Exception {
		Map<String, List<CommentVO>> commentMap = new HashMap<String, List<CommentVO>>();
		List<CommentVO> commentList = boardDAO.selectComment(commentVO);
		commentMap.put("commentList", commentList);
		return commentMap;
	}

	@Override
	public void deleteOneComment(CommentVO commentVO) throws Exception {
		boardDAO.deleteOneComment(commentVO);
	}

	@Override
	public void updateArticle(ReviewBoardVO reviewboardVO) throws Exception {
		boardDAO.updateArticle(reviewboardVO);
	}

	@Override
	public void newPlan(PlanBoardVO planboardVO) throws Exception {
		boardDAO.newPlan(planboardVO);
	}

	@Override
	public Map<String, List<PlanBoardVO>> planList(Map condMap) throws Exception {
		Map<String, List<PlanBoardVO>> planMap = new HashMap<String, List<PlanBoardVO>>();
		List<PlanBoardVO> planList = boardDAO.planList(condMap);
		planMap.put("planList", planList);
		return planMap;
	}

	@Override
	public PlanBoardVO selectPlan(PlanBoardVO planboardVO) throws Exception {
		return boardDAO.selectPlan(planboardVO);
	}

	@Override
	public void deletePlan(PlanBoardVO planboardVO) throws Exception {
		boardDAO.deletePlan(planboardVO);
	}

	@Override
	public void updatePlan(PlanBoardVO planboardVO) throws Exception {
		boardDAO.updatePlan(planboardVO);
	}

	@Override
	public Map<String, List<PlanBoardVO>> searchPlan(Map searchword) throws Exception {
		Map<String, List<PlanBoardVO>> planMap = new HashMap<String, List<PlanBoardVO>>();
		List<PlanBoardVO> planList = boardDAO.searchPlan(searchword);
		planMap.put("planList", planList);
		return planMap;
	}

	@Override
	public Map<String, List<ReviewBoardVO>> searchReview(Map searchword) throws Exception {
		Map<String, List<ReviewBoardVO>> reviewMap = new HashMap<String, List<ReviewBoardVO>>();
		List<ReviewBoardVO> reviewList = boardDAO.searchReview(searchword);
		reviewMap.put("reviewList", reviewList);
		return reviewMap;
	}
}