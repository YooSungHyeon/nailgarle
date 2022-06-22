<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style>
.layout {
	padding-top: 40px;
	width: 100%;
}

.service_container {
	width: 1250px;
}

.service_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.service_container .sidebar {
	width: 250px;
	float: left;
}

.service_container .sidebar .admin_img {
	padding-right: 20px;
}

.service_container .sidebar .board_img {
	padding-right: 20px;
}

.service_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.service_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.service_container .sidebar .inboard {
	font-weight: 800;
}

.service_container .sidebar .inboardReview {
	font-weight: 800;
}

.service_container nav {
	margin-top: 32px;
}

.service_container ul {
	padding-left: 0;
}

.service_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.qnaarticle{
float:right; width:70%; text-align:left; font-size:14px; font-weight: bold; margin-top:30px;
}
.qnaarticle2{
float:right; width:8%; text-align:left; font-size:14px; font-weight: bold; margin-left:3px; margin-top:30px;
}
.reviewimage{
float:right; width:78%; margin-left:3px;
}
.articlebutton{
float:right; width:80%; text-align:right; margin-top:5px; border-bottom: solid 1px black;
}
.p_title{
border-bottom: solid 1px black;
}
.articlereply{
float:right; width:80%; text-align:left; margin-top:5px; border-bottom: solid 1px black;
 font-size:16px; font-weight: bold;
}
.articlereply2{
float:right; width:80%; text-align:left; margin-top:5px; border-bottom: solid 1px black;
 font-size:16px; font-weight: bold;
}
.articlereply2 span{
padding-left:20px
}
.articlebutton2{
float:right; width:80%; text-align:right; margin-top:15px;
}
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 1em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.review_underline {
	border: solid black;
	border-width: 1px 0 0 0;
}
.commentbutton{
float:right; margin-top:10px;
}
.review_date{
float:right;
}
.layout a{
text-decoration:none;
color:black;
}
.qnacontent textarea{
    width: 100%;
    height:300px;
    resize: none;
  
}
<!-- CSS부분 삽입-->

</style>
</head>
<body>
<div class="layout">
	<div class="service_container">
		<h1>리뷰 게시판</h1>
			<c:if test="${memberInfo.memberId != 'admin'}" >
				<div class="sidebar">
					<nav>
						<ul>
							<li><a href="${contextPath}/board/planboard.do"><img class="board_img" src="${contextPath}/resources/image/board_plan.svg"/>일정 게시판</a></li>
							<li><a class="inboardReview" href="${contextPath}/board/reviewboard.do"><img class="board_img" src="${contextPath}/resources/image/board_review.svg"/>리뷰 게시판</a></li>
						</ul>
					</nav>
				</div>

			</c:if>
			<c:if test="${memberInfo.memberId == 'admin'}" >
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>매출 관리</a></li>
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a class="inboard" href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>
		</c:if>
	<form class="mb-3" id="myform" action="${contextPath}/board/updateArticle.do" method="post">
	<div class="qnaarticle">
		<div class="qnakinds"><p>${reviewArticle.memberId }</p></div>
		<div class="qnatitle"><p><input type="text" name="re_Title" value="${reviewArticle.re_Title }"/></p></div>
		<div class="qnatitle"><p>
		
	<fieldset>
		<input class="reviewStar" type="radio" name="re_Star" value="5" id="rate1" 
		<c:if test="${reviewArticle.re_Star eq '5'}">checked="checked"</c:if>>
		<label for="rate1">★</label>
		<input class="reviewStar" type="radio" name="re_Star" value="4" id="rate2" 
		<c:if test="${reviewArticle.re_Star eq '4'}">checked="checked"</c:if>>
		<label for="rate2">★</label>
		<input class="reviewStar" type="radio" name="re_Star" value="3" id="rate3" 
		<c:if test="${reviewArticle.re_Star eq '3'}">checked="checked"</c:if>>
		<label for="rate3">★</label>
		<input class="reviewStar" type="radio" name="re_Star" value="2" id="rate4" 
		<c:if test="${reviewArticle.re_Star eq '2'}">checked="checked"</c:if>>
		<label for="rate4">★</label>
		<input class="reviewStar" type="radio" name="re_Star" value="1" id="rate5" 
		<c:if test="${reviewArticle.re_Star eq '1'}">checked="checked"</c:if>>
		<label for="rate5">★</label>
	</fieldset>
	</div>
		<div class="qnatitle"><p style="margin-top: 10px;">${reviewArticle.productName }</p></div>
		<div class="qnacontent"><p><textarea name="re_Text" >${reviewArticle.re_Text }</textarea></p></div>
	</div>
	<div class="qnaarticle2">
		<div class="qnakinds2"><p>작성자</p></div>
		<div class="qnatitle2"><p>제목</p></div>
		<div class="qnatitle"><p>별점</p></div>
		<div class="qnatitle"><p>상품명</p></div>
		<div class="qnacontent2"><p>내용</p></div>
	</div>
	<div class="reviewimage">
		<c:forEach var="reviewImage" items="${reviewImage.imageList }">
		<img alt="#" src="${contextPath}/reviewthumbnails.do?re_fileName=${reviewImage.re_fileName}&productNum=${reviewImage.productNum}">
	</c:forEach>
	</div>
	

	

	<div class="articlebutton2">
		<input type="submit" value="수정" >
		<input type="hidden" name="reviewNum" value="${reviewArticle.reviewNum}" />
		</form>
		<a href="${contextPath}/board/reviewArticle.do?reviewNum=${reviewArticle.reviewNum}"><input type="button" value="취소" id="button"/></a>
	
	</div>
</div>

</body>
</html>