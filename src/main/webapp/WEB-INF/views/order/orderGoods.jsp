<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">

function reserve(){
	var len = new Array();
	<c:forEach var="item" items="${myOrderList }" varStatus="status">
		len.push({product : "${item.productName}"});
	</c:forEach>
	var proName = document.getElementById("product").value + " 포함 총 " + len.length + " 개";
	
	IMP.init('imp77667044');
	IMP.request_pay({
		pay_method : 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : proName,
		amount : /* ${AllPrice} */ 100,
		buyer_name : document.getElementById('orderer_name').value,
		buyer_tel : document.getElementById('hp1').value +"-"+document.getElementById('hp2').value + "-" + document.getElementById('hp3').value
		
	},
	
	function (rsp) {
    console.log(rsp);
    if (rsp.success) {
      var msg = '결제가 완료되었습니다.';
      alert(msg);
      document.getElementById("reserve").function(fn_process_pay_order());
      
    } else {
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;
      alert(msg);
    }
});
}

function fn_process_pay_order() {

	var formObj = document.createElement("form");
	var i_receiver_name = document.createElement("input");
	var i_orderer_name = document.createElement("input");

	var i_receiver_hp1 = document.createElement("input");
	var i_receiver_hp2 = document.createElement("input");
	var i_receiver_hp3 = document.createElement("input");

	var i_receiver_tel1 = document.createElement("input");
	var i_receiver_tel2 = document.createElement("input");
	var i_receiver_tel3 = document.createElement("input");

	var i_delivery_zipcode = document.createElement("input");
	var i_delivery_address1 = document.createElement("input");
	var i_delivery_address2 = document.createElement("input");
	var i_delivery_message = document.createElement("input");
	var i_delivery_method = document.createElement("input");
	var i_pay_method = document.createElement("input");
	var i_card_com_name = document.createElement("input");
	var i_card_pay_month = document.createElement("input");
	var i_pay_orderer_hp_num = document.createElement("input");
	var i_point = document.createElement("input");

	i_receiver_name.name = "receiver_name";
	i_orderer_name.name = "orderer_name";
	i_receiver_hp1.name = "receiver_hp1";
	i_receiver_hp2.name = "receiver_hp2";
	i_receiver_hp3.name = "receiver_hp3";

	i_receiver_tel1.name = "receiver_tel1";
	i_receiver_tel2.name = "receiver_tel2";
	i_receiver_tel3.name = "receiver_tel3";

	i_delivery_zipcode.name = "delivery_zipcode";
	i_delivery_address1.name = "delivery_address1";
	i_delivery_address2.name = "delivery_address2";
	i_delivery_message.name = "delivery_message";
	i_delivery_method.name = "delivery_method";
	i_pay_method.name = "pay_method";
	i_card_com_name.name = "card_com_name";
	i_card_pay_month.name = "card_pay_month";
	i_pay_orderer_hp_num.name = "pay_orderer_hp_num";
	i_point.name = "point";

	i_receiver_name.value = document.getElementById("receiver_name").value;
	i_orderer_name.value = document.getElementById("orderer_name").value;
	
	if(i_receiver_name.value == ""){
		alert("받으실 분 성함을 입력해주세요.");
		document.getElementById("receiver_name").focus();
		return false;
	}
	if(i_orderer_name.value == ""){
		alert("주문자 성함을 입력해주세요.");
		document.getElementById("orderer_name").focus();
		return false;
	}
	
	i_receiver_hp1.value = document.getElementById("hp1").value;
	i_receiver_hp2.value = document.getElementById("hp2").value;
	i_receiver_hp3.value = document.getElementById("hp3").value;

	i_receiver_tel1.value = document.getElementById("tel1").value;
	i_receiver_tel2.value = document.getElementById("tel2").value;
	i_receiver_tel3.value = document.getElementById("tel3").value;
	
	if(i_receiver_tel2.value == "" && i_receiver_tel3.value == "" && i_receiver_hp2.value == "" && i_receiver_hp3.value == ""){
		alert("전화번호를 입력해주세요.");
		document.getElementById("hp2").focus();
		return false;
	}
	
	i_delivery_zipcode.value = document.getElementById("zipcode").value;
	i_delivery_address1.value = document.getElementById("roadAddress").value + document.getElementById("jibunAddress").value;
	i_delivery_address2.value = document.getElementById("namujiAddress").value;
	
	if(i_delivery_zipcode.value == ""){
		alert("우편번호를 입력하세요.");
		document.getElementById("zipcode").focus();
		return false;
	}
	if(i_delivery_address1.value == ""){
		alert("주소를 입력하세요.");
		document.getElementById("roadAddress").focus();
		return false;
	}
	if(i_delivery_address2.value == ""){
		alert("주소를 입력하세요.");
		document.getElementById("namujiAddress").focus();
		return false;
	}
	
	i_delivery_message.value = document.getElementById("delivery_message").value;
	i_delivery_method.value = document.getElementById("delivery_method").value;
	i_pay_method.value = document.getElementById("p_pay_method").value;
	i_card_com_name.value = document.getElementById("card_com_name").value;
	i_card_pay_month.value = document.getElementById("card_pay_month").value;
	i_pay_orderer_hp_num.value = "010-2222-3333";	
	i_point.value = document.getElementById("usingPoint").value;
	formObj.appendChild(i_receiver_name);
	formObj.appendChild(i_orderer_name);
	formObj.appendChild(i_receiver_hp1);
	formObj.appendChild(i_receiver_hp2);
	formObj.appendChild(i_receiver_hp3);
	formObj.appendChild(i_receiver_tel1);
	formObj.appendChild(i_receiver_tel2);
	formObj.appendChild(i_receiver_tel3);

	formObj.appendChild(i_delivery_zipcode);
	formObj.appendChild(i_delivery_address1);
	formObj.appendChild(i_delivery_address2);
	formObj.appendChild(i_delivery_message);
	formObj.appendChild(i_delivery_method);

	formObj.appendChild(i_pay_method);
	formObj.appendChild(i_card_com_name);
	formObj.appendChild(i_card_pay_month);
	formObj.appendChild(i_pay_orderer_hp_num);
	formObj.appendChild(i_point);

	document.body.appendChild(formObj);
	formObj.method = "post";
	formObj.action = "${contextPath}/order/payToOrderGoods.do";	
	formObj.submit();
}

