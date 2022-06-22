package com.nailgarle01.nailgarle.cart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nailgarle01.nailgarle.cart.vo.CartVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;

public interface CartService {
	public Map<String, List> myCartList(CartVO cartVO) throws Exception;

	public boolean findCartGoods(CartVO cartVO) throws Exception;

	public void addGoodsInCart(CartVO cartVO) throws Exception;

	public boolean modifyCartQty(CartVO cartVO) throws Exception;

	public void removeCartGoods(CartVO cartVO) throws Exception;
	
	public void removeAllCartGoods(CartVO cartVO) throws Exception;
	
	public int SetMemberNum() throws Exception;
}
