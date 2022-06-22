<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddb9fdc368e57860edb508e2c16104cb"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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

.service_container .sidebar .inboardPlan {
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

#writeinfo{
float:right; width:80%; font-size:14px; font-weight: bold; text-align:center;
}
.number{
float:left; width:10%; font-size:14px; font-weight: bold; text-align:center;
}
.title{
float:left; width:50%; font-size:14px; font-weight: bold; text-align:center;
}
.writter{
float:left; width:20%; font-size:14px; font-weight: bold; text-align:center;
}
.date{
float:left; width:20%; font-size:14px; font-weight: bold; text-align:center;
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
.plan_underline {
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

<!-- CSS부분 삽입-->

</style>
</head>
<body>
<div class="layout">
	<div class="service_container">
		<h1>일정게시판</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a class="inboardPlan" href="${contextPath}/board/planboard.do"><img class="board_img" src="${contextPath}/resources/image/board_plan.svg"/>일정 게시판</a></li>
						<li><a href="${contextPath}/board/reviewboard.do"><img class="board_img" src="${contextPath}/resources/image/board_review.svg"/>리뷰 게시판</a></li>
					</ul>
				</nav>
			</div>
	
	<div class="keywordform">
	<form action="${contextPath}/board/search_plan.do" method="post">
		<input type="hidden" name="section" value="1">
		<input type="hidden" name="pageNum" value="1">
		<input class="keyword" type="text" name="search_keyword" value="${search_keyword }" placeholder="제목입력">
		<input class="search_btn" type="submit" value="">
	</form>
	</div>
	<div class="p_title" id="writeinfo">
		<div class="number"><span>번호</span></div>
		<div class="title"><span>제목</span></div>
		<div class="writter"><span>작성자</span></div>
		<div class="date"><span>작성일</span></div>
	</div>
	<c:if test="${empty planList.planList }">
	<p style="text-align:center"><strong>검색하신 결과가 없습니다.</strong></p>
	</c:if>
	<c:if test="${not empty planList }">
	<c:forEach var="planList" items="${planList.planList }">
	<div class="p_title" id="writeinfo">
		<div class="number"><span>${planList.num }</span></div>
		<div class="title"><a href="${contextPath}/board/selectPlan.do?planNum=${planList.planNum}"><span>${planList.pl_Title}</span></a></div>
		<div class="writter"><span>${planList.memberId}</span></div>
		<div class="date"><span><fmt:formatDate value="${planList.pl_RegDate}"/></span></div>
	</div>
	</c:forEach>
	</c:if>
	<div class="paging">
			<c:if test="${not empty plan }">
                <c:forEach var="page" begin="1" end="10" step="1" >
		        <c:if test="${section >1 && page==1 }">
		        <a href="${contextPath}/board/planboard.do?section=${section-1}&pageNum=${(section-1)*10 +1-10 }">prev &nbsp;</a>
		        </c:if>
		        <a href="${contextPath}/board/planboard.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		        <c:if test="${page ==10 }">
		        <a href="${contextPath}/board/planboard.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		        </c:if> 
	      		</c:forEach>
	      	</c:if>
	      	
	      	<c:if test="${empty plan }">
                <c:forEach var="page" begin="1" end="10" step="1" >
		        <c:if test="${section >1 && page==1 }">
		        <a href="${contextPath}/board/search_plan.do?section=${section-1}&pageNum=${(section-1)*10 +1-10 }&search_keyword=${search_keyword}">prev &nbsp;</a>
		        </c:if>
		        <a href="${contextPath}/board/search_plan.do?section=${section}&pageNum=${page}&search_keyword=${search_keyword}">${(section-1)*10 +page } </a>
		        <c:if test="${page ==10 }">
		        <a href="${contextPath}/board/search_plan.do?section=${section+1}&pageNum=${section*10+1}&search_keyword=${search_keyword}">&nbsp; next</a>
		        </c:if> 
	      		</c:forEach>
	      	</c:if>
	    </div>

	<c:if test="${isLogOn==true and not empty memberInfo }">
	<div class="qnabutton"><a href="${contextPath}/board/boardDiary.do"><input id="button" type="button" value="일정작성" /></a></div>
	</c:if>
	</div>
</div>
</body>
</html>