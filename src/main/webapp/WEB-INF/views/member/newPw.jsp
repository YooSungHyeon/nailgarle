<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

function submit_check() {
	
	if($("#memberPw").val() == '') {
		$(".successPwChk").text("비밀번호를 입력해주세요.");
		$("#memberPw").focus();
		return false;
	} else if ($("#memberPw2").val() == '') {
		$(".successPwChk").text("비밀번호를 재입력 해주세요.");
		$("#memberPw2").focus();
		return false;
	} else if ($("#memberPw").val() != $("#memberPw2").val()) {
		$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
		$("#memberPw2").focus();
		return false;
	}
}

</script>
<style>
.layout {
	padding-top:40px;
	width:100%;
}


.newPw-box {
  float: center;
  height: auto;

}
.box {
	width: 100%;
	text-align: left;
	font-size: 18px;
}
.find {
  font-size: 12px;
  margin-left: 20px;
}

.newPw {
	width: 800px;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 25px;
	text-align: center;
	float: center;
}

.newPw h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#pwBox input {
	width: 203px;
	height: 42px;
	outline: none;
	padding: 5px;
	border: 1px solid #707070;
	transition: 0.3s;
	margin: 2px 7px;
	font-size: 12px;
}

.submit_btn {
	background-color: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	height: 35px;
	width: 203px;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 3px;
	transition: 0.3s;
	margin-left: 335px;
}

.submit_btn:hover {
	background: white;
	color: #2b2e4a;
}

.number_check {
	height: 40px;
	margin-left: 1px;
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 12px;
	transition: 0.3s;
}

.number_check:hover {
	background: white;
	color: #2b2e4a;
}

#newPwcheck {
	float: left;
	font-size: 12px;
	position: absolute;
	margin-top: 15px;
}


</style>
</head>
<body>
<div class="layout">
<div class="newPw">
<h3>비밀번호찾기</h3>
<br>
<br>
<div class='newPw-box'>
<div class='find'>신규 비밀번호 설정</div>
<div class='box'>
<form action="${contextPath}/member/updatePw.do" method="post" onsubmit="return submit_check();">
<table>
<tbody id='pwBox'>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="memberPw" name="memberPw" placeholder="새로운 비밀번호를 입력해 주세요."></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" id="memberPw2" name="memberPw2" placeholder="비밀번호를 다시 입력해 주세요."></td>
		<td><input type="hidden" name="memberId" value="${memberId }"></td>
		<td><input type="hidden" name="memberName" value="${memberName }"></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><span style="font-size:8pt; color:red; margin:5px;" class="point successPwChk">새롭게 사용할 비밀번호를 입력해주세요.</span></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input type="submit" class="submit_btn" value="비밀번호 변경하기"></td>
	</tr>
</tbody>
</table>
</form>
</div>
</div>
</div>
</div>
</body>
</html>