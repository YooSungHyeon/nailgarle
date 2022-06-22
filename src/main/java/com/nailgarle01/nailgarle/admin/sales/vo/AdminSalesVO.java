package com.nailgarle01.nailgarle.admin.sales.vo;

import org.springframework.stereotype.Component;

@Component("adminSalesVO")
public class AdminSalesVO {
	private String startDate;
	private String endDate;
	private int orderAmount;
	private int rentalAmount;
	private int orderPrice;
	private int rentalPrice;
	private int secNum;
	private int pageNum;	
	
	public int getSecNum() {
		return secNum;
	}
	public void setSecNum(int secnNum) {
		this.secNum = secnNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}
	public int getRentalAmount() {
		return rentalAmount;
	}
	public void setRentalAmount(int rentalAmount) {
		this.rentalAmount = rentalAmount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getRentalPrice() {
		return rentalPrice;
	}
	public void setRentalPrice(int rentalPrice) {
		this.rentalPrice = rentalPrice;
	}
	
}
