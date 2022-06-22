<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function fn_category(categoryNum) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/seller/goods/selectCategory.do",
			data : {
				categoryNum : categoryNum
			},
			success : function(data, textStatus) {
				$("#subCategoryBox").children('option:not(:first)').remove();
				var text = $("#p_mainNum option:checked").text();
				var mainName = document.getElementById("mainCategoryName");
				mainName.value = text;
				var jsonInfo = JSON.parse(data);
				for ( var i in jsonInfo.category) {
					$("#subCategoryBox").append(
							'<option value="'+jsonInfo.category[i]+'">'
									+ jsonInfo.category[i] + '</option>');
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

	$(document).ready(function() {

		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

	});

	var cnt = 0;
	function fn_addFile1() {
		if (cnt == 0) {
			$("#input_file1")
					.append(
							"<br>"
									+ "<input type='file' name='main' id='in_main_image' />");
		}
		cnt++;
	}
	var cnt2 = 0;
	function fn_addFile2() {
		if (cnt2 < 5) {

			$("#input_file2").append(
					"<br>" + "<input type='file' name='detail"+cnt2+"' />");
		}
		cnt2++;
	}

	function fn_add_new_goods(obj) {
		fileName = $('#in_main_image').val();
		if (fileName != null && fileName != undefined) {
			obj.submit();
		} else {
			alert("메인 이미지는 반드시 첨부해야 합니다.");
			return;
		}

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

.seller_container .sidebar .insellerGoodsList {
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

.clear {
	clear: both;
	margin: 0;
	text-align: -webkit-center;
	width: 520px;
}

ul.tabs {
	float: left;
}

ul.tabs li {
	width: 157px;
	display: table-cell;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	border-bottom: 1px solid #bbb;
	text-align: center;
}

ul.tabs li a {
	padding: 0px 20px;
	color: #bbb;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
	display: block;
}

ul.tabs a:hover {
	color: #2e9cdf;
	cursor: pointer;
}

ul.tabs li.active {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #F4A460;
	border-bottom: 1px solid #ffffff;
}

ul.tabs li.active a {
	color: #555;
}

.tab_container {
	width: 900px;
	border-top-color: currentColor;
	border-top-width: medium;
	border-top-style: none;
	float: left;
	padding: 10px 20px 0 0;
}

.tab_container table {
	margin: 0;
}

.tab_container #tab1 td {
	padding: 0 0 5px 0;
	width: 230px;
}

.tab_container #tab1 select {
	width: 181px;
}

.tab_container #tab3 .tab3_td {
	padding: 0 0 5px 0;
	width: 230px;
}

.tab_container #tab3 .tab3_file_td {
	padding: 0 0 5px 0;
}

.tab_content {
	padding: 10px 10px 20px;
	line-height: 1.8em;
	font-size: 0.75em;
	min-height: 400px;
}

.tab_content p {
	margin: 10px 0px 0px;
}

.tab_content img {
	margin: 10px;
	padding: 5px;
}

.tab_content .writer {
	margin: 10px 0px;
	padding: 5px;
	color: rgb(0, 0, 0);
	font-size: 1.2em;
	font-weight: bold;
	border-bottom-color: rgb(255, 153, 0);
	border-bottom-width: 1px;
	border-bottom-style: solid;
}

