package com.nailgarle01.nailgarle.board.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("commentVO")
public class CommentVO {
	private int commentNum;
	private int reviewNum;
	private int memberNum;
	private String memberId;
	private String comment;
	private Date com_RegDate;

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCom_RegDate() {
		return com_RegDate;
	}

	public void setCom_RegDate(Date com_RegDate) {
		this.com_RegDate = com_RegDate;
	}

}
