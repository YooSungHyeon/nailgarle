<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script>
	$(document).ready(function() {

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// Datepicker            
		$(".datepicker").datepicker({
			maxDate : 0,
			showButtonPanel : true,
			dateFormat : "yy-mm-dd",
			changeYear : true, //콤보박스에서 년 선택 가능
			changeMonth : true, //콤보박스에서 월 선택 가능  
			onClose : function(selectedDate) {

				var eleId = $(this).attr("id");
				var optionName = "";

				if (eleId.indexOf("StartDate") > 0) {
					eleId = eleId.replace("StartDate", "EndDate");
					optionName = "minDate";
				} else {
					eleId = eleId.replace("EndDate", "StartDate");
					optionName = "maxDate";
				}

				$("#" + eleId).datepicker("option", optionName, selectedDate);
				$(".searchDate").find(".chkbox2").removeClass("on");
			}
		});

		//시작일.
		/* $('#searchStartDate')
				.datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							// 시작일 datepicker가 닫힐때
							// 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
							$("#searchEndDate").datepicker("option",
									"minDate", selectedDate);
							$(".searchDate").find(".chkbox2")
									.removeClass("on");
						}); 
		 */

		//종료일.
		/* $('#searchEndDate')
				.datepicker(
						"option",
						"onClose",
						function(selectedDate) {
							// 종료일 datepicker가 닫힐때
							// 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
							$("#searchStartDate").datepicker("option",
									"maxDate", selectedDate);
							$(".searchDate").find(".chkbox2")
									.removeClass("on");
						}); 
		 */

		$(".dateclick").dateclick(); // DateClick
		$(".searchDate").schDate(); // searchDate
		$('#searchEndDate').datepicker('setDate', 'today'); 
	});

	// Search Date
	jQuery.fn.schDate = function() {
		var $obj = $(this);
		var $chk = $obj.find("input[type=radio]");
		$chk.click(function() {
			$('input:not(:checked)').parent(".chkbox2").removeClass("on");
			$('input:checked').parent(".chkbox2").addClass("on");
		});
	};

	// DateClick
	jQuery.fn.dateclick = function() {
		var $obj = $(this);
		$obj.click(function() {
			$(this).parent().find("input").focus();
		});
	}

	function setSearchDate(start) {

		var num = start.substring(0, 1);
		var str = start.substring(1, 2);

		var today = new Date();

		//var year = today.getFullYear();
		//var month = today.getMonth() + 1;
		//var day = today.getDate();

		var endDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#searchEndDate').val(endDate);

		if (str == 'd') {
			today.setDate(today.getDate() - num);
		} else if (str == 'w') {
			today.setDate(today.getDate() - (num * 7));
		} else if (str == 'm') {
			today.setMonth(today.getMonth() - num);
			today.setDate(today.getDate() + 1);
		}

		var startDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#searchStartDate').val(startDate);

		// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
		$("#searchEndDate").datepicker("option", "minDate", startDate);

		// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
		$("#searchStartDate").datepicker("option", "maxDate", endDate);

	}

	function order_detail_search() {
		var my_order_detail_list = document.my_order_detail_list;

		searchType = my_order_detail_list.searchType.value;
		keyword = my_order_detail_list.keyword.value;
		beginDate = my_order_detail_list.searchStartDate.value;
		endDate = my_order_detail_list.searchEndDate.value;

		var formObj = document.createElement("form");
		var i_command = document.createElement("input");
		var i_beginDate = document.createElement("input");
		var i_endDate = document.createElement("input");
		var i_search_type = document.createElement("input");
		var i_key_word = document.createElement("input");

		i_command.name = "command";
		i_beginDate.name = "beginDate";
		i_endDate.name = "endDate";
		i_search_type.name = "searchType";
		i_key_word.name = "keyword";

		i_command.value = "order_detail_search";
		i_beginDate.value = beginDate;
		i_endDate.value = endDate;
		i_search_type.value = searchType;
		i_key_word.value = keyword;

		formObj.appendChild(i_command);
		formObj.appendChild(i_beginDate);
		formObj.appendChild(i_endDate);
		formObj.appendChild(i_search_type);
		formObj.appendChild(i_key_word);
		document.body.appendChild(formObj);

		formObj.method = "get";
		formObj.action = "${contextPath}/mypage/mypageOrderList.do";
		formObj.submit();
	}
	
	function cancel_order(orderNum) {
		var answer = confirm("주문을 취소하시겠습니까?");
		if (answer == true) {
			var formObj = document.createElement("form");
			var i_orderNum = document.createElement("input");

			i_orderNum.name = "orderNum";
			i_orderNum.value = orderNum;

			formObj.appendChild(i_orderNum);
			document.body.appendChild(formObj);
			formObj.method = "post";
			formObj.action = "${contextPath}/mypage/cancelMyOrder.do";
			formObj.submit();
		}
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

/* 마이페이지 주문/배송의 tr, th, td 태그 */
.order_container .mydata_order th {
	background: #FFC0CB;
	color: #fff;
}

.order_container .mydata_order td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.order_container .mydata_order tr:nth-of-type(odd) {
	background: #eee;
}

/* 칼럼 너비 */
.order_container .mydata_order .odNum {
	width: 10%;
}

.order_container .mydata_order .pdName {
	/* 나머지 자동맞춤 */
	
}

.order_container .mydata_order .odPrice {
	width: 10%;
}

.order_container .mydata_order .odQuantity {
	width: 7%;
}

.order_container .mydata_order .odDate {
	width: 15%;
}

.order_container .mydata_order .ordName {
	width: 15%;
}

.order_container .mydata_order .dvState {
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

/* Search */
.searchBox {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	border: none;
}

.searchCaption {
	overflow: hidden;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -999em;
}

.searchBox ol, ul {
	list-style: none;
}

.searchBox tbody th {
	padding: 20px 10px 20px 35px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: none;
	background: #e6e6e6;
}

.searchBox tbody td {
	padding: 12px 10px 12px 25px;
	border: none;
	background-color: #efefef;
}

.searchDate {
	overflow: hidden;
	margin-bottom: 10px;
	*zoom: 1;
}

.searchDate:after {
	display: block;
	clear: both;
	content: '';
}

.searchDate li {
	padding: 0px;
	position: relative;
	float: left;
	margin: 0 7px 0 0;
}

.searchDate li .chkbox2 {
	display: block;
	text-align: center;
}

.searchDate li .chkbox2 input {
	position: absolute;
	z-index: -1;
}

.searchDate li .chkbox2 label {
	display: block;
	width: 72px;
	height: 26px;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-align: center;
	line-height: 25px;
	text-decoration: none;
	cursor: pointer;
	background: #a5b0b6;
}

.searchDate li .chkbox2.on label {
	background: #ec6a6a;
}

.demi {
	display: inline-block;
	margin: 0 1px;
	vertical-align: middle;
}

.inpType {
	padding-left: 6px;
	height: 24px;
	line-height: 24px;
	border: 1px solid #dbdbdb;
}

.btncalendar {
	display: inline-block;
	width: 22px;
	height: 22px;
	background: url(${contextPath}/resources/image/btn_calendar.gif) center
		center no-repeat;
	text-indent: -999em;
}

.clearfix {
	*zoom: 1;
}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
	overflow: hidden;
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
.order_container .mydata_order .page_nation {
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
						<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=update"><img class="mypage_img" src="${contextPath}/resources/image/mypage_info.svg"/>내정보수정</a></li>
						<li><a href="${contextPath}/mypage/mypagePoint.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_point.svg"/>포인트</a></li>
						<li><a class="inmypageOrderList" href="${contextPath}/mypage/mypageOrderList.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_order.svg"/>주문/배송조회</a></li>
						<%-- <li><a href="${contextPath}/mypage/mypageGrade.do"><img class="mypage_img" src="${contextPath}/resources/image/mypage_grade.svg"/>회원등급조회</a></li> --%>
						<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=delete"><img class="mypage_img" src="${contextPath}/resources/image/mypage_unsubscribe.svg"/>회원탈퇴</a></li>
					</ul>
				</nav>
			</div>
			<div class="order_container">
				<h4>주문내역</h4>

				<!-- search -->
				<form name="my_order_detail_list">
					<table class="searchBox">
						<caption class="searchCaption">조회</caption>
						<colgroup>
							<col width="123px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>조회기간</th>
								<td>
									<ul class="searchDate" style="padding-left: 0px;">
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
												<label for="dateType1">당일</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
												<label for="dateType2">3일</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
												<label for="dateType3">1주</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
												<label for="dateType4">2주</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
												<label for="dateType5">1개월</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
												<label for="dateType6">3개월</label>
										</span></li>
										<li><span class="chkbox2"> <input type="radio"
												name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
												<label for="dateType7">6개월</label>
										</span></li>
									</ul>

									<div class="clearfix">
										<!-- 시작일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchStartDate"
											id="searchStartDate"> <a href="#none"
											class="btncalendar dateclick">달력</a>
										</span> <span class="demi">~</span>
										<!-- 종료일 -->
										<span class="dset"> <input type="text"
											class="datepicker inpType" name="searchEndDate"
											id="searchEndDate"> <a href="#none"
											class="btncalendar dateclick">달력</a>
										</span>
									</div>

									<div class="keywordform" style="margin-top: 10px;">
										<select id="searchType" class="searchType" name="searchType">
											<option value="all">전체</option>
											<option value="productName">상품명</option>
											<option value="ordererName">주문자</option>
											<option value="receiverName">수령자</option>
										</select> 
											<input type="text" class="keyword" id="keyword" name="keyword" /> 
											<input type="button" class="search_btn" onClick="order_detail_search()">
									</div>
								</td>
							</tr>
						<tbody>
					</table>
				</form>
			<div class="mydata_order">
				<table>
					<colgroup>
						<col class="odNum">
						<col class="pdName">
						<col class="odPrice">
						<col class="odQuantity">
						<col class="odDate">
						<col class="ordName">
						<col class="dvState">
					</colgroup>
					<tbody align="center">
						<tr>
							<th>주문번호</th>
							<th>상품명</th>
							<th>결제 금액</th>
							<th>수량</th>
							<th>주문 일자</th>
							<th>주문자/수령자</th>
							<th>배송 상태</th>
						</tr>
						<c:choose>
							<c:when test="${empty myOrderList }">
								<tr>
									<td colspan="8"><strong>최근 주문한 상품이 없습니다.</strong></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${myOrderList }" varStatus="i">
									<tr>
										<td>${item.orderNum }</td>
										<td><a class="mypage_product" href="${contextPath}/goods/productdetail.do?productNum=${item.productNum }">${item.productName }</a></td>
										<td>${item.productSale*item.productQuantity }</td>
										<td>${item.productQuantity }</td>
										<td>${item.orderDate }</td>
										<td>${item.ordererName }<br>${item.receiverName }
										<td>${item.deliveryState }<br> 
										<c:choose>
											<c:when test="${item.deliveryState=='주문접수중'}">
										<a href="${contextPath}/mypage/proReturnExchange.do?orderNum=${item.orderNum }&productNum=${item.productNum}">
										<input type="button" value="반품/교환신청" /></a><br>
											
												<input type="button"
													onClick="cancel_order('${item.orderNum}')" value="주문취소" />
											</c:when>
											<c:otherwise>
											<a><input type="button" value="반품/교환신청" disabled/></a><br>
												<input type="button"
													onClick="cancel_order('${item.orderNum}')" value="주문취소"
													disabled />
											</c:otherwise>
										</c:choose></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<tr>
							<td colspan="8" class="page_nation"><c:forEach var="page"
									begin="1" end="10" step="1">
									<c:if test="${section >1 && page==1 }">
										<a class="arrow prev" href="${contextPath}/mypage/mypageOrderList.do?command=${command}&beginDate=${beginDate}&endDate=${endDate}&searchType=${searchType}&keyword=${keyword}&section=${section-1}&pageNum=${(section-1)*10-9}"></a>
									</c:if>
										<a class="active" href="${contextPath}/mypage/mypageOrderList.do?command=${command}&beginDate=${beginDate}&endDate=${endDate}&searchType=${searchType}&keyword=${keyword}&section=${section}&pageNum=${page}">${(section-1)*10 +page }</a>
									<c:if test="${page ==10 }">
										<a class="arrow next" href="${contextPath}/mypage/mypageOrderList.do?command=${command}&beginDate=${beginDate}&endDate=${endDate}&searchType=${searchType}&keyword=${keyword}&section=${section+1}&pageNum=${section*10+1}"></a>
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
			<br>

			<%-- <div class="order_container">
				<h4>렌탈내역</h4>
				<table>
					<tbody align="center">
						<tr>
							<th>렌탈번호</th>
							<th colspan="2">상품명</th>
							<th>주문금액</th>
							<th>수량</th>
							<th>대여일자</th>
							<th>반납일자</th>
							<th>상태</th>
						</tr>
						<tr>
							<td>001</td>
							<td><img width="50px" height="80px" alt="#"
								src="${contextPath}/resources/image/item1.JPG"></td>
							<td>여행용 캐리어</td>
							<td>5,000원</td>
							<td>1개</td>
							<td>2022-04-08</td>
							<td>2022-04-11</td>
							<td><span>대여중</span></td>
						</tr>
					</tbody>
				</table>
			</div> --%>
		</div>
	</div>
</body>
</html>