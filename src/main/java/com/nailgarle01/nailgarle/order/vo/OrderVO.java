package com.nailgarle01.nailgarle.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {
	private int orderNum;
	private int memberNum;
	private int productNum;
	private int cartNum;
	private String ordererName;
	private String productName;
	private int productQuantity;
	private String productOption;
	private int productPrice;
	private int productSale;
	private int productDelivery;
	private int orderAmount;
	private String deliveryMethod;
	private String receiverName;
	private String receiverHp1;
	private String receiverHp2;
	private String receiverHp3;
	private String receiverTel1;
	private String receiverTel2;
	private String receiverTel3;
	private String receiverZipcode;
	private String receiverAddr1;
	private String receiverAddr2;
	private String deliveryState;
	private String deliverymessage;
	private Date orderDate;
	private String payMethod;
	private String cardName;
	private String cardPayMonth;
	private String rentalStart;
	private String rentalEnd;
	private String fileName;
	private String message;
	private String return_Option;
	private String exchange_Option;
	private int point;

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getOrdererName() {
		return ordererName;
	}

	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductOption() {
		return productOption;
	}

	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductSale() {
		return productSale;
	}

	public void setProductSale(int productSale) {
		this.productSale = productSale;
	}

	public int getProductDelivery() {
		return productDelivery;
	}

	public void setProductDelivery(int productDelivery) {
		this.productDelivery = productDelivery;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getDeliveryMethod() {
		return deliveryMethod;
	}

	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverHp1() {
		return receiverHp1;
	}

	public void setReceiverHp1(String receiverHp1) {
		this.receiverHp1 = receiverHp1;
	}

	public String getReceiverHp2() {
		return receiverHp2;
	}

	public void setReceiverHp2(String receiverHp2) {
		this.receiverHp2 = receiverHp2;
	}

	public String getReceiverHp3() {
		return receiverHp3;
	}

	public void setReceiverHp3(String receiverHp3) {
		this.receiverHp3 = receiverHp3;
	}

	public String getReceiverTel1() {
		return receiverTel1;
	}

	public void setReceiverTel1(String receiverTel1) {
		this.receiverTel1 = receiverTel1;
	}

	public String getReceiverTel2() {
		return receiverTel2;
	}

	public void setReceiverTel2(String receiverTel2) {
		this.receiverTel2 = receiverTel2;
	}

	public String getReceiverTel3() {
		return receiverTel3;
	}

	public void setReceiverTel3(String receiverTel3) {
		this.receiverTel3 = receiverTel3;
	}

	public String getReceiverZipcode() {
		return receiverZipcode;
	}

	public void setReceiverZipcode(String receiverZipcode) {
		this.receiverZipcode = receiverZipcode;
	}

	public String getReceiverAddr1() {
		return receiverAddr1;
	}

	public void setReceiverAddr1(String receiverAddr1) {
		this.receiverAddr1 = receiverAddr1;
	}

	public String getReceiverAddr2() {
		return receiverAddr2;
	}

	public void setReceiverAddr2(String receiverAddr2) {
		this.receiverAddr2 = receiverAddr2;
	}

	public String getDeliveryState() {
		return deliveryState;
	}

	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}

	public String getDeliverymessage() {
		return deliverymessage;
	}

	public void setDeliverymessage(String deliverymessage) {
		this.deliverymessage = deliverymessage;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getCardPayMonth() {
		return cardPayMonth;
	}

	public void setCardPayMonth(String cardPayMonth) {
		this.cardPayMonth = cardPayMonth;
	}

	public String getRentalStart() {
		return rentalStart;
	}

	public void setRentalStart(String rentalStart) {
		this.rentalStart = rentalStart;
	}

	public String getRentalEnd() {
		return rentalEnd;
	}

	public void setRentalEnd(String rentalEnd) {
		this.rentalEnd = rentalEnd;
	}

	public String getReturn_Option() {
		return return_Option;
	}

	public void setReturn_Option(String return_Option) {
		this.return_Option = return_Option;
	}

	public String getExchange_Option() {
		return exchange_Option;
	}

	public void setExchange_Option(String exchange_Option) {
		this.exchange_Option = exchange_Option;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
