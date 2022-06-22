package com.nailgarle01.nailgarle.cart.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private int cartNum;
	private int memberNum;
	private int productNum;
	private String loginCK;
	private String productOption;
	private int cartQuantity;
	private String cartNote;
	private Date cartRegDate;

	public String getLoginCK() {
		return loginCK;
	}
	public void setLoginCK(String loginCK) {
		this.loginCK = loginCK;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public String getProductOption() {
		return productOption;
	}
	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getCartNote() {
		return cartNote;
	}
	public void setCartNote(String cartNote) {
		this.cartNote = cartNote;
	}
	public Date getCartRegDate() {
		return cartRegDate;
	}
	public void setCartRegDate(Date cartRegDate) {
		this.cartRegDate = cartRegDate;
	}
	
	
}
