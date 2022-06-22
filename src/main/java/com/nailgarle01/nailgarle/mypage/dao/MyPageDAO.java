package com.nailgarle01.nailgarle.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.order.vo.PointVO;

public interface MyPageDAO {

	public List<OrderVO> selectMyOrderProductList(Map condMap) throws DataAccessException;

	public void updateMyInfo(MemberVO vo) throws DataAccessException;

	public MemberVO selectMyInfo(String memberId) throws DataAccessException;

	public void deleteMember(String memberId) throws DataAccessException;

	public List<PointVO> selectMyPointList(Map dateMap) throws DataAccessException;

	public List<OrderVO> selectMypageOrderList(Map dateMap) throws DataAccessException;

	public void updateMyOrderCancel(String orderNum) throws DataAccessException;

	public OrderVO selectProduct(OrderVO orderVO) throws DataAccessException;

	public GoodsVO selectOption(GoodsVO goodsVO) throws DataAccessException;

	public void productReturn(OrderVO orderVO) throws DataAccessException;

	public void productExchange(OrderVO orderVO) throws DataAccessException;

}
