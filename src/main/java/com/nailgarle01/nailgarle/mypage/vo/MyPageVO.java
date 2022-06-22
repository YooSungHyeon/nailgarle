package com.nailgarle01.nailgarle.mypage.vo;

import org.springframework.stereotype.Component;

@Component("myPageVO")
public class MyPageVO {
	private String memberId;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

}
