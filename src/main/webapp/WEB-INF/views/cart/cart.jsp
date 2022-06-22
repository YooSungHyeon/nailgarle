<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="myCartList" value="${cartMap.myCartList}" />
<c:set var="myGoodsList" value="${cartMap.myGoodsList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<style>
.layout{
	padding-top:40px;
}
#cart{
	width: 1100px;
}
#cart a{
	text-decoration: none;
}
#cart h2{
	text-align: center;
	font-size: 30px;
	margin: 50px 0;
}
.tbl_col {
    table-layout: fixed;
    clear: both;
    width: 100%;
    border-collapse: collapse;
}
.tbl_col caption {
    padding: 10px 0;
    color: #181818;
    font-weight: bold;
    text-align: left;
}
.tbl_col th {
    padding: 12px 0;
    border-top: 1px solid #dcdcdc;
    border-bottom: 1px solid #dcdcdc;
    color: #444;
    font-size: 13px;
    font-weight: bold;
    text-align: center;
}
.tbl_col td {
    padding: 13px 0;
    border-bottom: 1px solid #dcdcdc;
    color: #837d81;
    font-size: 13px;
    text-align: center;
    vertical-align: middle;
}
.tbl_col td * {
    vertical-align: middle;
}

.tbl_col td p#discount{
	text-decoration: line-through;
	color: red;
	margin: 0;
}
.tbl_col td a {
    color: #0d0d0d;
    font-size: inherit;
}

#cart .box_qty {
    display: inline-block;
}
.box_qty {
    position: relative;
    width: 53px;
    border: 1px solid #dcdcdc;
    text-align: left;
}
.box_qty .input {
    width: 24px !important;
    height: 23px !important;
    padding: 0 5px;
    border: 0 !important;
    font-size: 11px !important;
    ime-mode: disabled;
}
.box_qty .btn_ea {
    position: absolute;
    right: 0;
    top: 0;
    border-left: 1px solid #ccc;
}
.box_qty .btn_ea p{
	margin: 0;
}

