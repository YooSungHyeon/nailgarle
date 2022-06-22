<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_modify_order_state(orderNum, select_id) {
	var s_delivery_state = document.getElementById(select_id);
	var index = s_delivery_state.selectedIndex;
	var value = s_delivery_state[index].value;
	//console.log("value: "+value );

	$.ajax({
				type : "post",
				async : false,
				url : "${contextPath}/admin/order/modifyDeliveryState.do",
				data : {
					orderNum : orderNum,
					deliveryState : value
				},
				success : function(data, textStatus) {
					if (data.trim() == 'mod_success') {
						alert("주문 정보를 수정했습니다.");
						location.href = "${contextPath}//admin/order/adminOrderMain.do";
					} else if (data.trim() == 'failed') {
						alert("다시 시도해 주세요.");
					}

				},
				error : function(data, textStatus) {
					alert("에러가 발생했습니다." + data);
				},
				complete : function(data, textStatus) {
					//alert("작업을완료 했습니다");

				}
			}); //end ajax		
}
</script>
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

.admin_container .sidebar .inorder {
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

.order_container {
	text-align: center;
}

.order_container h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.order_container table {
	width: 950px;
}

/* 관리자 페이지 주문/배송 관리 tr, th, td 태그 */
.admin_container .admindata_order th {
	background: #2b2e4a;
	color: #fff;
}

.admin_container .admindata_order td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.admin_container .admindata_order tr:nth-of-type(odd) {
	background: #eee;
}

/* 관리자 페이지 주문/배송 관리 li 태그 */
.admin_container .admindata_order li {
	padding: 0;
	font-size: 14px;
	text-align: left;
}

/* 관리자 페이지 주문/배송 관리 ul 태그 */
.admin_container .admindata_order ul {
	margin: 0;
}

/* 관리자 페이지 주문/배송 관리 수정버튼 */
.admin_container .admindata_order .order_modify_btn {
	margin-left: 10px;
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
.page_nation {
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
<div class="admin_container">
			<h1>관리자 페이지</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>매출 관리</a></li>
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a class="inorder" href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>
			<div class="order_container">
				<h4>주문조회</h4>
					<div class="order_search">
						<div class="search_allday">
							<input type="radio" name="등록일로 조회" checked="checked"/>주문일로 조회
							<select class="year" name="year">
								<option value="2022" selected>2022</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
							</select>년
							<select class="month" name="month">
								<option value="01" selected>01</option>
								<option value="02">02</option>
								<option value="03">03</option>
							</select>월
							<select class="date" name="date">
								<option value="01" selected>01</option>
								<option value="02">02</option>
								<option value="03">03</option>
							</select>일 - 
							<select class="year" name="year">
								<option value="2022" selected>2022</option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
							</select>년
							<select class="month" name="month">
								<option value="01" selected>01</option>
								<option value="02">02</option>
								<option value="03">03</option>
							</select>월
							<select class="date" name="date">
								<option value="01" selected>01</option>
								<option value="02">02</option>
								<option value="03">03</option>
							</select>일
							<input class="search_btn" type="button">
						</div>
						<div class="keywordform">
							<input type="radio" name="searchType"/>검색으로 조회
							<select class="searchType" name="search_type">
								<option value="전체" selected>전체</option>
								<option value="주문자아이디">주문자 아이디</option>
								<option value="주문자이름">주문자 이름</option>
								<option value="상품명">상품명</option>
							</select>
							<input class="keyword" type="text">
							<input class="search_btn" type="button">
						</div>
					</div>
					<div class="admindata_order">
						<table>
							<colgroup>
								<col class="odNum">
								<col class="odDate">
								<col class="odHistory">
								<col class="dvState">
							</colgroup>
							<tbody align="center">
								<tr>
									<th>주문번호</th>
									<th>주문날짜</th>
									<th>주문내역</th>
									<th colspan="2">배송상태</th>
								</tr>
							<c:choose>
								<c:when test="${empty newOrderList }">
									<tr>
										<td colspan="5"><strong>판매한 상품이 없습니다.</strong></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${newOrderList }" varStatus="i">
										<tr>
											<td>${item.orderNum }</td>
											<td>${item.orderDate }</td>
											<td>
												<ul>
													<li><span>주문자 : </span><span>${item.ordererName }</span></li>
													<li><span>주문자 핸드폰번호 : </span><span>${item.receiverHp1}-${item.receiverHp2}-${item.receiverHp3}</span></li>
													<li><span>수령자 : </span><span>${item.receiverName }</span></li>
													<li><span>수령자 핸드폰번호 : </span><span>${item.receiverHp1}-${item.receiverHp2}-${item.receiverHp3}</span></li>
													<li><span>주문 상품명(개수) : </span><span>${item.productName}(${item.productQuantity})</span></li>
												</ul>
											</td>
											<td><select class="deliveryState" name="deliveryState"
												id="s_delivery_state${i.index }">
													<option value="배송중"
														${item.deliveryState == '주문접수중' ? 'selected="selected"' : '' }>주문접수중</option>
													<option value="배송중"
														${item.deliveryState == '배송중' ? 'selected="selected"' : '' }>배송중</option>
													<option value="배송완료"
														${item.deliveryState == '배송완료' ? 'selected="selected"' : '' }>배송완료</option>
													<option value="주문취소"
														${item.deliveryState == '주문취소' ? 'selected="selected"' : '' }>주문취소</option>
													<option value="반품"
														${item.deliveryState == '반품' ? 'selected="selected"' : '' }>반품</option>
											</select> <input class="order_modify_btn" type="button" value="주문수정"
												onClick="fn_modify_order_state('${item.orderNum}','s_delivery_state${i.index}')">
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>			
							<tr>
								<td colspan="5" class="page_nation" style="padding-top: 20px;">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${secNum >1 && page==1 }">
											<a class="arrow prev" href="${contextPath}/admin/order/adminOrderMain.do?secNum=${secNum-1}&pageNum=1"></a>
										</c:if>
											<a class="active" href="${contextPath}/admin/order/adminOrderMain.do?secNum=${secNum}&pageNum=${page}">${(secNum-1)*10 +page } </a>
										<c:if test="${page ==10 }">
											<a class="arrow next" href="${contextPath}/admin/order/adminOrderMain.do?secNum=${secNum+1}&pageNum=1"></a>
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