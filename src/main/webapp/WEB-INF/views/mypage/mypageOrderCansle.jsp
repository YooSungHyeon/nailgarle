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
.mypage_container{
	width: 1250px;
}
.mypage_container h1{
	margin-top : 40px;
	text-align: center;
	font-size: 40px;
}

.mypage_container .sidebar{
	width:250px;
	float: left;
	background: pink;
	border: solid black;
	border-width: 1px 0px 0px 0px ;
}
.mypage_container .sidebar ul li a{
	text-decoration: none;
	color: black;
}
.mypage_container .sidebar ul li:hover > a{
	font-weight: 800;
}

.mypage_container .sidebar .inmypageOrderList{
	font-weight: 800;
}
.mypage_container nav{
	margin-top : 32px;
}

.mypage_container ul{
	padding-left: 60px;
}
.mypage_container li{
	font-size: 18px;	
	padding: 20px 0;
	list-style: none;
}
.order_container{
	text-align: center;
	border: solid black;
	border-width: 1px 0px 0px 0px ;
}

.order_container h4{	
	font-size: 12px;	
    text-align: left;
	margin-top : 12px;
    padding-left: 300px;
}

.order_container .msg_box{
	width: 500px;
	height: 400px;
}

.order_container .msg_box h4{
	padding-top: 180px;
}


</style>
</head>
<body>
<div class="layout">
<!-- body부분 삽입-->
	<div class="mypage_container">
		<h1>마이페이지</h1>		
		<div class="sidebar">
			<nav>
				<ul>
					<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=update">나의정보수정</a></li>
					<li><a href="${contextPath}/mypage/mypagePoint.do">포인트</a></li>
					<li><a href="${contextPath}/mypage/mypageOrderList.do">주문/배송조회</a></li>
					<%-- <li><a href="${contextPath}/mypage/mypageGrade.do">회원등급조회</a></li> --%>
					<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=delete">회원탈퇴</a></li>
				</ul>
			</nav>
		</div>
		<div class="order_container">
			<h4>주문취소</h4>
			<div class="msg_box"><h4>취소처리가 완료되었습니다.</h4></div>
			<input type="button" value="메인페이지로 이동" onclick="location.href='${contextPath}/main/main.do'"/>
		</div>		
	</div>
</div>
</body>
</html>