.box_qty .btn_ea .up {
    border-bottom: 1px solid #ccc;
}
.box_qty .btn_ea p, .btn_ea a {
    font-size: 0;
    line-height: 0;
}
.box_qty .btn_ea p, .btn_ea a {
    font-size: 0;
    line-height: 0;
}
#cart .tbl_col td .btn_edit {
    display: inline-block;
    width: 30px;
    height: 23px;
    border: 1px solid #ccc;
    background: #fff;
}
#cart .tbl_col td .btn_edit a {
    font-size: 11px;
    line-height: 25px;
}
#cart .tbl_col td .btn_wishdel {
    display: block;
    width: 55px;
    margin: 5px auto 0;
    border: 1px solid #c1c1c1;
    background: #fff;
    letter-spacing: -1px;
}
#cart .tbl_col td .btn_wishdel a {
    display: block;
    height: 23px;
    color: #837d81;
    font-size: 11px;
    line-height: 25px;
}
.tbl_price {
    position: relative;
    padding: 30px 10px 30px 30px;
    border-bottom: 1px solid #dbdbdb;
    background: #f9f9f9;
    text-align: right;
}
.tbl_price .delivery_msg {
    position: absolute;
    left: 30px;
    top: 50%;
    z-index: 10;
    margin-top: -7px;
    text-align: left;
    color: #181818;
}
.tbl_price table {
    width: 100%;
}
.hidden {
    visibility: hidden;
    overflow: hidden;
    width: 0 !important;
    height: 0 !important;
    margin: 0 !important;
    padding: 0 !important;
    font-size: 0;
    line-height: 0;
}
.tbl_price table th {
    padding: 2px 0;
    color: #181818;
    font-weight: normal;
    text-align: right;
}
.tbl_price table td {
    padding: 2px 0;
    color: #181818;
    text-align: right;
}
.tbl_price table td .price {
    color: #f46665;
    font-weight: bold;
}
#cart .btn {
    overflow: hidden;
    margin: 0;
    padding: 15px 0;
    width: 100%;
}
#cart .check {
    float: left;
    padding-top: 20px;
}
.box_btn {
    display: inline-block;
    *display: inline;
    *zoom: 1;
    overflow: hidden;
    text-align: center;
    vertical-align: top;
}
.box_btn * {
    appearance: none;
    display: inline-block;
    min-width: 110px;
    height: 40px;
    box-sizing: border-box;
    font-family: dotum, 돋움, sans-serif;
    font-size: 12px;
    text-align: center;
    line-height: 40px;
    cursor: pointer;
    color: black !important;
    margin: 0px;
    padding: 0px 10px;
    border-width: 1px;
    border-style: solid;
    border-color: blue;
    border-image: initial;
    outline: 0px;
    background: #9feeff;
}
.box_btn.large * {
    min-width: 180px;
    height: 50px;
    font-size: 14px;
    font-weight: bold;
    line-height: 50px;
    letter-spacing: -0.075em;
}
#cart .order {
    float: right;
}
.box_btn.white2 * {
    border: 1px solid #dcdcdc;
    background: #fff;
    color: #424242 !important;
}
.box_btn.middle * {
    min-width: 100px;
    height: 27px;
    line-height: 27px;
}
</style>
</head>
<body>
<div class="layout">
		<div id="cart">
			<h2>장바구니</h2>
			<form name="cartFrm" style="margin: 0px">

				<table class="tbl_col">
					<caption class="hidden">장바구니</caption>
					<colgroup>
						<col style="width: 5%;">
						<col style="width: 8%;">
						<col>
						<col style="width: 18%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 8%;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="selectall" onclick="selectAll(this)" checked></th>
							<th scope="col" colspan="2">상품명</th>
							<th scope="col">옵션</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col">배송료</th>
							<th scope="col">총금액</th>
							<th scope="col">적립금</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>							
					<c:set var="allPrice" value="0" />	
					<c:set var="deliveryPrice" value="0" />									
				<c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
					<c:set var="qty" value="${myCartList[cnt.index].cartQuantity}" />
					<c:set var="allPrice" value="${allPrice+item.productPrice*qty}" />
					<c:set var="deliveryPrice" value="${deliveryPrice+item.productDelivery}" />					
					<tbody>
						<tr>
							<td><input type="checkbox" name="p_chk" id="cno" value="${myCartList[cnt.index].cartNum}" class="con_243070" onclick="checkSelectAll()" checked></td>
							<td><a href=""><img	src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}  " width="70" height="70"></a></td>
							<td class="left"><a href="${contextPath}/goods/productdetail.do?productNum=${item.productNum }">${item.productName}</a></td>
							<td class="left">${myCartList[cnt.index].productOption}</td>
							<td><p id="discount">${item.originPrice}원</p>
								${item.productPrice}원
							</td>
							<td class="qty">
								<div class="box_qty">
									<input type="text" name="buy_qty" value="${qty}" class="input"	id="buy_ea${cnt.index}">
									<div class="btn_ea">
										<p class="up">
											<a href="${contextPath}/cart/modifyCartQty.do?state=up&cart_goods_qty=${qty}&productNum=${item.productNum}"><img src="${contextPath}/resources/image/ea_up.gif"	alt="수량추가" ></a>
										</p>
										<p class="down">
											<a href="${contextPath}/cart/modifyCartQty.do?state=down&cart_goods_qty=${qty}&productNum=${item.productNum}"><img src="${contextPath}/resources/image/ea_down.gif" alt="수량감소" ></a>
										</p>
									</div>
								</div> <span class="btn_edit"><a href="javascript:edit_qty(${cnt.index}, ${item.productNum})">변경</a></span>
							</td>
							<td>${item.productDelivery} 원</td>
							<td><strong>${item.productPrice*qty}원</strong></td>
							<fmt:parseNumber var="percent" value="${item.productPrice*qty/100}" integerOnly="true" />
							<td>${percent} 원</td>
							<td><span class="btn_wishdel"><a href="${contextPath}/cart/removeCartGood.do?cartNum=${myCartList[cnt.index].cartNum}">삭제</a></span></td>
						</tr>
					</tbody>
				</c:forEach>
				</table>

				<div class="tbl_price">

					<p class="delivery_msg">
						배송비는 <strong>50,000원</strong> 이상 구매 시 무료배송 적용됩니다.
					</p>

					<table>
						<caption class="hidden">총 주문 가격</caption>
						<colgroup>
							<col style="width: 85%;">
							<col style="width: 15%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">주문금액합계 :</th>
								<td>${allPrice} 원</td>
							</tr>
							<c:choose>
								<c:when test="${ allPrice>=50000 }">
									<tr>
										<th scope="row">배송료 :</th>
											<td><span id="dlv_prc_cart">0 원</span></td>											
											<c:set var="deliveryPrice" value="0" />	
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th scope="row">배송료 :</th>
											<td><span id="dlv_prc_cart">${deliveryPrice} 원</span></td>
									</tr>
								</c:otherwise>
							</c:choose>
							<tr>
								<th scope="row" class="total">총 결제금액 :</th>
								<td><span class="price" id="total_order_price_cartlist">${allPrice+deliveryPrice}</span>
									원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 장바구니 버튼 -->
				<div class="btn">
					<div class="check">
						<span class="box_btn middle white2"><a href="javascript:removeCheck()">선택삭제</a></span> <span
							class="box_btn middle white2"><a href="${contextPath}/cart/removeAllCartGoods.do">장바구니 비우기</a></span>
					</div>
					<div class="order">
						<span class="box_btn large white"><a href="${contextPath}/main/main.do">계속 쇼핑하기</a></span> <span
							class="box_btn large pink"><a href="javascript:fn_order_select_cart_goods()">선택상품 주문하기</a></span> <span
							class="box_btn large"><a href="javascript:fn_order_all_cart_goods()">전체상품 주문하기</a></span>
					</div>
				</div>
			</form>

		</div>
