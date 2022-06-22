package com.nailgarle01.nailgarle.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.nailgarle01.nailgarle.cart.vo.CartVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;

public interface CartDAO {
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;

	public List<GoodsVO> selectGoodsList(CartVO cartVO) throws DataAccessException;

	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;

	public void insertGoodsInCart(CartVO cartVO) throws DataAccessException;

	public void updateCartGoodsQty(CartVO cartVO) throws DataAccessException;

	public void deleteCartGoods(CartVO cartVO) throws DataAccessException;
	
	public void deleteAllCartGoods(CartVO cartVO) throws DataAccessException;
	
	public int selectNonMemberNum() throws DataAccessException;

}