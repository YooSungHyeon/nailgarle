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

.mypage_container .sidebar .inmypageGrade {
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

.mypage_grade h3 {
	font-size: 15px;
	margin: 0 15px 3px 15px;
}


.mypage_grade {
	padding-left: 270px;
}

.mypage_grade h4 {	
	font-size: 12px;	
    text-align: left;
	margin-top : 12px;
}

.mypage_grade table {
	margin: 0;
	width: 100%;
	border: solid black;
	border-width: 1px 0px 1px 0px;
}

.mypage_grade th {
    padding: 5px;
	border: dotted black;
	border-width: 0px 0px 1px 0px;
}

.mypage_grade td {
	border: dotted black;
	border-width: 0px 0px 1px 0px;
}

.mypage_grade ul {
	list-style: none;
	text-align: left;
}
.mypage_grade ul li {
	padding: 0;
}

#mypage_grade2 {
	padding-left: 270px;
	margin-top: 120px;
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
						<%-- <li><a class="inmypageGrade" href="${contextPath}/mypage/mypageGrade.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_grade.svg"/>회원등급조회</a></li> --%>
						<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=delete"><img class="mypage_img" src="${contextPath}/resources/image/mypage_unsubscribe.svg"/>회원탈퇴</a></li>
					</ul>
				</nav>
			</div>
		<div class="mypage_grade">
			<h3>'회원 이름' 님의 회원등급 안내</h3>
				<div class="mypage_underline"></div>
			
					<table>
						<tbody align="center">
							<tr>
								<th>회원등급</th>
								<th>누적 주문 금액</th>
								<th>'회원등급'까지 남은 금액</th>
								<th>누적 적립 포인트</th>
							</tr>
							<tr>
								<td>'현재 회원등급'</td>
								<td>'회원 총 주문 금액'</td>
								<td>'다음 등급까지 미달 주문 금액'</td>
								<td>'회원 총 적립 포인트</td>
							</tr>
						</tbody>
					</table>
				</div>
			<div class="mypage_grade" id="mypage_grade2">
			<h3>내일갈래? 회원등급 산정 기준</h3>
				<div class="mypage_underline"></div>
			
					<table>
						<tbody align="center">
							<tr>
								<th></th>
								<th><img src="${contextPath}/resources/image/grade01.jpg" width="100" height="100"/></th>
								<th><img src="${contextPath}/resources/image/grade02.jpg" width="100" height="100"/></th>
								<th><img src="${contextPath}/resources/image/grade03.jpg" width="100" height="100"/></th>
								<th><img src="${contextPath}/resources/image/grade04.jpg" width="100" height="100"/></th>
							</tr>
							<tr>
								<td>등급이름</td>
								<td>신규 회원</td>
								<td>실버 회원</td>
								<td>골드 회원</td>
								<td>VIP 회원</td>
							</tr>
							<tr>
								<td>등급조건</td>
								<td>누적 주문 금액 0원 ~ <br>100,000원</td>
								<td>누적 주문 금액 100,000원 ~ <br>300,000원</td>
								<td>누적 주문 금액 300,000원 ~ <br>100,000원</td>
								<td>1,000,000원 이상</td>
							</tr>
							<tr>
								<td>혜택 내용</td>
								<td>주문 금액의 2% 적립</td>
								<td>주문 금액의 5% 적립</td>
								<td>주문 금액의 10% 적립</td>
								<td>주문 금액의 20% 적립</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
			
	</div>
</body>
</html>