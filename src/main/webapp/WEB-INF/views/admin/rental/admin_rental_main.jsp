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

.admin_container {
	width: 1250px;
}

.admin_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.admin_container .sidebar {
	width: 250px;
	float: left;
}

.admin_container .sidebar .admin_img {
	padding-right: 20px;
}

.admin_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.admin_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.admin_container .sidebar .inrental {
	font-weight: 800;
}

.admin_container nav {
	margin-top: 32px;
}

.admin_container ul {
	padding-left: 0;
}

.admin_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.rental_container {
	text-align: center;
}

.rental_container h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.rental_container table {
	width: 950px;
}

/* 관리자 페이지 렌탈 관리 tr, th, td 태그 */
.admin_container .admindata_rental th {
	background: #2b2e4a;
	color: #fff;
}

.admin_container .admindata_rental td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.admin_container .admindata_rental tr:nth-of-type(odd) {
	background: #eee;
}

/* 상품명 a태그 */
.admin_product {
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

/* Search */
.order_search {
	float: left;
	text-align: left;
	margin: 8px 35px;
}

.order_search .search_allday {
	margin-bottom: 6px;
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
.search_btn {
	background: url(${contextPath}/resources/image/search_btn.png);
	background-repeat: no-repeat;
	width: 26px;
	height: 26px;
	border: none;
}

/* page */
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
<div class="admin_container">
			<h1>관리자 페이지</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>매출 관리</a></li>
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a class="inrental" href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>
			<div class="rental_container">
				<h4>렌탈조회</h4>
					<div class="order_search">
						<div class="search_allday">
							<input type="radio" name="등록일로 조회" checked="checked"/>등록일로 조회
							<input type="date">~
							<input type="date">
							<input class="search_btn" type="button">
						</div>
						
						<div class="keywordform">
							<input type="radio" name="searchType"/>검색으로 조회
							<select class="searchType" name="search_type">
								<option value="전체" selected>전체</option>
								<option value="아이디">아이디</option>
								<option value="이름">이름</option>
								<option value="상품명">상품명</option>
							</select>
							<input class="keyword" type="text">
							<input class="search_btn" type="button">
						</div>
					</div>
				<div class="admindata_rental">
					<table>
						<colgroup>
							<col class="rtNum">
							<col class="odName">
							<col class="pdName">
							<col class="pdSale">
							<col class="pdStock">
							<col class="rtDate">
							<col class="rtType">
						</colgroup>
						<tbody align="center">
							<tr>
								<th>렌탈번호</th>
								<th>주문자명</th>
								<th>상품명</th>
								<th>대여료</th>
								<th>수량</th>
								<th>대여날짜</th>
								<th>반납여부</th>
							</tr>
							<c:forEach var="item" items="${rental_list }">
							<tr>
								<td>${item.orderNum }</td>
								<td>${item.ordererName }</td>
								<td><a class="admin_product" href="${contextPath}/goods/productdetail.do?productNum=${item.productNum }">${item.productName }</a></td>
								<td>${item.productSale }원</td>
								<td>${item.productQuantity }개</td>
								<td>${item.rentalStart }~${item.rentalEnd }</td>
								<td>
									<select class="rental_type" name="rental_type">
										<option value="연체" selected>연체</option>
										<option value="대여중">대여중</option>
										<option value="반납완료">반납완료</option>
									</select>
								</td>
							</tr>
							</c:forEach>							
						</tbody>
					</table>
				</div>				
					<table class="all_admin_rental">
						<tbody align="center">
							<tr>
								<td colspan="7" class="page_nation" style="padding-top: 20px;">
									<c:forEach var="page" begin="1"	end="10" step="1">
							        	<c:if test="${secNum >1 && page==1 }">
							         		<a class="arrow prev" href="${contextPath}/admin/rental/adminRentalMain.do?secNum=${secNum-1}&pageNum=1"></a>
							         	</c:if>
											<a class="active" href="${contextPath}/admin/rental/adminRentalMain.do?secNum=${secNum}&pageNum=${page}">${(secNum-1)*10 +page } </a>
							         	<c:if test="${page ==10 }">
							         		<a class="arrow next" href="${contextPath}/admin/rental/adminRentalMain.do?secNum=${secNum+1}&pageNum=1"></a>
							        	</c:if> 
						      		</c:forEach> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
</div>
</body>
</html>