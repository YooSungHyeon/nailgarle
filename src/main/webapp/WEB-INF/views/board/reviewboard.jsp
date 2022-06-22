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
	height: 510px;
	float: left;
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

.qna{
float:right; margin-top:30px; width:80%; font-size:14px; font-weight: bold; text-align:left;
}
.boardside{
float:left; margin-top:30px; width:20%; font-size:20px; font-weight: bold; height:220px; text-align:center;
background-color:lightgreen; 
}
#writeinfo{
float:right; width:80%; font-size:14px; font-weight: bold; text-align:center;
}
.reviewnumber{
float:left; width:6%; font-size:14px; font-weight: bold; text-align:center;
}
.reviewEvaluation{
float:left; width:14%; font-size:14px; font-weight: bold; text-align:center;
}
.reviewproduct{
float:left; width:17%; font-size:14px; font-weight: bold; text-align:center;
}
.reviewtitle{
float:left; width:35%; font-size:14px; font-weight: bold; text-align:center;
}
.reviewwritter{
float:left; width:15%; font-size:14px; font-weight: bold; text-align:center;
}
.reviewdate{
float:left; width:13%; font-size:14px; font-weight: bold; text-align:center;
}
.writeinfo2{
float:left; width:70%; font-size:14px; font-weight: bold; text-align:center;
}
.p_title{
border-bottom: solid 1px black;
}
.qna2{
text-align:left;
}
.qnabutton{
float:right; width:100%; text-align:right;
}

.p_title .title p {
text-align: left;
}
.qnaarticlebutton{
width: 100%; text-align: center;display:inline-block;
}
.review_underline {
	border: solid black;
	border-width: 1px 0 0 0;
}
.layout a{
text-decoration:none;
color:black;
}
.paging{
text-align:center;
float:right;
width:80%;
}
#re_star{
color:FFFF00;
}
.keywordform .keyword {
	border: 4px solid #dbdbdb;
	width: 185px;
	height: 26px;
	margin-top: 30px;
}

/* 검색창 검색버튼 */
.search_btn {
	background: url(${contextPath}/resources/image/search_btn.png);
	background-repeat: no-repeat;
	width: 26px;
	height: 26px;
	border: none;
	margin-top: 30px;
}
</style>
</head>
<body>
<div class="layout">
	<div class="service_container">
		<h1>리뷰 게시판</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/board/planboard.do"><img class="board_img" src="${contextPath}/resources/image/board_plan.svg"/>일정 게시판</a></li>
						<li><a class="inboardReview" href="${contextPath}/board/reviewboard.do"><img class="board_img" src="${contextPath}/resources/image/board_review.svg"/>리뷰 게시판</a></li>
					</ul>
				</nav>
			</div>
			
<div class="keywordform">
	<form action="${contextPath}/board/search_review.do" method="post">
		<input type="hidden" name="section" value="1">
		<input type="hidden" name="pageNum" value="1">
		<input class="keyword" type="text" name="search_keyword" value="${search_keyword }" placeholder="상품명입력">
		<input class="search_btn" type="submit" value="">
	</form>
	</div>
	<div class="p_title" id="writeinfo">
		<div class="reviewnumber"><span>번호</span></div>
		<div class="reviewEvaluation"><span>별점</span></div>
		<div class="reviewproduct"><span>상품명</span></div>
		<div class="reviewtitle"><span>제목</span></div>
		<div class="reviewwritter"><span>작성자</span></div>
		<div class="reviewdate"><span>작성일</span></div>
	</div>
	<c:if test="${empty reviewList.reviewList }">
	<p style="text-align:center"><strong>검색하신 결과가 없습니다.</strong></p>
	</c:if>
	<c:if test="${not empty reviewList }">
	<c:forEach var="reviewList" items="${reviewList.reviewList}">
	<div class="p_title" id="writeinfo">
		<div class="reviewnumber"><span>${reviewList.num}</span></div>
		<div class="reviewEvaluation" id="re_star">
		<c:if test="${reviewList.re_Star == '1'}">★☆☆☆☆</c:if>
		<c:if test="${reviewList.re_Star == '2'}">★★☆☆☆</c:if>
		<c:if test="${reviewList.re_Star == '3'}">★★★☆☆</c:if>
		<c:if test="${reviewList.re_Star == '4'}">★★★★☆</c:if>
		<c:if test="${reviewList.re_Star == '5'}">★★★★★</c:if>
		</div>
		
		<div class="reviewproduct"><span>${reviewList.productName }</span></div>
		<div class="reviewtitle"><a href="${contextPath}/board/reviewArticle.do?reviewNum=${reviewList.reviewNum}"><span>${reviewList.re_Title }</span></a></div>
		<div class="reviewwritter"><span>${reviewList.memberId }</span></div>
		<div class="reviewdate"><span><fmt:formatDate value="${reviewList.re_RegDate }"/></span></div>
	</div>
	</c:forEach>
	</c:if>
		<div class="paging">
			<c:if test="${not empty review}">
                <c:forEach var="page" begin="1" end="10" step="1" >
		        <c:if test="${section >1 && page==1 }">
		        <a href="${contextPath}/board/reviewboard.do?section=${section-1}&pageNum=${(section-1)*10 +1-10 }">prev &nbsp;</a>
		        </c:if>
		        <a href="${contextPath}/board/reviewboard.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		        <c:if test="${page ==10 }">
		        <a href="${contextPath}/board/reviewboard.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		        </c:if> 
	      		</c:forEach>
	      	</c:if>
	      	
	      	<c:if test="${empty review}">
                <c:forEach var="page" begin="1" end="10" step="1" >
		        <c:if test="${section >1 && page==1 }">
		        <a href="${contextPath}/board/search_review.do?section=${section-1}&pageNum=${(section-1)*10 +1-10 }&search_keyword=${search_keyword}">prev &nbsp;</a>
		        </c:if>
		        <a href="${contextPath}/board/search_review.do?section=${section}&pageNum=${page}&search_keyword=${search_keyword}">${(section-1)*10 +page } </a>
		        <c:if test="${page ==10 }">
		        <a href="${contextPath}/board/search_review.do?section=${section+1}&pageNum=${section*10+1}&search_keyword=${search_keyword}">&nbsp; next</a>
		        </c:if> 
	      		</c:forEach>
	      	</c:if>
	    </div>
	    <c:if test="${isLogOn==true and not empty memberInfo }">
	<div class="qnabutton"><a href="${contextPath}/board/writereview.do"><input type="button" value="글쓰기" /></a></div>
	</c:if>
	</div>
</div>
</body>
</html>