function usePoint() {
	var hpC = /^[0-9]+$/;
	var point = document.getElementById("usePoint").value;
	var memPoint = document.getElementById("memPoint").value;
	var priceAll = document.getElementById("priceAll").value;
	console.log(point);
	console.log(memPoint);
	console.log(point>memPoint);
	if(point>memPoint){
		alert("보유포인트가 적습니다.")
		return false;
	}
	if (!hpC.test(point)) {
			alert("숫자만 입력해주세요")
			return false;
	}
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/order/usePoint.do",
		data : {
			point : point
		},
		success : function(data, textStatus) {
			document.getElementById("finalOrder").innerHTML = priceAll-point+" 원";
			document.getElementById("pointUse").innerHTML = point+" P";
			document.getElementById("memberPoint").innerHTML = memPoint-point+" P";
			document.getElementById("usingPoint").value = point;
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

.orderGoods {
	margin-top: 40px;
	width: 1000px;
}

.orderGoods h1 {
	text-align: center;
	font-size: 40px;
}

.orderGoods h2 {
	margin-top: 20px;
	font-size: 28px;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}

.order_depth {
	text-align: right;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}

.order_depth .first_depth {
	font-weight: 900;
}

.order_check {
	width: 100%;
	border-top-color: rgb(51, 51, 51);
	border-top-width: 2px;
	border-top-style: solid;
}

.order_check img {
	width: 100px;
	height: 100px;
}

.order_check tr {
	margin: 10px;
	border-bottom-color: rgb(153, 153, 153);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.order_check td {
	padding: 10px 0;
}

.order_check .redLine {
	text-decoration: line-through;
	color: red;
}

.order_check .text_box {
	width: 100px;
}

.delivery_data table {
	border-top-color: rgb(51, 51, 51);
	border-top-width: 2px;
	border-top-style: solid;
	border-bottom-color: rgb(51, 51, 51);
	border-bottom-width: 2px;
	border-bottom-style: solid;
}

.delivery_data table td {
	padding: 7px 0px 7px 10px;
}

.delivery_data .dot_line {
	border-bottom-color: rgb(153, 153, 153);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.delivery_data .fixed_join {
	width: 150px;
	font-weight: bold;
	color: #2904D9;
	background: #F1BF05;
}
</style>
</head>
<body>
	<div class="layout">
		<!-- body부분 삽입-->
		<div class="orderGoods">
			<h1>주문/결제 페이지</h1>
			<div class="order_depth">
				<span class="first_depth">01. 주문/결제</span> <span>></span> <span
					class="second_depth">02. 완료</span>
			</div>
			<h2>1. 주문확인</h2>
			<table class="order_check">
				<tbody align="center">
					<tr style="background: #9feeff">
						<td colspan="2">주문상품명</td>
						<td>수량</td>
						<td>원가(총합)</td>
						<td>할인가(총합)</td>
						<td>배송비</td>
						<td>적립예상포인트</td>
					</tr>
					<c:set var="AllPrice" value="0" />
					<c:forEach var="item" items="${myOrderList }">
						<c:set var="AllPrice"
							value="${AllPrice+item.productSale*item.productQuantity}" />
					</c:forEach>
					<c:forEach var="item" items="${myOrderList }" varStatus="status">
						<tr>
							<td><img alt="#"
								src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}"></td>
							<td>${item.productName }</td>
							<input id="product" type="hidden" value="${item.productName }">
							<td>${item.productQuantity }</td>
							
							<td class="redLine"><fmt:formatNumber
									value="${item.productPrice*item.productQuantity }" />원</td>
							<td><fmt:formatNumber
									value="${item.productSale*item.productQuantity }" />원</td>
							<c:choose>
								<c:when test="${AllPrice>=50000}">
									<td>0원</td>
								</c:when>
								<c:otherwise>
									<td>${item.productDelivery }원</td>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatNumber type="number" maxFractionDigits="0"
									value=" ${item.productSale*item.productQuantity/100 } " /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<h2>2. 주문고객</h2>
				<table>
					<tbody>
						<tr class="dot_line">
							<td>이름</td>
							<td><input id="orderer_name" type="text" name="orderer_name"
								value="${orderer.memberName}" size="15" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<h2>3. 배송지 정보</h2>
			<div class="delivery_data">
				<table>
					<tbody>
						<tr class="dot_line">
							<td class="fixed_join">배송방법</td>
							<td><input type="radio" id="delivery_method"
								name="delivery_method" value="일반택배" checked="checked">일반택배
								&nbsp;&nbsp;&nbsp; <input type="radio" id="delivery_method"
								name="delivery_method" value="편의점택배">편의점택배
								&nbsp;&nbsp;&nbsp; <input type="radio" id="delivery_method"
								name="delivery_method" value="해외배송">해외배송
								&nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">배송지 선택</td>
							<td><input type="radio" name="delivery_place"
								onclick="restore_all()" value="기본배송지" checked="checked">기본배송지
								&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place"
								value="새로입력" onclick="reset_all()">새로입력
								&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place"
								value="최근배송지">최근배송지 &nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">받으실 분</td>
							<td><input id="receiver_name" name="receiver_name"
								type="text" size="40" value="없음"></td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">휴대폰번호</td>
							<td><select id="hp1" name="hp1">
									<option>없음</option>
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - <input size="10px" type="text" id="hp2" name="hp2"
								value="1234"> - <input size="10px" type="text" id="hp3"
								name="hp3" value=" 4321"><br>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">유선전화(선택)</td>
							<td><select id="tel1" name="tel1">
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="0502">0502</option>
									<option value="0503">0503</option>
									<option value="0505">0505</option>
									<option value="0506">0506</option>
									<option value="0507">0507</option>
									<option value="0508">0508</option>
									<option value="070">070</option>
							</select> - <input size="10px" type="text" id="tel2" name="tel2" value="">
								- <input size="10px" type="text" id="tel3" name="tel3" value="">
							</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">주소</td>
							<td><input type="text" id="zipcode" name="zipcode" size="5"
								value="34303"> <a href="javascript:execDaumPostcode()">우편번호검색</a>
								<br>
								<p>
									<br>지번 주소: <input type="text" id="roadAddress"
										name="roadAddress" size="50" value="대전 대덕구 갑천도시고속도로 336 (문평동)"><br>
									<br> 도로명 주소: <input type="text" id="jibunAddress"
										name="jibunAddress" size="50" value="대전 대덕구 문평동 400-4"><br>
									<br> 나머지 주소: <input type="text" id="namujiAddress"
										name="namujiAddress" size="50" value="ㅁㄴㅇㅁㄴㅇ">
								</p> <input type="hidden" id="h_zipcode" name="h_zipcode"
								value="34303"> <input type="hidden" id="h_roadAddress"
								name="h_roadAddress" value="대전 대덕구 갑천도시고속도로 336 (문평동)">
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">배송 메시지</td>
							<td><input id="delivery_message" name="delivery_message"
								type="text" size="50" placeholder="택배 기사님께 전달할 메시지를 남겨주세요."></td>
						</tr>
					</tbody>
				</table>
			</div>
			<h2>4. 결제 상세</h2>
			<div class="order_detail">
				<table class="order_check">
					<tbody align="center">
						<tr>
							<td>최종 주문 금액</td>
							<td>사용포인트</td>
							<td>최종 결제 금액</td>
							<td>적립 예상 포인트</td>
						</tr>
						<tr>
							<td>${AllPrice}원</td>
							<td id="pointUse">0 P</td>
							<input id="priceAll" type="hidden" value="${AllPrice}" />
							<td id="finalOrder">${AllPrice}원</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="0"
									value=" ${AllPrice/100} " /> P</td>
						</tr>
						<tr>
							<td>보유 포인트</td>
							<td id="memberPoint">${memberInfo.point }P</td>
							<input id="memPoint" type="hidden" value="${memberInfo.point }">
							<td>사용 포인트</td>
							<td><input id="usePoint" class="text_box" type="text" /><input
								type="button" value="확인" onclick="usePoint()" /> <input
								id="usingPoint" type="hidden" value="0" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<h2>5. 결제 방법</h2>
			<div class="order_type">
				<input type="radio" id="p_pay_method" name="pay_method" value="신용카드"
					checked="checked">신용카드 &nbsp;&nbsp;&nbsp; <input
					type="radio" id="p_pay_method" name="pay_method" value="무통장 입금">무통장
				입금 &nbsp;&nbsp;&nbsp; <input type="radio" id="p_pay_method"
					name="pay_method" value="실시간 계좌이체">실시간 계좌이체
				&nbsp;&nbsp;&nbsp; <input type="radio" id="p_pay_method"
					name="pay_method" value="휴대폰 결제">휴대폰 결제 &nbsp;&nbsp;&nbsp;
				<input type="radio" id="p_pay_method" name="pay_method"
					value="카카오페이">카카오페이 &nbsp;&nbsp;&nbsp; <br> <span>카드선택
					: </span> <select id="card_com_name" name="카드선택">
					<option value="삼성" selected="selected">삼성</option>
					<option value="신한">신한</option>
					<option value="농협">농협</option>
					<option value="국민">국민</option>
				</select> <span>할부기간 : </span> <select id="card_pay_month" name="할부기간">
					<option value="일시불" selected="selected">일시불</option>
					<option value="1개월">1개월</option>
					<option value="3개월">3개월</option>
					<option value="6개월">6개월</option>
					<option value="12개월">12개월</option>
				</select>
			</div>
			<input id="reserve" type="button" value="결제하기" onclick="return reserve(); fn_process_pay_order();">
			<input type="button" value="취소"
				onclick="location.href='${contextPath}/main/main.do'">
		</div>
	</div>
</body>
</html>