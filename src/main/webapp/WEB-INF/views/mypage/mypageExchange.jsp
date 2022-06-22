<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function return_product(value){
	if (value=="직접입력"){
	document.getElementById("return_Message").style.display = "";
	}else{
	document.getElementById("return_Message").style.display = "none";
	}
	}
function check_message(){
	
	var message = document.getElementById("return_Option").value;
	var f = document.frmreturn;
	
	if(message=="반품사유를 선택하세요"){
		alert("반품사유을 입력해주세요.");
		return false;
	}
	f.submit();
}
function exchange_product(value){
	if (value=="직접입력"){
	document.getElementById("exchange_Message").style.display = "";
	}else{
	document.getElementById("exchange_Message").style.display = "none";
	}
	}
function check_message2(){
	var option = document.getElementById("option").value;
	var option2 = document.getElementById("option2").value;
	var message = document.getElementById("exchange_Option").value;
	var f = document.frmexchange;
	if(option=="notSelect"){
		alert("옵션을 선택해주세요");
		return false;
	}
	if(option2=="notSelect"){
		alert("옵션를 선택해주세요");
		return false;
	}
	if(message=="교환사유를 선택하세요"){
		alert("교환사유을 입력해주세요.");
		return false;
	}
	f.submit();
}
</script>

<style>

.layout{
	padding-top:40px;
	width:100%;
}

#frmexchange {
	background-color: white;
	margin: 0 auto;
	text-align: center;
	width: 300px;
}

#exchange_form {
	width: 350px;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	text-align: left;
	box-sizing: border-box;
}

#exchange_form h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#exchange_form a {
	color: rgb(102, 102, 102); 
	text-decoration: none;
	font-size : 12px 
}

#exchange_form a:hover {
	color: rgb(255, 102, 0); 
	text-decoration: none;
}

#exchange_form .adduser {
	color: rgb(0, 0, 205); 
	text-decoration: none;
}

.submit_btn {
	background-color: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	height: 35px;
	width: 290px;
	font-size: 16px;
	margin: 5px 0 0 0;
	cursor: pointer;
	border-radius: 3px;
	transition: 0.3s;
}

.submit_btn:hover {
	background: white;
	color: #2b2e4a;
}

.main {
	padding: 0 0 0 0;
	margin: 0 auto;
	background: #ffffff;
}

section {
	display: none;
	padding: 20px 0 0;
	border-top: 1px solid #ddd;
}

/*라디오버튼 숨김*/
input[type="radio"] {
	display: none;
}

label {
	width:152px;
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	text-align: center;
	color: #bbb;
	border: 1px solid transparent;
}

label:hover {
	color: #2e9cdf;
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked+label {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2e9cdf;
	border-bottom: 1px solid #ffffff;
}

#tab1:checked ~ #content1, #tab2:checked ~ #content2 {
	display: block;
}
textarea{
    width: 100%;
    height:90px;
    resize: none;
  
}
</style>
</head>

<div class="layout">

<div id="exchange_form">
<h3>반품/교환</h3>
<br>
<br>
<div class="main">
	<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">반품 접수</label> 
	<input id="tab2" type="radio" name="tabs"> 
		<label for="tab2">교환 접수</label>
		
	<section id="content1">
		<form id="frmreturn" name="frmreturn" action="${contextPath}/mypage/productReturn.do" method="post" onSubmit="check_message(); return false;">
		<input type="hidden" name="deliveryState" value="반품접수중" />
		<input type="hidden" name="orderNum" value="${orderVO.orderNum}" />
			<table>
				<tbody>
					<tr>
						<td>
							상품명: ${orderVO.productName}
						</td>
					</tr>
					
					<tr>
						<td>
							주문금액: ${orderVO.orderAmount}원
						</td>
					</tr>
					
					<tr>
						<td>
							 수량: ${orderVO.productQuantity}개
						</td>
					</tr>
					
					<tr>
						<td>
							옵션: ${orginOpt1}<c:if test="${not empty orginOpt2 }">/${orginOpt2}</c:if>
						</td>
					</tr>
					
					<tr>
						<td>
							반품사유 
							<select id="return_Option" name="return_Option" onChange="javascript:return_product(this.value);">
							<option value="반품사유를 선택하세요">반품사유를 선택하세요</option>
							<option value="고객변심">고객변심</option>
							<option value="상품정보 상이">상품정보 상이</option>
							<option value="품질불만">품질불만</option>
							<option value="상품하자/파손">상품하자/파손</option>
							<option value="오배송">오배송</option>
							<option value="구성품 누락">구성품 누락</option>
							<option value="직접입력">직접입력</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>
						<textarea id="return_Message" name="message" style="display:none;"></textarea>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="submit" class="submit_btn" value="반품신청">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</section>

	<section id="content2">
			<form id="frmexchange" name="fromexchange" action="${contextPath}/mypage/productExchange.do" method="post" onSubmit="check_message2();return false;">
				<input type="hidden" name="deliveryState" value="교환접수중" />
				<input type="hidden" name="orderNum" value="${orderVO.orderNum}" />
				<table>
					<tbody>
						<tr>
						<td>
							상품명: ${orderVO.productName}
						</td>
					</tr>
					
					<tr>
						<td>
							주문금액: ${orderVO.orderAmount}원
						</td>
					</tr>
					
					<tr>
						<td>
							 수량: ${orderVO.productQuantity}개
						</td>
					</tr>
					
					<tr>
						<td>
							옵션: ${orginOpt1}
							<select id="option" name="option1" >
							<c:if test="${productsStock != 0 }">
							<option id="notSelect" value="notSelect">-</option>
							<c:forEach var="option" items="${optionlist}">
							<option value="${option}">${option}</option>
							</c:forEach>
							</c:if>
							<c:if test="${orginOpt1 == '-' }">
							<option>선택안함</option>
							</c:if>
							<c:if test="${productsStock == 0 }">
							<option value="">sold out</option>
							</c:if>
							</select>
							
						</td>
					</tr>
					
					<tr>
						<td>
							옵션: ${orginOpt2}
							<select id="option2" name="option2">
							<c:if test="${productsStock != 0 }">
							<option id="notSelect" value="notSelect">-</option>
							<c:forEach var="option" items="${optionlist2}">
							<option value="${option}">${option}</option>
							</c:forEach>
							</c:if>
							<c:if test="${orginOpt2 == '-'}">
							<option>선택안함</option>
							</c:if>
							<c:if test="${productsStock == 0 }">
							<option value="">sold out</option>
							</c:if>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>
							교환사유 
							<select id="exchange_Option" name="exchange_Option"onChange="javascript:exchange_product(this.value);" >
							<option value="교환사유를 선택하세요">교환사유를 선택하세요</option>
							<option value="고객변심">고객변심</option>
							<option value="상품정보 상이">상품정보 상이</option>
							<option value="품질불만">품질불만</option>
							<option value="상품하자/파손">상품하자/파손</option>
							<option value="사이즈 불만">사이즈 불만</option>
							<option value="직접입력">직접입력</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>
						<textarea id="exchange_Message" name="message" style="display:none;"></textarea>
						</td>
					</tr>
					
						<tr>
							<td>
								<c:if test="${productsStock != 0 }">
								<input type="submit" class="submit_btn" value="교환신청">
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								<c:if test="${productsStock == 0 }">
								<input type="submit" class="submit_btn" value="교환불가" disabled>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</section>
	</div>
</div>
</div>
</body>
</html>