package com.nailgarle01.nailgarle.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.cart.service.CartService;
import com.nailgarle01.nailgarle.cart.vo.CartVO;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value = "/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;

	@RequestMapping(value = "/myCartList.do", method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		int non_memberNum;
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		if(memberVO != null) { 
			cartVO.setMemberNum(memberVO.getMemberNum());
			cartVO.setLoginCK("login");
		}else {
			if(session.getAttribute("non_memberNum")==null) {
				non_memberNum = cartService.SetMemberNum();
				session.setAttribute("non_memberNum", non_memberNum);			
			}else {
				non_memberNum = (Integer) session.getAttribute("non_memberNum");
			}
			cartVO.setMemberNum(non_memberNum);
		}
		Map<String, List> cartMap = cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap); // 장바구니 목록 화면에서 상품 주문 시 사용하기 위해서 장바구니 목록을 세션에 저장한다.
		// mav.addObject("cartMap", cartMap);
		return mav;
	}

	@RequestMapping(value = "/addGoodsInCart.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public @ResponseBody String addGoodsInCart(@RequestParam("productNum") int productNum, @RequestParam("cart_goods_qty") int cart_goods_qty,
    		@RequestParam(value="option", required = false) String option, @RequestParam(value="option2", required = false) String option2, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int non_memberNum;
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		String options = option+"/"+option2;
		if(option==null && option2==null) {
			options = "";
		}else {
			if(option2.equals("n")) {
				options=option;
			}
		}
		cartVO.setCartNote("구매");
		cartVO.setProductNum(productNum);
		cartVO.setCartQuantity(cart_goods_qty);
		cartVO.setProductOption(options);
		if(memberVO != null) { 
			cartVO.setMemberNum(memberVO.getMemberNum());
			cartVO.setLoginCK("login");
		}else {
			if(session.getAttribute("non_memberNum")==null) {
				non_memberNum = cartService.SetMemberNum();
				session.setAttribute("non_memberNum", non_memberNum);			
			}else {
				non_memberNum = (Integer) session.getAttribute("non_memberNum");
			}
			cartVO.setMemberNum(non_memberNum);			
		}
		boolean isAreadyExisted = cartService.findCartGoods(cartVO);
		if (isAreadyExisted == true) {
			return "already_existed";
		} else {
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}

	@RequestMapping(value = "/modifyCartQty.do", method ={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView modifyCartQty(@RequestParam(value="state", required = false) String state, @RequestParam("cart_goods_qty") int cart_goods_qty,@RequestParam("productNum") int productNum, 
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(state!=null) {
			if(state.equals("up")) {
				cart_goods_qty++;
			}else if(state.equals("down") && cart_goods_qty!=1) {
				cart_goods_qty--;
			}
		}
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		if(memberVO != null) { 
			cartVO.setMemberNum(memberVO.getMemberNum());
			cartVO.setLoginCK("login");
		}else {
			cartVO.setMemberNum((Integer) session.getAttribute("non_memberNum"));
		}
		cartVO.setCartQuantity(cart_goods_qty);
		cartVO.setProductNum(productNum);
		boolean result = cartService.modifyCartQty(cartVO);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
	

	@RequestMapping(value = "/removeCartGood.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeCartGood(@RequestParam("cartNum") int cartNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();		
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		if(memberVO != null) { 
			cartVO.setMemberNum(memberVO.getMemberNum());
			cartVO.setLoginCK("login");
		}else {
			cartVO.setMemberNum((Integer) session.getAttribute("non_memberNum"));
		}
		cartVO.setCartNum(cartNum);
		cartService.removeCartGoods(cartVO);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
	
	@RequestMapping(value = "/removeCartGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeCartGoods(@RequestParam("cartNum") String cartNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		if(memberVO != null) { 
			cartVO.setMemberNum(memberVO.getMemberNum());
			cartVO.setLoginCK("login");
		}else {
			cartVO.setMemberNum((Integer) session.getAttribute("non_memberNum"));
		}
		String[] cartList = cartNum.split("-");
		for(int i = 0; i<cartList.length; i++) {
			cartVO.setCartNum(Integer.parseInt(cartList[i]));
			cartService.removeCartGoods(cartVO);
		}		
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
	
	@RequestMapping(value = "/removeAllCartGoods.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView removeAllCartGoods( HttpServletRequest request,	HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		if(memberVO != null) { 
			cartVO.setMemberNum(memberVO.getMemberNum());
			cartVO.setLoginCK("login");
		}else {
			cartVO.setMemberNum((Integer) session.getAttribute("non_memberNum"));
		}
		cartService.removeAllCartGoods(cartVO);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}


}