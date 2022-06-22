package com.nailgarle01.nailgarle.seller.seller.vo;

import org.springframework.stereotype.Component;

@Component("sellerVO")
public class SellerVO {
	private int sellerNum;
	private String sellerId;
	private String sellerPw;
	private String sellerName;
	private String sellerHp1;
	private String sellerHp2;
	private String sellerHp3;
	private String businessNum;
	private String sellerEmail1;
	private String sellerEmail2;
	private String sellerZipcode;
	private String sellerAddr1;
	private String sellerAddr2;
	private String joinDate;
	private String del_yn;
	private String del_date;

	public int getSellerNum() {
		return sellerNum;
	}

	public void setSellerNum(int sellerNum) {
		this.sellerNum = sellerNum;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellerPw() {
		return sellerPw;
	}

	public void setSellerPw(String sellerPw) {
		this.sellerPw = sellerPw;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerHp1() {
		return sellerHp1;
	}

	public void setSellerHp1(String sellerHp1) {
		this.sellerHp1 = sellerHp1;
	}

	public String getSellerHp2() {
		return sellerHp2;
	}

	public void setSellerHp2(String sellerHp2) {
		this.sellerHp2 = sellerHp2;
	}

	public String getSellerHp3() {
		return sellerHp3;
	}

	public void setSellerHp3(String sellerHp3) {
		this.sellerHp3 = sellerHp3;
	}

	public String getBusinessNum() {
		return businessNum;
	}

	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}

	public String getSellerEmail1() {
		return sellerEmail1;
	}

	public void setSellerEmail1(String sellerEmail1) {
		this.sellerEmail1 = sellerEmail1;
	}

	public String getSellerEmail2() {
		return sellerEmail2;
	}

	public void setSellerEmail2(String sellerEmail2) {
		this.sellerEmail2 = sellerEmail2;
	}

	public String getSellerZipcode() {
		return sellerZipcode;
	}

	public void setSellerZipcode(String sellerZipcode) {
		this.sellerZipcode = sellerZipcode;
	}

	public String getSellerAddr1() {
		return sellerAddr1;
	}

	public void setSellerAddr1(String sellerAddr1) {
		this.sellerAddr1 = sellerAddr1;
	}

	public String getSellerAddr2() {
		return sellerAddr2;
	}

	public void setSellerAddr2(String sellerAddr2) {
		this.sellerAddr2 = sellerAddr2;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getDel_date() {
		return del_date;
	}

	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}

}
