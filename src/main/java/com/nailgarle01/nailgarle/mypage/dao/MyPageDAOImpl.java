package com.nailgarle01.nailgarle.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.order.vo.PointVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<OrderVO> selectMyOrderProductList(Map condMap) throws DataAccessException {
		List<OrderVO> orderProductList = (List) sqlSession.selectList("mapper.mypage.selectMyOrderProductList",
				condMap);
		return orderProductList;
	}

	public void updateMyInfo(MemberVO vo) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo", vo);
	}

	public MemberVO selectMyInfo(String memberId) throws DataAccessException {
		MemberVO memberVO = (MemberVO) sqlSession.selectOne("mapper.mypage.selectMyInfo", memberId);
		return memberVO;
	}

	public void deleteMember(String memberId) throws DataAccessException {
		sqlSession.update("mapper.mypage.memberDelete", memberId);
	}

	public List<PointVO> selectMyPointList(Map dateMap) throws DataAccessException {
		List<PointVO> mypagePointList = (List) sqlSession.selectList("mapper.mypage.selectMypagePointList", dateMap);
		return mypagePointList;
	}

	public List<OrderVO> selectMypageOrderList(Map dateMap) throws DataAccessException {
		List<OrderVO> mypageOrderList = (List) sqlSession.selectList("mapper.mypage.selectMypageOrderList", dateMap);
		return mypageOrderList;
	}

	public void updateMyOrderCancel(String orderNum) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderCancel", orderNum);
	}

	@Override
	public OrderVO selectProduct(OrderVO orderVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectProduct", orderVO);
	}

	@Override
	public GoodsVO selectOption(GoodsVO goodsVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectOption", goodsVO);

	}

	@Override
	public void productReturn(OrderVO orderVO) throws DataAccessException {
		sqlSession.update("mapper.mypage.productReturn", orderVO);
	}

	@Override
	public void productExchange(OrderVO orderVO) throws DataAccessException {
		sqlSession.update("mapper.mypage.productExchange", orderVO);
	}
}
