<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function keyword_search() {
		var my_delivery_list = document.my_delivery_list;

		searchType = my_delivery_list.searchType.value;
		keyword = my_delivery_list.keyword.value;

		var formObj = document.createElement("form");
		var i_command = document.createElement("input");
		var i_search_type = document.createElement("input");
		var i_key_word = document.createElement("input");

		i_command.name = "command";
		i_search_type.name = "searchType";
		i_key_word.name = "keyword";

		i_command.value = "my_order_keyword_search";
		i_search_type.value = searchType;
		i_key_word.value = keyword;

		formObj.appendChild(i_command);
		formObj.appendChild(i_search_type);
		formObj.appendChild(i_key_word);
		document.body.appendChild(formObj);

		formObj.method = "get";
		formObj.action = "${contextPath}/mypage/mypageMain.do";
		formObj.submit();
	}
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

.my_main .mydata table {
	width: 950px;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}

.my_main .mydata td {
	padding: 10px;
}

.my_main h5 {
	margin-top: 40px;
	margin-left: 280px;
	text-align: left;
	font-size: 12px;
}

.my_main .mydata_main table {
	width: 950px;
}

.my_main .mydata font {
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
}

/* 마이페이지 메인의 tr, th, td 태그 */
.my_main .mydata_main th {
	background: #FFC0CB;
	color: #fff;
}

.my_main .mydata_main td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.my_main .mydata_main tr:nth-of-type(odd) {
	background: #eee;
}

/* 칼럼 너비 */
.my_main .mydata_main .odNum {
	width: 15%;
}

.my_main .mydata_main .pdName {
	/* 나머지 자동맞춤 */
	
}

.my_main .mydata_main .odPrice {
	width: 15%;
}

.my_main .mydata_main .odDate {
	width: 20%;
}

.my_main .mydata_main .dvState {
	width: 15%;
}

/* 상품명 a태그 */
.mypage_product {
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

.mypage_product:hover {
	color: #6199ff;
}

/* 검색폼 */
.keywordform {
	float: left;
	margin: 10px 30px;
}

/* 검색창 인풋박스 */
.keywordform .keyword {
	border: 1px solid #dbdbdb;
	width: 185px;
	height: 26px;
}

/* 검색창 셀렉박스 */
.keywordform .searchType {
	border: 1px solid #dbdbdb;
	width: 90px;
	height: 26px;
}

/* 검색창 검색버튼 */
.keywordform .search_btn {
	background: url(${contextPath}/resources/image/search_btn.png);
	background-repeat: no-repeat;
	width: 26px;
	height: 26px;
	border: none;
}

/* page */
.mypage_container .my_main .mydata_main .page_nation {
	border: none;
	padding-top: 30px;
	background-color: white;
}

.page_nation a {
	display: inline-block;
	border: 1px solid #e6e6e6;
	width: 25px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	background-color: #fff;
	font-size: 12px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/image/page_prev.png')
		no-repeat center center;
}

.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/image/page_next.png')
		no-repeat center center;
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
						<li><a
							href="${contextPath}/mypage/mypagePwCheck.do?my=update"><img
								class="mypage_img"
								src="${contextPath}/resources/image/mypage_info.svg" />내정보수정</a></li>
						<li><a href="${contextPath}/mypage/mypagePoint.do"><img
								class="mypage_img"
								src="${contextPath}/resources/image/mypage_point.svg" />포인트</a></li>
						<li><a href="${contextPath}/mypage/mypageOrderList.do"><img
								class="mypage_img"
								src="${contextPath}/resources/image/mypage_order.svg" />주문/배송조회</a></li>
						<%-- <li><a href="${contextPath}/mypage/mypageGrade.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_grade.svg"/>회원등급조회</a></li> --%>
						<li><a
							href="${contextPath}/mypage/mypagePwCheck.do?my=delete"><img
								class="mypage_img"
								src="${contextPath}/resources/image/mypage_unsubscribe.svg" />회원탈퇴</a></li>
					</ul>
				</nav>
			</div>
			<div class="my_main">
				<div class="mydata">
					<table>
						<tbody align="center">
							<tr>
								<td style="font-size: 12px;">${memberInfo.memberName }님은<c:choose>
										<c:when test="${memberInfo.grade == 'f'}">
											<font style="font-weight: bold; color: aqua;">FAMILY</font> 등급입니다.
									</c:when>
										<c:when test="${memberInfo.grade == 's'}">
											<font style="font-weight: bold; color: silver;">SILVER</font> 등급입니다. 
									</c:when>
										<c:when test="${memberInfo.grade == 'g'}">
											<font style="font-weight: bold; color: yellow;">GOLD</font> 등급입니다. 
									</c:when>
										<c:when test="${memberInfo.grade == 'v'}">
											<font style="font-weight: bold; color: black;">VIP</font> 등급입니다. 
									</c:when>
									</c:choose>
								</td>
								<td>포인트</td>
								<td>쿠폰</td>
								<td>쪽지</td>
							</tr>
							<tr>
								<td style="width: 240px;"><img height="100" width="100"
									alt=""
									src="${contextPath}/resources/image/grade/${memberInfo.grade }.png"></td>
								<td>${memberInfo.point }P</td>
								<td>0개</td>
								<td>0개</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="keywordform">
					<form name="my_delivery_list">
						<select id="searchType" class="searchType" name="searchType">
							<option value="all">전체</option>
							<option value="productName">상품명</option>
							<option value="ordererName">주문자</option>
							<option value="receiverName">수령자</option>
						</select> <input type="text" class="keyword" id="keyword" name="keyword" />
						<input type="button" class="search_btn" onClick="keyword_search()">
					</form>
				</div>

				<div class="mydata_main">
					<table>
						<colgroup>
							<col class="odNum">
							<col class="pdName">
							<col class="odPrice">
							<col class="odDate">
							<col class="dvState">
						</colgroup>
						<tbody align="center">
							<tr>
								<th>주문 번호</th>
								<th>상품명</th>
								<th>결제 금액</th>
								<th>주문 일자</th>
								<th>배송 상태</th>
							</tr>
							<c:choose>
								<c:when test="${empty myOrderList }">
									<tr>
										<td colspan=5><strong>최근 주문한 상품이 없습니다.</strong></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${myOrderList }" varStatus="i">
										<tr>
											<td>${item.orderNum }</td>
											<td><a class="mypage_product"
												href="${contextPath}/goods/productdetail.do?productNum=${item.productNum }">${item.productName }</a></td>
											<td>${item.productSale*item.productQuantity }</td>
											<td>${item.orderDate }</td>
											<td>${item.deliveryState }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

							<tr>
								<td colspan="5" class="page_nation"><c:forEach var="page"
										begin="1" end="10" step="1">
										<c:if test="${section >1 && page==1 }">
											<a class="arrow prev"
												href="${contextPath}/mypage/mypageMain.do?command=${command}&searchType=${searchType}&keyword=${keyword}&section=${section-1}&pageNum=${(section-1)*10-9}"></a>
										</c:if>
										<a class="active"
											href="${contextPath}/mypage/mypageMain.do?command=${command}&searchType=${searchType}&keyword=${keyword}&section=${section}&pageNum=${page}">${(section-1)*10 +page }</a>
										<c:if test="${page ==10 }">
											<a class="arrow next"
												href="${contextPath}/mypage/mypageMain.do?command=${command}&searchType=${searchType}&keyword=${keyword}&section=${section+1}&pageNum=${section*10+1}"></a>
										</c:if>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>