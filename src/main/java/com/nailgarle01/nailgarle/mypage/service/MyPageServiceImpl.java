package com.nailgarle01.nailgarle.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.mypage.dao.MyPageDAO;
import com.nailgarle01.nailgarle.order.vo.OrderVO;
import com.nailgarle01.nailgarle.order.vo.PointVO;

@Service("myPageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	public List<OrderVO> listMyOrderProduct(Map condMap) throws Exception {
		return myPageDAO.selectMyOrderProductList(condMap);
	}

	public MemberVO modifyMyInfo(MemberVO vo) throws Exception {
		String memberId = (String) vo.getMemberId();
		myPageDAO.updateMyInfo(vo);
		return myPageDAO.selectMyInfo(memberId);
	}

	public void deleteMember(String memberId) throws Exception {
		myPageDAO.deleteMember(memberId);
	}
	
	public List<PointVO> listMyPoint(Map condMap) throws Exception {
		return myPageDAO.selectMyPointList(condMap);
	}

	public List<OrderVO> mypageOrderList(Map condMap) throws Exception {
		return myPageDAO.selectMypageOrderList(condMap);
	}

	public void cancelOrder(String orderNum) throws Exception {
		myPageDAO.updateMyOrderCancel(orderNum);
	}

	@Override
	public OrderVO selectProduct(OrderVO orderVO) throws Exception {
		return myPageDAO.selectProduct(orderVO);
	}

	@Override
	public GoodsVO selectOption(GoodsVO goodsVO) throws Exception {
		return myPageDAO.selectOption(goodsVO);

	}

	@Override
	public void productReturn(OrderVO orderVO) throws Exception {
		myPageDAO.productReturn(orderVO);
	}

	@Override
	public void productExchange(OrderVO orderVO) throws Exception {
		myPageDAO.productExchange(orderVO);
	}
}
