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

	function fn_seller_order_container_search() {
		var seller_order_container_search = document.seller_order_container_search;

		searchType = seller_order_container_search.searchType.value;
		keyword = seller_order_container_search.keyword.value;
		beginDate = seller_order_container_search.searchStartDate.value;
		endDate = seller_order_container_search.searchEndDate.value;

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

		i_command.value = "seller_order_container_search";
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
		formObj.action = "${contextPath}/seller/order/sellerOrderMain.do";
		formObj.submit();
	}

	// 주문 상태 수정
	function fn_modify_order_state(orderNum, select_id) {
		var s_delivery_state = document.getElementById(select_id);
		var index = s_delivery_state.selectedIndex;
		var value = s_delivery_state[index].value;
		//console.log("value: "+value );

		$
				.ajax({
					type : "post",
					async : false,
					url : "${contextPath}/seller/order/modifyDeliveryState.do",
					data : {
						orderNum : orderNum,
						deliveryState : value
					},
					success : function(data, textStatus) {
						if (data.trim() == 'mod_success') {
							alert("주문 정보를 수정했습니다.");
							location.href = "${contextPath}/seller/order/sellerOrderMain.do";
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

.seller_container {
	width: 1250px;
}

.seller_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.seller_container .sidebar {
	width: 250px;
	float: left;
}

.seller_container .sidebar .seller_img {
	padding-right: 20px;
}

.seller_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.seller_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.seller_container .sidebar .insellerOrderList {
	font-weight: 800;
}

.seller_container nav {
	margin-top: 32px;
}

.seller_container ul {
	padding-left: 0;
}

.seller_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.seller_order_container {
	text-align: center;
}

.seller_order_container h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.seller_order_container table {
	width: 950px;
}

/* 판매자 페이지 주문/배송 관리 tr, th, td 태그 */
.seller_container .sellerdata_order th {
	background: #F4A460;
	color: #fff;
}

.seller_container .sellerdata_order td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.seller_container .sellerdata_order tr:nth-of-type(odd) {
	background: #eee;
}

/* 판매자 페이지 주문/배송 관리 li 태그 */
.seller_container .sellerdata_order li {
	padding: 0;
	font-size: 14px;
	text-align: left;
}

/* 판매자 페이지 주문/배송 관리 ul 태그 */
.seller_container .sellerdata_order ul {
	margin: 0;
}

/* 판매자 페이지 주문/배송 관리 수정버튼 */
.seller_container .sellerdata_order .order_modify_btn {
	display: block;
    margin-bottom: 5px;
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

.modal-overlay {
	display: none;
	width: 100%;
	height: 150%;
	position: absolute;
	left: 0;
	top: 0;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

.modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

.title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

.title h2 {
	display: inline;
}

.close-area {
	display: inline;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

.content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="layout">
		<!-- body부분 삽입-->
		<div class="seller_container">
			<h1>판매자 페이지</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/seller/goods/sellerGoodsMain.do"><img
								class="seller_img"
								src="${contextPath}/resources/image/seller_product.svg" />물품 관리</a></li>
						<li><a class="insellerOrderList"
							href="${contextPath}/seller/order/sellerOrderMain.do"><img
								class="seller_img"
								src="${contextPath}/resources/image/seller_order.svg" />주문/배송
								관리</a></li>
						<li><a
							href="${contextPath}/seller/rental/sellerRentalMain.do"><img
								class="seller_img"
								src="${contextPath}/resources/image/seller_rental.svg" />렌탈 관리</a></li>
						<li><a
							href="${contextPath}/seller/sellerPwCheck.do?seller=update"><img
								class="seller_img"
								src="${contextPath}/resources/image/seller_info.svg" />사업자 정보수정</a></li>
						<li><a
							href="${contextPath}/seller/sellerPwCheck.do?seller=delete"><img
								class="seller_img"
								src="${contextPath}/resources/image/seller_unsubscribe.svg" />사업자
								탈퇴</a></li>
					</ul>
				</nav>
			</div>
			<div class="seller_order_container">
				<h4>주문조회</h4>

				<!-- search -->
				<form name="seller_order_container_search">
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
											<option value="ordererName">주문자</option>
											<option value="receiverName">수령자</option>
											<option value="deliveryState">배송상태</option>
										</select> <input type="text" class="keyword" id="keyword"
											name="keyword" /> <input type="button" class="search_btn"
											onClick="fn_seller_order_container_search()">
									</div>
								</td>
							</tr>
						<tbody>
					</table>
				</form>
				<div class="sellerdata_order">
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
													<c:if
														test="${item.deliveryState != '주문취소완료' || item.deliveryState != '반품처리완료' || item.deliveryState != '교환처리완료'}">
														<option value="주문접수중"
															${item.deliveryState == '주문접수중' ? 'selected="selected"' : '' }>주문접수중</option>
														<option value="배송중"
															${item.deliveryState == '배송중' ? 'selected="selected"' : '' }>배송중</option>
														<option value="배송완료"
															${item.deliveryState == '배송완료' ? 'selected="selected"' : '' }>배송완료</option>
														<option value="주문취소"
															${item.deliveryState == '주문취소' ? 'selected="selected"' : '' }>주문취소</option>
														<option value="반품접수중"
															${item.deliveryState == '반품접수중' ? 'selected="selected"' : '' }>반품접수중</option>
														<option value="교환접수중"
															${item.deliveryState == '교환접수중' ? 'selected="selected"' : '' }>교환접수중</option>
													</c:if>
													<option value="주문취소완료"
														${item.deliveryState == '주문취소완료' ? 'selected="selected"' : '' }>주문취소완료</option>
													<c:if test="${item.deliveryState == '주문취소완료' }">
														<p>주문취소완료</p>
													</c:if>
													<option value="반품처리완료"
														${item.deliveryState == '반품처리완료' ? 'selected="selected"' : '' }>반품처리완료</option>
													<c:if test="${item.deliveryState == '반품처리완료' }">
														<p>반품처리완료</p>
													</c:if>
													<option value="교환처리완료"
														${item.deliveryState == '교환처리완료' ? 'selected="selected"' : '' }>교환처리완료</option>
													<c:if test="${item.deliveryState == '교환처리완료' }">
														<p>교환처리완료</p>
													</c:if>
											</select>
											<td><input class="order_modify_btn" type="button"
												value="주문수정"
												onClick="fn_modify_order_state('${item.orderNum}','s_delivery_state${i.index}')">
												<c:if test="${item.deliveryState == '주문취소' }">
													<input class="order_modify_btn" type="button" value="취소처리"
														onClick="fn_modify_order_state('${item.orderNum}','s_delivery_state${i.index}')">
												</c:if> <c:if test="${item.deliveryState == '반품접수중'}">
													<input class="order_modify_btn" type="button" value="반품처리"
														onClick="fn_modify_order_state('${item.orderNum}','s_delivery_state${i.index}')">
												</c:if> <c:if test="${item.deliveryState == '교환접수중'}">
													<input class="order_modify_btn" type="button" value="교환처리"
														onClick="fn_modify_order_state('${item.orderNum}','s_delivery_state${i.index}')">
												</c:if>
												<c:if
													test="${item.deliveryState == '반품접수중'  || item.deliveryState == '교환접수중'}">
													<a onclick="orderbtn(${i.index})"><input type="button"
														id="btn-modal${i.index}" value="반품/교환사유 보기" /></a>
												</c:if>
												</td>
											
											<div id="modal${i.index}" class="modal-overlay">
												<div class="modal-window">
													<div class="title">
														<br>
														<h2>${item.deliveryState }</h2>
													</div>
													<div class="content">
														<br>
														<p>상품명: ${item.productName }</p>
														<p>반품사유: ${item.return_Option }</p>
														<p>교환사유: ${item.exchange_Option }</p>
														<p>직접입력: ${item.message }</p>
														<p>구매날짜: ${item.orderDate }</p>
														<br> <br> <br>
														<div class="close-area" onclick="modalOff(${i.index})">닫기</div>
													</div>
												</div>
											</div>

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<tr>
								<td colspan="5" class="page_nation" style="padding-top: 20px;">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${section >1 && page==1 }">
											<a class="arrow prev"
												href="${contextPath}/seller/order/sellerOrderMain.do?.docommand=${command}&beginDate=${beginDate}&endDate=${endDate}&searchType=${searchType}&keyword=${keyword}&section=${section-1}&pageNum=${(section-1)*10-9}"></a>
										</c:if>
										<a class="active"
											href="${contextPath}/seller/order/sellerOrderMain.do?command=${command}&beginDate=${beginDate}&endDate=${endDate}&searchType=${searchType}&keyword=${keyword}&section=${section}&pageNum=${page}">${(section-1)*10 +page }</a>
										<c:if test="${page ==10 }">
											<a class="arrow next"
												href="${contextPath}/seller/order/sellerOrderMain.do?command=${command}&beginDate=${beginDate}&endDate=${endDate}&searchType=${searchType}&keyword=${keyword}&section=${section+1}&pageNum=${section*10+1}"></a>
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
	<script>
	function modalOn(modal) {
	    modal.style.display = "flex"
	}
	function isModalOn(modal) {
	    return modal.style.display === "flex"
	}
	function modalOff(data) {
		var modal = document.getElementById("modal"+data)
	    modal.style.display = "none"
	}
	function orderbtn(data){
	var btnModal = document.getElementById("btn-modal"+data)
	var modal = document.getElementById("modal"+data)
	btnModal.addEventListener(modalOn(modal)
	)}
	
</script>
</body>
</html>