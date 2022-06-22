package com.nailgarle01.nailgarle.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("PointVO")
public class PointVO {
	int pointNum;
	int memberNum;
	Date pointUseDate;
	String pointContents;
	int pointSave;
	int pointUse;
	private int recNum;

	public int getRecNum() {
		return recNum;
	}

	public void setRecNum(int recNum) {
		this.recNum = recNum;
	}

	public int getPointNum() {
		return pointNum;
	}

	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public Date getPointUseDate() {
		return pointUseDate;
	}

	public void setPointUseDate(Date pointUseDate) {
		this.pointUseDate = pointUseDate;
	}

	public String getPointContents() {
		return pointContents;
	}

	public void setPointContents(String pointContents) {
		this.pointContents = pointContents;
	}

	public int getPointSave() {
		return pointSave;
	}

	public void setPointSave(int pointSave) {
		this.pointSave = pointSave;
	}

	public int getPointUse() {
		return pointUse;
	}

	public void setPointUse(int pointUse) {
		this.pointUse = pointUse;
	}

}
