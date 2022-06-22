<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goods}" />
<c:set var="imageFileList" value="${goodsMap.imageFileList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.onload = function() {
	var categoryNum = document.getElementById("p_mainNum").value;
	fn_category(categoryNum);
	let test = '${goods.subCategoryName}';
	$("#subCategoryBox").val(test).prop("selected", true);
}

function fn_category(categoryNum) {
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/selectCategory.do",
		data : {
			categoryNum : categoryNum
		},
		success : function(data, textStatus) {
			$("#subCategoryBox").children('option:not(:first)')
					.remove();
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


function fn_update_goods(obj) {
		obj.submit();
}

function readURL(input, preview) {
	//  alert(preview);
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#' + preview).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
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

.admin_container .sidebar .ingoods {
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
	border-top: 2px solid #2b2e4a;
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
<div class="admin_container">
			<h1>관리자 페이지</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>매출 관리</a></li>
						<li><a class="ingoods" href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>

				<form action="${contextPath}/admin/goods/modifyGoods.do" method="post" enctype="multipart/form-data">
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
													<option value="1" ${goods.p_mainNum == '1' ? 'selected="selected"' : '' }>여행가방 하드/소프트</option>
													<option value="2" ${goods.p_mainNum == '2' ? 'selected="selected"' : '' }>배낭/보조가방</option>
													<option value="3" ${goods.p_mainNum == '3' ? 'selected="selected"' : '' }>수납백/편의용품</option>
													<option value="4" ${goods.p_mainNum == '4' ? 'selected="selected"' : '' }>어댑터/전자</option>
													<option value="5" ${goods.p_mainNum == '5' ? 'selected="selected"' : '' }>캠핑용품</option>
													<option value="6" ${goods.p_mainNum == '6' ? 'selected="selected"' : '' }>렌탈</option>
											</select></td>
											<td><input id="mainCategoryName" type="hidden"
												name="mainCategoryName" value="${goods.mainCategoryName }" />
											<input  type="hidden" name="productNum" value="${goods.productNum }" /></td>
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
													<option value="신상"
														${goods.typeName == '신상' ? 'selected="selected"' : '' }>신상</option>
													<option value="중고"
														${goods.typeName == '중고' ? 'selected="selected"' : '' }>중고</option>
											</select></td>
										</tr>

										<tr>
											<td>상품명</td>
											<td><input name="productName" type="text"
												value="${goods.productName }" /></td>
										</tr>

										<tr>
											<td>기업명</td>
											<td><input name="sellerName" type="text"
												value="${goods.sellerName }" /></td>
										</tr>
										<tr>
											<td>옵션1 (ex:레드/블루/퍼플)</td>
											<td><input name="productOption" type="text"
												value="${goods.productOption }" /></td>
										</tr>
										<tr>
											<td>옵션2</td>
											<td><input name="productOption2" type="text"
												value="${goods.productOption2 }" /></td>
										</tr>
										<tr>
											<td>상품 원가</td>
											<td><input name="originPrice" type="text"
												value="${goods.originPrice }" />원</td>
										</tr>

										<tr>
											<td>상품 판매가</td>
											<td><input name="productPrice" type="text"
												value="${goods.productPrice }" />원</td>
										</tr>
										<tr>
											<td>배송비</td>
											<td><input name="productDelivery" type="text"
												value="${goods.productDelivery }" />원</td>
										</tr>

										<tr>
											<td>재고량</td>
											<td><input name="productsStock" type="text"
												value="${goods.productsStock }" />개</td>
										</tr>
										<tr>
											<td>상품 종류</td>
											<td><select name="productDisplay">
													<option value="bestItem"
														${goods.productDisplay == 'bestItem' ? 'selected="selected"' : '' }>bestItem</option>
													<option value="MDPick"
														${goods.productDisplay == 'MDPick' ? 'selected="selected"' : '' }>MDPick</option>
													<option value="NewItem"
														${goods.productDisplay == 'NewItem' ? 'selected="selected"' : '' }>NewItem</option>
											</select></td>
										</tr>
									</table>
								</div>

								<div class="tab_content" id="tab2">
									<table>
										<tr>
											<td>상품 소개</td>
											<td><textarea class="productDetail" name="productDetail">${goods.productDetail }</textarea></td>
										</tr>
									</table>
								</div>

								<div class="tab_content" id="tab3">
									<table>
										<tr>
											<c:forEach var="item" items="${imageFileList }"
												varStatus="itemNum">
												<c:choose>
													<c:when test="${item.fileType=='main' }">
														<tr>
															<td>메인 이미지</td>
															<td><input type="file" id="main_image" name="main"
																onchange="readURL(this,'preview${itemNum.count}');" /><br></td>
															<td><img id="preview${itemNum.count }" width=200
																height=200
																src="${contextPath}/download.do?productNum=${item.productNum}&fileName=${item.fileName}" />
															</td>
														</tr>
														<tr>
															<td><br></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr id="${itemNum.count-1}">
															<td>상세 이미지${itemNum.count-1 }</td>
															<td><input type="file"
																name="detail${itemNum.count-1 }" id="detail_image"
																onchange="readURL(this,'preview${itemNum.count}');"/><br></td>
															<td><img id="preview${itemNum.count }" width=200
																height=200
																src="${contextPath}/download.do?productNum=${item.productNum}&fileName=${item.fileName}">
															</td>
															<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
															<%-- <td><input type="button" value="삭제"
																onClick="deleteImageFile('${itemNum.count-1}')" /></td> --%>
														</tr>
														<tr>
															<td><br></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tr>
									</table>
								</div>

							</div>
						</div>
						<div class="clear">
						<table>
							<tr>
								<td align=center>
									<input type="button" value="상품 정보 수정" onClick="fn_update_goods(this.form)">
									<input type="button" value="삭제" onclick="location.href='${contextPath}/admin/goods/deleteGoods.do?productNum=${goods.productNum }'">
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