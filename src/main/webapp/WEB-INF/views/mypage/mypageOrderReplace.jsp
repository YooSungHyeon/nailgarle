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

.layout {
	padding-top: 40px;
	width: 100%;
}

.mypage_container {
	width: 1250px;
}

.mypage_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.mypage_container .sidebar {
	width: 250px;
	height: 510px;
	float: left;
}

.mypage_container .sidebar .mypage_img {
	padding-right: 20px;
}

.mypage_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.mypage_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.mypage_container .sidebar .inmypageOrderList {
	font-weight: 800;
}

.mypage_container nav {
	margin-top: 32px;
}

.mypage_container ul {
	padding-left: 0;
}

.mypage_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.orderReplace_container {
	text-align: center;
}

.replace_box {
	margin: 150px 350px;	
	padding: 40px;
	border: solid #FFC0CB 1px;
	width: 800px;
	text-align: center;
	box-shadow: 3px 3px 3px #FFC0CB;
}

.replace_box h4 {	
	font-size: 18px;
	font-weight: 700;
	margin-top: 50px;
}

.myPage_btn {
	margin-top: 50px;
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
						<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=update"><img class="mypage_img" src="${contextPath}/resources/image/mypage_info.svg"/>내정보수정</a></li>
						<li><a href="${contextPath}/mypage/mypagePoint.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_point.svg"/>포인트</a></li>
						<li><a class="inmypageOrderList" href="${contextPath}/mypage/mypageOrderList.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_order.svg"/>주문/배송조회</a></li>
						<%-- <li><a href="${contextPath}/mypage/mypageGrade.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_grade.svg"/>회원등급조회</a></li> --%>
						<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=delete"><img class="mypage_img" src="${contextPath}/resources/image/mypage_unsubscribe.svg"/>회원탈퇴</a></li>
					</ul>
				</nav>
			</div>
			<div class="orderReplace_container">
				<div class="replace_box" style="height: 252px;">
					<h4>반품/교환요청이 완료되었습니다.</h4>
				<div class="myPage_btn">
					<input type="button" value="마이페이지로 이동" onclick="location.href='${contextPath}/mypage/mypageMain.do'"/>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>