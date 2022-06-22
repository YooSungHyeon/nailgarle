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

.review_main table {
	width: 950px;
}

.review_main td {
	padding: 10px;
}

.review_main .re_star p {
	font-weight: 800;
	color: FFD700;
	margin: 0;
}

.review_main .review_content {
	width: 120px;
	background-color: #dbdbdb;
}

.adminboardside{
float:left; margin-top:30px; width:20%; font-size:20px; font-weight: bold; height:380px; text-align:center;
background-color:#9feeff;
}
.adminboardside li{
list-style: none;
}
.qnaarticle{
float:right; width:800px; text-align:left; font-size:14px; font-weight: bold; margin-top:30px;
}
.qnaarticle2{
float:right; width:200px; text-align:left; font-size:14px; font-weight: bold; margin-left:3px; margin-top:30px;
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

<!-- CSS부분 삽입-->

</style>
</head>
<body>
<div class="layout">
	<div class="service_container">
		<h1>리뷰 게시판</h1>	
				<div class="sidebar">
					<nav>
						<ul>
						<c:if test="${memberInfo.memberId != 'admin'}" >
							<li><a href="${contextPath}/board/planboard.do"><img class="board_img" src="${contextPath}/resources/image/board_plan.svg"/>일정 게시판</a></li>
							<li><a class="inboardReview" href="${contextPath}/board/reviewboard.do"><img class="board_img" src="${contextPath}/resources/image/board_review.svg"/>리뷰 게시판</a></li>
						</c:if>
						<c:if test="${memberInfo.memberId == 'admin'}" >
							<li><a href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>매출 관리</a></li>
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a class="inboard" href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
						</c:if>
						</ul>
					</nav>
				</div>
<div class="review_main">
	<div>
		<table>
			<tbody>
				<tr>
					<td class="review_content">작성자</td>
					<td>${reviewArticle.memberId }</td>
				</tr>
				<tr>
					<td class="review_content">제목</td>
					<td>${reviewArticle.re_Title }</td>
				</tr>
				<tr>
					<td class="review_content">별점</td>
					<td class="re_star">
						<p><c:if test="${reviewArticle.re_Star == '1'}">★☆☆☆☆</c:if></p>
						<p><c:if test="${reviewArticle.re_Star == '2'}">★★☆☆☆</c:if></p>
						<p><c:if test="${reviewArticle.re_Star == '3'}">★★★☆☆</c:if></p>
						<p><c:if test="${reviewArticle.re_Star == '4'}">★★★★☆</c:if></p>
						<p><c:if test="${reviewArticle.re_Star == '5'}">★★★★★</c:if></p>
					</td>
				</tr>
				<tr>
					<td class="review_content">상품명</td>
					<td>${reviewArticle.productName }</td>
				</tr>
				<tr>
					<td class="review_content">내용</td>
					<td>${reviewArticle.re_Text }</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div>
		<table>
			<tbody>
				<tr>
					<td>
						<c:forEach var="reviewImage" items="${reviewImage.imageList }">
							<img alt="#" src="${contextPath}/reviewthumbnails.do?re_fileName=${reviewImage.re_fileName}&productNum=${reviewImage.productNum}">
						</c:forEach>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
	<div class="articlebutton">
	<c:if test="${isLogOn==true and not empty memberInfo }">
		<a style="CURSOR: hand" onclick="if(comment1.style.display=='none') {comment1.style.display='';} else {comment1.style.display='none';}"><input type="button" value="댓글쓰기" id="button"/></a>
		<form name="reviewcomment" action="${contextPath}/board/addComment.do?reviewNum=${reviewArticle.reviewNum}" method="post">
		<div class="commentbutton" id="comment1" style="display: none">
		<input type="text" size="80" id="comment" name="comment" placeholder="한 줄 댓글" required/>
		<input type="submit" value="확인" /></div>
		</form>
	</c:if>
	</div>
	
	<c:forEach var="commentList" items="${commentList.commentList }">
	<div class="articlereply">
		<span>${commentList.memberId}</span>
		<div class="review_date">
		<span>
		<fmt:parseDate value="${commentList.com_RegDate}" pattern="yyyy-MM-dd'T'HH:mm" var="com_RegDate" type="both" />
		<fmt:formatDate pattern="yyyy.MM.dd" value="${com_RegDate}"/></span></div><br>
		<span>${commentList.comment}</span><br>
		<c:if test="${memberInfo.memberId == commentList.memberId || memberInfo.memberId == 'admin' }">
		<a href="${contextPath}/board/deleteComment.do?reviewNum=${reviewArticle.reviewNum}&commentNum=${commentList.commentNum}">
		<input type="button" value="삭제" id="button"/>
		</a>
		</c:if>
	</div>
	</c:forEach>
	

	<div class="articlebutton2">
	<c:if test="${memberInfo.memberId == reviewArticle.memberId || memberInfo.memberId == 'admin' }">
		<a href="${contextPath}/board/modifyArticle.do?reviewNum=${reviewArticle.reviewNum}"><input type="button" value="수정" id="button"/></a>
		<c:forEach var="reviewImage" items="${reviewImage.imageList }">
		<a href="${contextPath}/board/deleteReview.do?reviewNum=${reviewArticle.reviewNum}&re_fileName=${reviewImage.re_fileName}&productNum=${reviewImage.productNum}"></a>
		</c:forEach>
		<c:if test="${not empty reviewImage.imageList }">
		<a href="${contextPath}/board/deleteReview.do?reviewNum=${reviewArticle.reviewNum}&productNum=${reviewArticle.productNum}">
		<input type="button" value="삭제" id="button"/></a>
		</c:if>
		
	</c:if>
	</div>
	</div>
	</div>
</body>
</html>