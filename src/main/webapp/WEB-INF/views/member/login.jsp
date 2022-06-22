<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(function(){
	
    var responseMessage = "<c:out value="${message}" />";
    if(responseMessage != ""){
        alert(responseMessage)
    }
}) 

function memberform() { 
	
	var memberId = $("#id").val();
	var memberPw = $("#pw").val();
	
	if (memberId == '') {
		alert("아이디를 입력해주세요!");
		$("#id").focus(); 
		return false;
	} else if (memberPw == '') {
		alert("비밀번호를 입력해주세요!");
		$("#pw").focus(); 
		return false;
	}

}
			
</script>

<style>

.layout{
	padding-top:40px;
	width:100%;
}

#frmLogin {
	background-color: white;
	margin: 0 auto;
	text-align: center;
	width: 300px;
}

#login_form {
	width: 350px;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	text-align: left;
	box-sizing: border-box;
}

#login_form h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#login_form a {
	color: rgb(102, 102, 102); 
	text-decoration: none;
	font-size : 12px 
}

#login_form a:hover {
	color: rgb(255, 102, 0); 
	text-decoration: none;
}

#login_form .adduser {
	color: rgb(0, 0, 205); 
	text-decoration: none;
}

.submit_btn {
	background-color: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	height: 35px;
	width: 290px;
	font-size: 16px;
	margin: 5px 0 0 0;
	cursor: pointer;
	border-radius: 3px;
	transition: 0.3s;
}

.submit_btn:hover {
	background: white;
	color: #2b2e4a;
}

.form-ctrl {
	display: block;
	border: none;
	height: 35px;
	width: 290px;
	margin: 1px 0;
	background-color: rgb(240, 240, 240);
}

input[type=text]:focus, input[type=text]:hover {
	outline: none !important;
	box-shadow: 0 0 10px #719ECE;
}

input[type=password]:focus, input[type=password]:hover {
	outline: none !important;
	box-shadow: 0 0 10px #719ECE;
}

.main {
	padding: 0 0 0 0;
	margin: 0 auto;
	background: #ffffff;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
input[type="radio"] {
	display: none;
}

label {
	width:152px;
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2 {
	display: block;
}

#login_form .kakao_box {
	height: 35px;
	width: 290px;
}

#login_form .new_box {
	height: 35px;
	width: 290px;
	text-align: center;
	margin-top: 10px;
}

</style>
</head>

<div class="layout">

<div id="login_form">
<h3>로그인</h3>
<br>
<br>
<div class="main">
	<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">일반회원</label> 
	<input id="tab2" type="radio" name="tabs"> 
		<label for="tab2">판매자/사업자</label>
		
	<section id="content1">
		<form id="frmLogin" name="fromLogin" action="${contextPath}/member/login.do" method="post" onSubmit="return memberform()">
			<table>
				<tbody>
					<tr>
						<td>
							<input name="memberId" id="id" type="text" class="form-ctrl" placeholder="아이디를 입력해주세요." />
						</td>
					</tr>
					
					<tr>
						<td>
							<input name="memberPw" id="pw" type="password" class="form-ctrl" placeholder="비밀번호를 입력해주세요." />
						</td>
					</tr>
						
					<tr>
						<td>
							<input type="submit" class="submit_btn" value="로그인">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>

	<section id="content2">
			<form id="frmLogin" name="fromLogin" action="${contextPath}/seller/login.do" method="post" onSubmit="return sellerform()">
				<table>
					<tbody>
						<tr>
							<td>
								<input name="sellerId" id="id" type="text" class="form-ctrl" placeholder="아이디를 입력해주세요." />
							</td>
						</tr>
						
						<tr>
							<td>
								<input name="sellerPw" id="pw" type="password" class="form-ctrl" placeholder="비밀번호를 입력해주세요." />
							</td>
						</tr>
							
						<tr>
							<td>
								<input type="submit" class="submit_btn" value="로그인">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
	</div>
	
<%-- <div class="kakao_box">
	<a href="${contextPath}/member/kakaoLogin.do">
		<img src="${contextPath}/resources/image/kakao_login_btn.png" height="40px" width="290px"/>
	</a>
</div> --%>

<div class="new_box">
	<a class="find" href="${contextPath}/member/find.do">아이디/비밀번호 찾기</a> | 
	<a class="adduser" href="${contextPath}/member/memberSelect.do">회원가입</a>
</div>
	<c:if test="${orderList!=null }">
	<a href="${contextPath}/order/nonOrderEachGoods.do">비회원 주문하기</a>	
	</c:if>
	</div>
</div>
</body>
</html>