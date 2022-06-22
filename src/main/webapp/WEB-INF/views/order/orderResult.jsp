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
.layout{
	padding-top:40px;
	width:100%;
}

.orderGoods{
	margin-top : 40px;
	width:1000px;
	text-align: center;
}
.orderGoods h1{
	font-size: 40px;
}
.orderGoods h2{
	margin-top : 20px;
	font-size: 28px;
}
.order_depth{
	text-align: right;
	border: solid black;
	border-width: 0px 0px 1px 0px ;	
}
.order_depth .second_depth{
	font-weight: 900;
}
.order_check{
	width: 100%;
    border-top-color: rgb(51, 51, 51);
    border-top-width: 2px;
    border-top-style: solid;	
}

.order_check img{
	width: 100px;
	height: 100px;
}
.order_check tr{
	margin:10px;
	border-bottom-color: rgb(153, 153, 153);
    border-bottom-width: 1px;
    border-bottom-style: dotted;
}
.order_check td{
	padding:10px 0;
}
.order_main_btn{
	width: 200px;
	height: 50px;
    color: #fff;
    background: black;
    font-size: 18px;
}


</style>
</head>
<body>
<div class="layout">
<!-- body부분 삽입-->
	<div class="orderGoods">
		<h1>주문/결제 페이지</h1>
		<div class="order_depth">
			<span class="first_depth">01. 주문/결제</span>	
			<span>></span>	
			<span class="second_depth">02. 완료</span>
		</div>
		<h2 align="center">주문내역</h2>
		<table class="order_check">
			<tbody align="center">
				<tr style="background: #9feeff">
					<td>주문 번호</td>
					<td>주문 상품</td>
					<td>수량</td>
					<td>결제 금액</td>
				</tr>				
				<c:forEach var="item" items="${myOrderList }">				
				<tr>				
					<td>${item.orderNum }</td>
					<td><img alt="#" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">${item.productName }</td>
					<td>${item.productQuantity }개</td>
					<td>${item.productSale*item.productQuantity }원</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	<br>
	<input class="order_main_btn" type="button" value="메인페이지로" onclick="location.href='${contextPath}/main/main.do'"/>
	</div>
</div>
</body>
</html>