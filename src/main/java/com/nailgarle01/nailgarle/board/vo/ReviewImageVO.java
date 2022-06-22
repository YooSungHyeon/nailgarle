package com.nailgarle01.nailgarle.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("reviewimageVO")
public class ReviewImageVO {
	private int re_imageNum;
	private int reviewNum;
	private String re_fileName;
	private Date re_imageRegDate;
	private int productNum;
	private String memberId;

	public int getRe_imageNum() {
		return re_imageNum;
	}

	public void setRe_imageNum(int re_imageNum) {
		this.re_imageNum = re_imageNum;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getRe_fileName() {
		return re_fileName;
	}

	public void setRe_fileName(String re_fileName) {
		this.re_fileName = re_fileName;
	}

	public Date getRe_imageRegDate() {
		return re_imageRegDate;
	}

	public void setRe_imageRegDate(Date re_imageRegDate) {
		this.re_imageRegDate = re_imageRegDate;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