</div>
<script type="text/javascript">
function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes = document.querySelectorAll('input[name="p_chk"]');
	  // 선택된 체크박스
	  const checked = document.querySelectorAll('input[name="p_chk"]:checked');
	  // select all 체크박스
	  const selectAll = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}

	function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('p_chk');	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
function edit_qty(qty_id, productNum){

	var qty = 'buy_ea'+qty_id;
	var formObj = document.createElement("form");
	var i_qty = document.createElement("input");
	var i_productNum = document.createElement("input");

	i_qty.name = "cart_goods_qty";
	i_productNum.name = "productNum";
	
	i_qty.value = document.getElementById(qty).value;
	
	if(i_qty.value <= 0){
		alert("0보다 큰 숫자를 입력해주세요.");
		return false;
	}
	i_productNum.value = productNum;
	
	formObj.appendChild(i_qty);
	formObj.appendChild(i_productNum);
	
	document.body.appendChild(formObj);
	formObj.method = "post";
	formObj.action = "${contextPath}/cart/modifyCartQty.do";
	formObj.submit();
	
}

function removeCheck()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="p_chk"]:checked';
	  const selectedEls = document.querySelectorAll(query);
	  let result = '';
	  selectedEls.forEach((el) => {
	    result += el.value + '-';
	  });
	  var formObj = document.createElement("form");
      var i_cartNum = document.createElement("input");
      
	  i_cartNum.name = "cartNum";
	  i_cartNum.value = result;
	  
      formObj.appendChild(i_cartNum);	
      document.body.appendChild(formObj);
	  formObj.method = "post";
	  formObj.action = "${contextPath}/cart/removeCartGoods.do";
	  formObj.submit();
}

function fn_order_select_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.cartFrm;
	var buy_qty=objForm.buy_qty;
	var checked_goods=objForm.p_chk;
	var length=checked_goods.length;
	
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=buy_qty[i].value;
				buy_qty[i].value="";
				buy_qty[i].value=order_goods_id+":"+order_goods_qty;
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=buy_qty.value;
		buy_qty.value=order_goods_id+":"+order_goods_qty;
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}


function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.cartFrm;
	var buy_qty=objForm.buy_qty;
	var checked_goods=objForm.p_chk;
	var length=checked_goods.length;
	
	if(length>1){
		for(var i=0; i<length;i++){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=buy_qty[i].value;
				buy_qty[i].value="";
				buy_qty[i].value=order_goods_id+":"+order_goods_qty;
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=buy_qty.value;
		buy_qty.value=order_goods_id+":"+order_goods_qty;
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}

</script>
</body>
</html>