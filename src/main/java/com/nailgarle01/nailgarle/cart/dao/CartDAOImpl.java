package com.nailgarle01.nailgarle.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.nailgarle01.nailgarle.cart.vo.CartVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = (List) sqlSession.selectList("mapper.cart.selectCartList", cartVO);
		return cartList;
	}

	public List<GoodsVO> selectGoodsList(CartVO cartVO) throws DataAccessException {
		List<GoodsVO> myGoodsList;
		myGoodsList = sqlSession.selectList("mapper.cart.selectGoodsList", cartVO);
		return myGoodsList;
	}

	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}

	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException {
		sqlSession.insert("mapper.cart.insertGoodsInCart", cartVO);
	}

	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException {
		sqlSession.insert("mapper.cart.updateCartGoodsQty", cartVO);
	}

	public void deleteCartGoods(CartVO cartVO) throws DataAccessException {
		sqlSession.delete("mapper.cart.deleteCartGoods", cartVO);
	}
	
	public void deleteAllCartGoods(CartVO cartVO) throws DataAccessException {
		sqlSession.delete("mapper.cart.deleteAllCartGoods", cartVO);
	}
	
	public int selectNonMemberNum() throws DataAccessException {
		int result = sqlSession.selectOne("mapper.cart.selectNonMemberNum");
		return result;
	}


}
