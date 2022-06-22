<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.service_container {
	width: 1250px;
}

.service_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.service_container .sidebar {
	width: 250px;
	height: 510px;
	float: left;
}

.service_container .sidebar .board_img {
	padding-right: 20px;
}

.service_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.service_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.service_container .sidebar .inService {
	font-weight: 800;
}

.service_container nav {
	margin-top: 32px;
}

.service_container ul {
	padding-left: 0;
}

.service_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.service_main h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.service_main table {
	width: 950px;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}

.service_main font {
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
}

/* 마이페이지 메인의 tr, th, td 태그 */
.service_main th {
	background: darkseagreen;
	color: #fff;
}

.service_main td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.service_main tr:nth-of-type(odd) {
	background: #eee;
}

/* 칼럼 너비 */
.service_main .scNum {
	width: 15%;
}
</style>
</head>
<body>
	<div class="layout">
		<div class="service_container">
			<h1>고객센터</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a class="inService"
							href="${contextPath}/service/service.do"><img
								class="board_img"
								src="${contextPath}/resources/image/board_service.svg" />자주 묻는
								질문</a></li>
						<li><a href="${contextPath}/service/serviceqna.do"><img
								class="board_img"
								src="${contextPath}/resources/image/board_qna.svg" />1:1 문의내역</a></li>
					</ul>
				</nav>
			</div>

			<div class="service_main">
				<h4>자주 묻는 질문</h4>
				<table>
					<colgroup>
						<col class="scNum">
						<col class="scName">
					</colgroup>

					<tbody align="center">
						<tr>
							<th>번호</th>
							<th>제목</th>
						</tr>
						<tr>
							<td>1</td>
							<td><a
								style="CURSOR: hand; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none"
								onclick="if(serviceqna2.style.display=='none') {serviceqna2.style.display='';} else {serviceqna2.style.display='none';}">
									[주문] 내일갈래앱과 홈페이지가 아닌 판매자가 직접 거래를 요청할 경우 어떻게 해야하나요?</a>
								<p id="serviceqna2"
									style="margin-top: 10px; margin-bottom: 0px; display: none">답변:
									내일갈래는 판매자 직접거래를 허용하고 있지 않습니다. 판매자가 현금결제를 통한 직거래를 유도하는 경우 절대 응하지
									마시고, 즉시 사기 거래 신고센터 (02-2621-4699)로 신고하시기 바랍니다.</p></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</div>

</body>
</html>