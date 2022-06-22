<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(function(){
	
    var responseMessage = "<c:out value="${message}" />";
    if(responseMessage != ""){
        alert(responseMessage)
    }
}) 
			
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


.seller_pwcheck_box_container {
	text-align: center;
}

.seller_pwcheck_box {
	margin: 150px 350px;	
	padding: 40px;
	border: solid #F4A460 1px;
	width: 800px;
	text-align: center;
	box-shadow: 3px 3px 3px #F4A460;
}

.seller_pwcheck_box h2 {	
	font-size: 18px;
	font-weight: 700;	
}

.seller_pwcheck_box h3 {	
	font-size: 12px;	
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
						<li><a href="${contextPath}/seller/goods/sellerGoodsMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_product.svg" />물품 관리</a></li>
						<li><a href="${contextPath}/seller/order/sellerOrderMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_order.svg" />주문/배송 관리</a></li>
						<li><a href="${contextPath}/seller/rental/sellerRentalMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_rental.svg" />렌탈 관리</a></li>
						<li><a href="${contextPath}/seller/sellerPwCheck.do?seller=update"><img class="seller_img" src="${contextPath}/resources/image/seller_info.svg" />사업자 정보수정</a></li>
						<li><a href="${contextPath}/seller/sellerPwCheck.do?seller=delete"><img class="seller_img" src="${contextPath}/resources/image/seller_unsubscribe.svg" />사업자 탈퇴</a></li>
					</ul>
				</nav>
			</div>
		<div class="seller_pwcheck_box_container">
			<div class="seller_pwcheck_box">
				<h2>비밀번호 입력</h2>
				<h3>외부로부터 고객님의 정보를 안전하게 보호하기 위하여 비밀번호를 다시 한번 확인합니다.
				<br>항상 비밀번호는 타인에게 노출되지 않도록 주의하여 주세요.
				</h3><br>
				<form action="${contextPath}/seller/PwCheck.do" method="post">
				<input type="password" name="sellerPw"/>
				<br>
				<br>
				<input type="submit" value="확인"/>&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>