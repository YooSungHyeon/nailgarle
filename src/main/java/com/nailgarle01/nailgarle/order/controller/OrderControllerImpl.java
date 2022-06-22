package com.nailgarle01.nailgarle.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.cart.vo.CartVO;
import com.nailgarle01.nailgarle.common.base.BaseController;
import com.nailgarle01.nailgarle.goods.vo.GoodsVO;
import com.nailgarle01.nailgarle.member.vo.MemberVO;
import com.nailgarle01.nailgarle.order.service.OrderService;
import com.nailgarle01.nailgarle.order.vo.OrderVO;

@Controller("orderController")
@RequestMapping(value = "/order")
public class OrderControllerImpl extends BaseController implements OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderVO orderVO;

	@RequestMapping(value = "/payToOrderGoods.do", method = RequestMethod.POST)
	public ModelAndView payToOrderGoods(@RequestParam Map<String, String> receiverMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("orderer");
		MemberVO memVO = (MemberVO) session.getAttribute("memberInfo");
		int memberNum = memberVO.getMemberNum();
		String orderer_hp = memberVO.getMemberHp1() + "-" + memberVO.getMemberHp2() + "-" + memberVO.getMemberHp3();
		List<OrderVO> myOrderList = (List<OrderVO>) session.getAttribute("myOrderList");
		String pt = receiverMap.get("point");
		int result=0;
		int usedPoint= 0;
		result=	Integer.parseInt(pt);
		usedPoint=result;
		boolean isLogOn= (Boolean)session.getAttribute("isLogOn");
	
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);
			orderVO.setMemberNum(memberNum);
			orderVO.setPoint(result);
			orderVO.setOrdererName(receiverMap.get("orderer_name"));
			orderVO.setReceiverName(receiverMap.get("receiver_name"));
			
			orderVO.setOrderAmount(orderVO.getOrderAmount()-result);
			result=0;
			orderVO.setReceiverHp1(receiverMap.get("receiver_hp1"));
			orderVO.setReceiverHp2(receiverMap.get("receiver_hp2"));
			orderVO.setReceiverHp3(receiverMap.get("receiver_hp3"));
			orderVO.setReceiverTel1(receiverMap.get("receiver_tel1"));
			orderVO.setReceiverTel2(receiverMap.get("receiver_tel2"));
			orderVO.setReceiverTel3(receiverMap.get("receiver_tel3"));

			orderVO.setReceiverZipcode(receiverMap.get("delivery_zipcode"));
			orderVO.setReceiverAddr1(receiverMap.get("delivery_address1"));
			orderVO.setReceiverAddr2(receiverMap.get("delivery_address2"));
			orderVO.setDeliverymessage(receiverMap.get("delivery_message"));
			orderVO.setDeliveryState("주문접수중");
			orderVO.setDeliveryMethod(receiverMap.get("delivery_method"));
			orderVO.setPayMethod(receiverMap.get("pay_method"));
			orderVO.setCardName(receiverMap.get("card_com_name"));
			orderVO.setCardPayMonth(receiverMap.get("card_pay_month"));
			myOrderList.set(i, orderVO); // 각 orderVO에 주문자 정보를 세팅한 후 다시 myOrderList에 저장한다.
		} // end for

		myOrderList= orderService.addNewOrder(myOrderList);
		if(isLogOn) {
			int point = memVO.getPoint();
			for (int i = 0; i < myOrderList.size(); i++) {
				OrderVO orderVO = (OrderVO) myOrderList.get(i);
				point += orderVO.getPoint();
			}
			point = point-usedPoint;
			memVO.setPoint(point);
			session.setAttribute("memberInfo", memVO);
		}	
		mav.addObject("myOrderInfo", receiverMap);// OrderVO로 주문결과 페이지에 주문자 정보를 표시한다.
		mav.addObject("myOrderList", myOrderList);
		return mav;
	}
	
	
	
	@RequestMapping(value = "/orderEachGoods.do", method = RequestMethod.POST)
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession();

		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		String action = (String) session.getAttribute("action");
		List myOrderList = new ArrayList<OrderVO>();
		// 로그인 여부 체크
		// 이전에 로그인 상태인 경우는 주문과정 진행
		// 로그아웃 상태인 경우 로그인 화면으로 이동
		if (isLogOn == null || isLogOn == false) {
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action", "/order/orderEachGoods.do");			
			myOrderList.add(_orderVO);
			session.setAttribute("orderList", myOrderList);
			return new ModelAndView("redirect:/member/login.do");
		} else {
			if (action != null && action.equals("/order/orderEachGoods.do")) {
				orderVO = (OrderVO) session.getAttribute("orderInfo");
				session.removeAttribute("action");
			} else {
				orderVO = _orderVO;
			}
		}

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		myOrderList.add(orderVO);

		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");

		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberInfo);
		return mav;
	}

	
	@RequestMapping(value = "/nonOrderEachGoods.do", method = RequestMethod.GET)
	public ModelAndView nonOrderEachGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<OrderVO> myOrderList = new ArrayList<OrderVO>();
		myOrderList =(ArrayList<OrderVO>) session.getAttribute("orderList");
		MemberVO memberInfo = new MemberVO();
		memberInfo.setMemberName("");
		memberInfo.setMemberNum(1);
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberInfo);
		return mav;
	}
	
	@RequestMapping(value = "/orderAllCartGoods.do", method = RequestMethod.POST)
	public ModelAndView orderAllCartGoods(@RequestParam("buy_qty") String[] cart_goods_qty,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		Map cartMap = (Map) session.getAttribute("cartMap");
		List myOrderList = new ArrayList<OrderVO>();

		List<GoodsVO> myGoodsList = (List<GoodsVO>) cartMap.get("myGoodsList");
		List<CartVO> myCartList = (List<CartVO>) cartMap.get("myCartList");
		int SetCartNum=0;
		String SetOption="";
		for (int i = 0; i < cart_goods_qty.length; i++) {
			String[] cart_goods = cart_goods_qty[i].split(":");
			
			for (int k = 0; k < myCartList.size(); k++) {
				CartVO cartVO = myCartList.get(k);
				int cartNum = cartVO.getCartNum();
				if(Integer.parseInt(cart_goods[0])==cartNum) {
					cart_goods[0]=Integer.toString(cartVO.getProductNum());
					SetOption = cartVO.getProductOption();
					SetCartNum = cartNum;
					break;
				}
			}			
			for (int j = 0; j < myGoodsList.size(); j++) {
				GoodsVO goodsVO = myGoodsList.get(j);
				int productNum = goodsVO.getProductNum();
				if (productNum == Integer.parseInt(cart_goods[0])) {
					OrderVO _orderVO = new OrderVO();
					String productName = goodsVO.getProductName();
					int productPrice = goodsVO.getOriginPrice();
					int productSale = goodsVO.getProductPrice();
					int productDelivery = goodsVO.getProductDelivery();
					String fileName = goodsVO.getFileName();
					_orderVO.setCartNum(SetCartNum);
					_orderVO.setProductOption(SetOption);					
					_orderVO.setProductNum(productNum);
					_orderVO.setProductName(productName);
					_orderVO.setProductPrice(productPrice);
					_orderVO.setProductDelivery(productDelivery);
					_orderVO.setProductSale(productSale);
					_orderVO.setOrderAmount(productSale);
					_orderVO.setFileName(fileName);
					_orderVO.setProductQuantity(Integer.parseInt(cart_goods[1]));
					myOrderList.add(_orderVO);
					break;
				}
			}
			
		}

		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		String action = (String) session.getAttribute("action");
		
		if (isLogOn == null || isLogOn == false) {
			session.setAttribute("action", "/order/orderEachGoods.do");
			session.setAttribute("orderList", myOrderList);
			return new ModelAndView("redirect:/member/login.do");
		} else {
			if (action != null && action.equals("/order/orderEachGoods.do")) {
				session.setAttribute("orderList", myOrderList);
				session.removeAttribute("action");
			}
		}
		
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberVO);
		return mav;
	}
	@RequestMapping(value = "/usePoint.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
    public @ResponseBody String usePoint(@RequestParam("point") int point, 
    		HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result=0;
		HttpSession session = request.getSession();
		List<OrderVO> myOrderList = (List<OrderVO>) session.getAttribute("myOrderList");
		for (int i = 0; i < myOrderList.size(); i++) {
			OrderVO orderVO = (OrderVO) myOrderList.get(i);			
			result+=orderVO.getOrderAmount();
		}
		result=result-point;
		return Integer.toString(result);
		
	}

}
