<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
</script>
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

.pwcheck_box_container {
	text-align: center;
}

.pwcheck_box {
	margin: 150px 350px;	
	padding: 40px;
	border: solid #FFC0CB 1px;
	width: 800px;
	text-align: center;
	box-shadow: 3px 3px 3px #FFC0CB;
}

.pwcheck_box h2 {	
	font-size: 18px;
	font-weight: 700;	
}

.pwcheck_box h3 {	
	font-size: 12px;	
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
					<li><a href="${contextPath}/mypage/mypageOrderList.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_order.svg"/>주문/배송조회</a></li>
					<%-- <li><a href="${contextPath}/mypage/mypageGrade.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_grade.svg"/>회원등급조회</a></li> --%>
					<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=delete"><img class="mypage_img" src="${contextPath}/resources/image/mypage_unsubscribe.svg"/>회원탈퇴</a></li>
				</ul>
			</nav>
		</div>
		<div class="pwcheck_box_container">
			<div class="pwcheck_box">
				<h2>비밀번호 입력</h2>
				<h3>외부로부터 고객님의 정보를 안전하게 보호하기 위하여 비밀번호를 다시 한번 확인합니다.
				<br>항상 비밀번호는 타인에게 노출되지 않도록 주의하여 주세요.
				</h3><br>
				<form action="${contextPath}/mypage/PwCheck.do" method="post">
				<input type="password" name="memberPw"/>
				<br>
				<br>
				<input type="submit" value="확인"/>&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
				</form>
			</div>
		</div>		
	</div>
</div>
</body>
</html>