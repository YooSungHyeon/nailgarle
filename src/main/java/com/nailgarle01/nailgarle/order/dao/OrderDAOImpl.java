package com.nailgarle01.nailgarle.order.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException {
		List<OrderVO> orderGoodsList = new ArrayList<OrderVO>();
		orderGoodsList = (ArrayList) sqlSession.selectList("mapper.order.selectMyOrderList", orderVO);
		return orderGoodsList;
	}

	public List<OrderVO> insertNewOrder(List<OrderVO> myOrderList) throws DataAccessException {
		int orderNum;
		int point=0;
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);
			if(orderVO.getPoint()>0) {
				sqlSession.update("mapper.order.updateMemPoint", orderVO);
				sqlSession.insert("mapper.order.insertUsePoint", orderVO);
			}
			point= (Integer) Math.round(orderVO.getProductSale()/100);
			orderVO.setPoint(point);
			sqlSession.insert("mapper.order.insertNewOrder", orderVO);
			sqlSession.insert("mapper.order.insertPoint", orderVO);
			sqlSession.update("mapper.order.updatePoint", orderVO);
			orderNum = sqlSession.selectOne("mapper.order.selectOrderNum", orderVO);
			orderVO.setOrderNum(orderNum);
			myOrderList.set(i, orderVO);
		}
		return myOrderList;
	}

	public OrderVO findMyOrder(String order_id) throws DataAccessException {
		OrderVO orderVO = (OrderVO) sqlSession.selectOne("mapper.order.selectMyOrder", order_id);
		return orderVO;
	}

	public void removeGoodsFromCart(OrderVO orderVO) throws DataAccessException {
		sqlSession.delete("mapper.order.deleteGoodsFromCart", orderVO);
	}

	public void removeGoodsFromCart(List<OrderVO> myOrderList) throws DataAccessException {
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);
			sqlSession.delete("mapper.order.deleteGoodsFromCart", orderVO);
		}
	}


}
