package com.nailgarle01.nailgarle.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component("planboardVO")
public class PlanBoardVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")

	private int planNum;
	private int memberNum;
	private String boardType;
	private String memberId;
	private String Pl_Title;
	private int Pl_Day;
	private int Pl_Count;
	private String Pl_Place;
	private String Pl_Text;
	private String Pl_Date1;
	private String Pl_Date2;
	private Date Pl_RegDate;
	private int num;

	public int getPlanNum() {
		return planNum;
	}

	public void setPlanNum(int planNum) {
		this.planNum = planNum;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPl_Title() {
		return Pl_Title;
	}

	public void setPl_Title(String pl_Title) {
		Pl_Title = pl_Title;
	}

	public int getPl_Day() {
		return Pl_Day;
	}

	public void setPl_Day(int pl_Day) {
		Pl_Day = pl_Day;
	}

	public int getPl_Count() {
		return Pl_Count;
	}

	public void setPl_Count(int pl_Count) {
		Pl_Count = pl_Count;
	}

	public String getPl_Place() {
		return Pl_Place;
	}

	public void setPl_Place(String pl_Place) {
		Pl_Place = pl_Place;
	}

	public String getPl_Text() {
		return Pl_Text;
	}

	public void setPl_Text(String pl_Text) {
		Pl_Text = pl_Text;
	}

	public String getPl_Date1() {
		return Pl_Date1;
	}

	public void setPl_Date1(String pl_Date1) {
		Pl_Date1 = pl_Date1;
	}

	public String getPl_Date2() {
		return Pl_Date2;
	}

	public void setPl_Date2(String pl_Date2) {
		Pl_Date2 = pl_Date2;
	}

	public Date getPl_RegDate() {
		return Pl_RegDate;
	}

	public void setPl_RegDate(Date pl_RegDate) {
		Pl_RegDate = pl_RegDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