#tab2 .productDetail {
	width: 400px;
	height: 400px;
	resize: none;
	margin-left: 35px;
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
						<li><a class="insellerGoodsList" href="${contextPath}/seller/goods/sellerGoodsMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_product.svg" />물품 관리</a></li>
						<li><a href="${contextPath}/seller/order/sellerOrderMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_order.svg" />주문/배송 관리</a></li>
						<li><a href="${contextPath}/seller/rental/sellerRentalMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_rental.svg" />렌탈 관리</a></li>
						<li><a href="${contextPath}/seller/sellerPwCheck.do?seller=update"><img class="seller_img" src="${contextPath}/resources/image/seller_info.svg" />사업자 정보수정</a></li>
						<li><a href="${contextPath}/seller/sellerPwCheck.do?seller=delete"><img class="seller_img" src="${contextPath}/resources/image/seller_unsubscribe.svg" />사업자 탈퇴</a></li>
					</ul>
				</nav>
			</div>
			
				<form action="${contextPath}/seller/goods/addNewGoods.do" method="post" enctype="multipart/form-data">
					<div class="tab_container">
						<div class="tab_container" id="container">
							<ul class="tabs">
								<li><a href="#tab1">상품 정보</a></li>
								<li><a href="#tab2">상품 소개</a></li>
								<li><a href="#tab3">파일 첨부</a></li>
							</ul>
							<div class="tab_container">
								<div class="tab_content" id="tab1">
									<table>
										<tr>
											<td width="150">주 카테고리</td>
											<td><select name="p_mainNum" id="p_mainNum" onchange="fn_category(this.value)">
													<option value="-" selected>-</option>
													<option value="1">여행가방 하드/소프트</option>
													<option value="2">배낭/보조가방</option>
													<option value="3">수납백/편의용품</option>
													<option value="4">어댑터/전자</option>
													<option value="5">캠핑용품</option>
													<option value="6">렌탈</option>
											</select>
											</td>
											<td>
												<input id="mainCategoryName" type="hidden" name="mainCategoryName" value="" />
											</td>
										</tr>
												
										<tr>
											<td>보조 카테고리</td>
											<td><select name="subCategoryName" id="subCategoryBox">
													<option value="-" selected>-</option>
											</select></td>
										</tr>

										<tr>
											<td>타입</td>
											<td><select name="typeName" id="typeName">
													<option value="신상" selected>신상</option>
													<option value="중고" selected>중고</option>
											</select></td>
										</tr>

										<tr>
											<td>상품명</td>
											<td><input name="productName" type="text" /></td>
										</tr>

										<tr>
											<td>기업명</td>
											<td><input name="sellerName" type="text" /></td>
										</tr>

										<tr>
											<td>옵션1 (ex:레드/블루/퍼플)</td>
											<td><input name="productOption" type="text" value="n" /></td>
										</tr>
										<tr>
											<td>옵션2</td>
											<td><input name="productOption2" type="text" value="n" /></td>
										</tr>

										<tr>
											<td>상품 원가</td>
											<td><input name="originPrice" type="text" /> 원</td>
										</tr>

										<tr>
											<td>상품 판매가</td>
											<td><input name="productPrice" type="text" /> 원</td>
										</tr>

										<tr>
											<td>배송비</td>
											<td><input name="productDelivery" type="text" /> 원</td>
										</tr>

										<tr>
											<td>재고량</td>
											<td><input name="productsStock" type="text" /> 개</td>
										</tr>

									</table>
								</div>

								<div class="tab_content" id="tab2">
									<table>
										<tr>
											<td>상품 소개</td>
											<td><textarea class="productDetail" name="productDetail"></textarea></td>
										</tr>
									</table>
								</div>

								<div class="tab_content" id="tab3">
									<table>
										<tr>
											<td class="tab3_td" style="padding-right: 32px;">메인이미지 첨부</td>
											<td class="tab3_file_td" align="left">
												<input type="button" value="파일 추가" onClick="fn_addFile1()" /></td>
											<td>
												<div style="padding-left: 10px;" id="input_file1"></div>
											</td>
										</tr>
									</table>
									<table>
										<tr>
											<td class="tab3_td">상세설명이미지 첨부</td>
											<td class="tab3_file_td" align="left">
												<input type="button" value="파일 추가" onClick="fn_addFile2()" /></td>
											<td>
												<div style="padding-left: 10px;" id="input_file2"></div>
											</td>
										</tr>
									</table>
								</div>

							</div>
						</div>
						<div class="clear">
						<table>
							<tr>
								<td align=center>
									<!--   <input type="submit" value="상품 등록하기"> -->
									<input type="button" value="상품 등록하기" onClick="fn_add_new_goods(this.form)">
									<input type="button" value="취소" onclick="history.back()">
								</td>
							</tr>
						</table>
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>