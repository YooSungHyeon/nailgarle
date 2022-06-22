package com.nailgarle01.nailgarle.member.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private int memberNum;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String gender;
	private String memberHp1;
	private String memberHp2;
	private String memberHp3;
	private String memberEmail1;
	private String memberEmail2;
	private String birth;
	private String memberZipcode;
	private String memberAddr1;
	private String memberAddr2;
	private String recommend;
	private int point;
	private String grade;
	private String joinDate;
	private String del_yn;
	private String del_date;
		
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
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMemberHp1() {
		return memberHp1;
	}
	public void setMemberHp1(String memberHp1) {
		this.memberHp1 = memberHp1;
	}
	public String getMemberHp2() {
		return memberHp2;
	}
	public void setMemberHp2(String memberHp2) {
		this.memberHp2 = memberHp2;
	}
	public String getMemberHp3() {
		return memberHp3;
	}
	public void setMemberHp3(String memberHp3) {
		this.memberHp3 = memberHp3;
	}
	public String getMemberEmail1() {
		return memberEmail1;
	}
	public void setMemberEmail1(String memberEmail1) {
		this.memberEmail1 = memberEmail1;
	}
	public String getMemberEmail2() {
		return memberEmail2;
	}
	public void setMemberEmail2(String memberEmail2) {
		this.memberEmail2 = memberEmail2;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMemberZipcode() {
		return memberZipcode;
	}
	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}
	public String getMemberAddr1() {
		return memberAddr1;
	}
	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}
	public String getMemberAddr2() {
		return memberAddr2;
	}
	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
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
