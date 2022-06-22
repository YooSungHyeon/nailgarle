package com.nailgarle01.nailgarle.service.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("serviceVO")
public class ServiceVO {
	private int qnaNum;
	private int memberNum;
	private int productNum;
	private String productName;
	private String boardType;
	private String memberId;
	private String qnaType;
	private String qnaTitle;
	private String qnaText;
	private Date qnaRegDate;
	private String qnaAns;
	private String qnaSecret;
	private int num;

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getQnaType() {
		return qnaType;
	}

	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaText() {
		return qnaText;
	}

	public void setQnaText(String qnaText) {
		this.qnaText = qnaText;
	}

	public Date getQnaRegDate() {
		return qnaRegDate;
	}

	public void setQnaRegDate(Date qnaRegDate) {
		this.qnaRegDate = qnaRegDate;
	}

	public String getQnaAns() {
		return qnaAns;
	}

	public void setQnaAns(String qnaAns) {
		this.qnaAns = qnaAns;
	}

	public String getQnaSecret() {
		return qnaSecret;
	}

	public void setQnaSecret(String qnaSecret) {
		this.qnaSecret = qnaSecret;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
