package com.nailgarle01.nailgarle.cart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nailgarle01.nailgarle.cart.dao.CartDAO;
import com.nailgarle01.nailgarle.cart.vo.CartVO;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;

@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;

	public Map<String, List> myCartList(CartVO cartVO) throws Exception {
		Map<String, List> cartMap = new HashMap<String, List>();
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		if (myCartList.size() == 0) { // 카트에 저장된 상품이없는 경우
			return null;
		}
		List<GoodsVO> myGoodsList = cartDAO.selectGoodsList(cartVO);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myGoodsList);
		return cartMap;
	}

	public boolean findCartGoods(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);

	}

	public void addGoodsInCart(CartVO cartVO) throws Exception {
		cartDAO.insertGoodsInCart(cartVO);
	}

	public boolean modifyCartQty(CartVO cartVO) throws Exception {
		boolean result = true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}

	public void removeCartGoods(CartVO cartVO) throws Exception {
		cartDAO.deleteCartGoods(cartVO);
	}
	
	public void removeAllCartGoods(CartVO cartVO) throws Exception {
		cartDAO.deleteAllCartGoods(cartVO);
	}
	public int SetMemberNum() throws Exception {
		int non_memberNum =cartDAO.selectNonMemberNum();
		return non_memberNum;
	}
	

}

