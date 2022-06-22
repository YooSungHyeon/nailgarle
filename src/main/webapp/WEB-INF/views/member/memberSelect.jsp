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


#member_select {
	width: 1000px;
	margin: 100px auto 500px;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 25px;
	text-align: center;
}

#member_select .select-left img {
	width: 250px; 
	height: 250px;
	float: right;
	box-shadow: 5px 5px 5px #000;
}

#member_select .select-right img {
	width: 250px; 
	height: 250px;
	float: left;
	box-shadow: 5px 5px 5px #000;
}

#member_select h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#member_select .select-left {
	float: left;
	width: 45%;
}

#member_select .select-right {
	float: right;
	width: 45%;
}

.p1 {
	clear: both;
	margin-left: 200px;
	font-weight: bold;
	font-size: 30px;
}

.p2 {
	clear: both;
	margin-right: 170px;
	font-weight: bold;
	font-size: 30px;
}
</style>
</head>
<body>
<div class="layout">
<div id="member_select">
<h3>회원 가입</h3>
<br>
<br>
<div class='select-left'>
<a href="${contextPath}/member/memberAgree.do"><img src="${contextPath}/resources/image/select1.png" alt="" /></a>
<p class='p1'>일반회원</p>
</div>
<div class='select-right'>
<a href="${contextPath}/member/sellerAgree.do"><img src="${contextPath}/resources/image/select2.jpg" alt="" /></a>
<p class='p2'>사업자회원</p>
</div>
</div>
</div>
</body>
</html>