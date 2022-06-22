<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layout{
	padding-top:40px;
	width:100%;
}


#find_Id h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#find_Id {
	width: 550px;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	text-align: center;
}

.left-box2 {
	float: left;
	width: 45%;
	height: auto;	
}

.right-box2 {
	float: right;
	width: 45%;
	height: auto;
}

.button-box {
	background-color: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	padding: auto;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	height: 40px;
	width: 250px;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 3px;
	transition: 0.3s;
	float: center;
}

.button-box:hover {
	background: white;
	color: #2b2e4a;
}

</style>
</head>
<body>
<div class="layout">
<div id="find_Id">
	<h3>아이디 찾기 결과</h3>
		<p style="font-size:22px;">아이디 조회 완료</p>
			<br>
		<p style="font-size:20px;">'회원 이름'님의 아이디는 '회원 아이디' 입니다.</p>
			<br><br><br><br><br><br>
		<div class='left-box2'>
			<button type="button" class="button-box" onclick="location.href='find.jsp' ">아이디/비밀번호찾기</button>
		</div>
		<div class='right-box2'>
			<button type="button" class="button-box" onclick="location.href='LoginForm.jsp' ">로그인 페이지</button>
		</div>
</div>

</div>
</body>
</html>