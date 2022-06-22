package com.nailgarle01.nailgarle.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("reviewboardVO")
public class ReviewBoardVO {
	private int reviewNum;
	private int memberNum;
	private String boardType;
	private String productName;
	private int productNum;
	private String memberId;
	private String re_fileName;
	private String re_Title;
	private String re_Star;
	private String re_Text;
	private Date re_RegDate;
	private int num;
	private String comment;

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getRe_fileName() {
		return re_fileName;
	}

	public void setRe_fileName(String re_fileName) {
		this.re_fileName = re_fileName;
	}

	public String getRe_Title() {
		return re_Title;
	}

	public void setRe_Title(String re_Title) {
		this.re_Title = re_Title;
	}

	public String getRe_Star() {
		return re_Star;
	}

	public void setRe_Star(String re_Star) {
		this.re_Star = re_Star;
	}

	public String getRe_Text() {
		return re_Text;
	}

	public void setRe_Text(String re_Text) {
		this.re_Text = re_Text;
	}

	public Date getRe_RegDate() {
		return re_RegDate;
	}

	public void setRe_RegDate(Date re_RegDate) {
		this.re_RegDate = re_RegDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

}
