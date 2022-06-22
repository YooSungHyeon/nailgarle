package com.nailgarle01.nailgarle.mypage.service;

import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.order.vo.PointVO;

public interface MyPageService {

	public List<OrderVO> listMyOrderProduct(Map condMap) throws Exception;

	public MemberVO modifyMyInfo(MemberVO vo) throws Exception;

	public void deleteMember(String memberId) throws Exception;

	public List<PointVO> listMyPoint(Map condMap) throws Exception;

	public List<OrderVO> mypageOrderList(Map condMap) throws Exception;

	public void cancelOrder(String orderNum) throws Exception;

	public OrderVO selectProduct(OrderVO orderVO) throws Exception;

	public GoodsVO selectOption(GoodsVO goodsVO) throws Exception;

	public void productReturn(OrderVO orderVO) throws Exception;

	public void productExchange(OrderVO orderVO) throws Exception;

}
