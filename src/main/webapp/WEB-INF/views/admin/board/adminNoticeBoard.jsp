<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


function delete_check(){
	if (confirm("삭제하시겠습니까?") == true){
		alert('삭제되었습니다');
	}else{
		alert('취소되었습니다');
	    return false;
	
		}
	}
	
function delete_review(){
	if (confirm("삭제하시겠습니까?") == true){
		alert('삭제되었습니다');
	}else{
		alert('취소되었습니다');
	    return false;
	
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

.admin_container .sidebar .inboard {
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

.board_container {
	text-align: center;
}

.board_container h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.board_container table {
	width: 950px;
}

/* 관리자 페이지 게시판 관리 tr, th, td 태그 */
.admin_container .admindata_board th {
	background: #2b2e4a;
	color: #fff;
}

.admin_container .admindata_board td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.admin_container .admindata_board tr:nth-of-type(odd) {
	background: #eee;
}

/* 관리자 페이지 게시판 관리 li 태그 */
.admin_container .admindata_board li {
	padding: 0;
	font-size: 14px;
	text-align: left;
}

/* 관리자 페이지 게시판 관리 ul 태그 */
.admin_container .admindata_board ul {
	margin: 0;
}

/* 관리자 페이지 게시판 관리 삭제버튼 */
.admin_container .admindata_board .board_delete_btn {
	margin-left: 10px;
}

/* 상품명 a태그 */
.admin_product {
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

/* 글제목 a태그 */
.admin_board_title {
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

/* 별점 */
.re_star {
	font-weight: 800;
	color: FFD700;
	margin: 0;
}

/* 칼럼 너비 */
.admindata_board .plan .plNum {
	width: 7%;
}

.admindata_board .plan .plTitle {
	/* 나머지 자동맞춤 */
	
}

.admindata_board .plan .plWriter {
	width: 15%;
}

.admindata_board .plan .plDate {
	width: 12%;
}

.admindata_board .review .rvNum {
	width: 7%;
}

.admindata_board .review .rvStar {
	width: 10%;
}

.admindata_board .review .rvGoods {
	width: 20%;
}

.admindata_board .review .rvTitle {

}

.admindata_board .review .rvWriter {
	width: 15%;
}

.admindata_board .review .rvDate {
	width: 12%;
}

/* Search */
.board_search {
	float: left;
	text-align: left;
	margin: 8px 35px;
}

.board_search .selectBoard {
	margin-bottom: 6px;
}

/* 검색창 인풋박스 */
.keywordform .keyword {
	border: 1px solid #dbdbdb;
	width: 185px;
	height: 26px;
}

/* 검색창 셀렉박스 */
.keywordform .searchType {
	border: 1px solid #dbdbdb;
	width: 90px;
	height: 26px;
}

/* 검색창 검색버튼 */
.search_btn {
	background: url(${contextPath}/resources/image/search_btn.png);
	background-repeat: no-repeat;
	width: 26px;
	height: 26px;
	border: none;
}

/* page */
.page_nation {
	border: none;
	padding-top: 30px;
	background-color: white;
}

.page_nation a {
	display: inline-block;
	border: 1px solid #e6e6e6;
	width: 25px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	background-color: #fff;
	font-size: 12px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/image/page_prev.png')
		no-repeat center center;
}

.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/image/page_next.png')
		no-repeat center center;
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
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a class="inboard" href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>
			<div class="board_container">
				<h4>게시판조회</h4>
					<div class="board_search">
						<form action="${contextPath}/admin/board/search_keyword.do" method="post" onsubmit="dis()">
							<div class="selectBoard">
							<input type="radio" name="board_tab" value="일정 게시판" <c:if test="${boardType eq '일정 게시판'}">checked</c:if> checked/> 
								<label for="board_tab1" class="contentType">일정 게시판</label> 
							<input type="radio" name="board_tab"  value="리뷰 게시판" <c:if test="${boardType eq '리뷰 게시판'}">checked</c:if>/>
								<label for="board_tab2" class="contentType">리뷰 게시판</label> <br>
							</div>
							
							<div class="keywordform">
							<select id="searchType" class="searchType" name="search_type">
								<option value="전체" <c:if test="${search_type eq '전체'}">selected</c:if> selected>전체</option>
								<option value="아이디" <c:if test="${search_type eq '아이디'}">selected</c:if> >아이디</option>
								<option value="제목" <c:if test="${search_type eq '제목'}">selected</c:if> >제목</option>
								<option value="상품명" <c:if test="${search_type eq '상품명'}">selected</c:if> >상품명</option>
							</select> 
								<input type="text" class="keyword" id="keyword" name="search_keyword" value="${search_keyword}">
								<input type="submit" class="search_btn" value="">
							</div>
						</form>
				</div>
				<div class="admindata_board" id="admindata_board">
					<table class="plan">
					<colgroup>
							<col class="plNum">
							<col class="plTitle">
							<col class="plWriter">
							<col class="plDate">
							<col class="plDel">
						</colgroup>
						<tbody align="center" id="plan_list">
							<c:if test="${boardType == '일정 게시판' || controller == 'adminNoticeBoard'}"> 
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th style="width: 110px;"></th>
								</tr>
							</c:if>
							<c:forEach var="planList" items="${planList.planList}">
								<tr>
									<td>${planList.num }</td>
									<td><a class="admin_board_title" href="${contextPath}/board/selectPlan.do?planNum=${planList.planNum}">${planList.pl_Title }</a></td>
									<td>${planList.memberId }</td>
									<td><fmt:formatDate value="${planList.pl_RegDate}" /></td>
									<c:if test="${memberInfo.memberId == 'admin'}">
										<td>
											<a href="${contextPath}/admin/board/deletePlan.do?planNum=${planList.planNum}">
											<input type="button" class="board_delete_btn" value="삭제" onclick="return delete_check()"></a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
							<c:if test="${boardType == '일정 게시판' || controller == 'adminNoticeBoard'}">
							<tr>
								<td class="page_nation" colspan="5" style="padding-top: 20px;">
								<c:forEach var="page" begin="1" end="10" step="1">
									<c:if test="${section >1 && page==1}">
										<a class="arrow prev" href="${contextPath}/admin/board/search_keyword.do?section=${section-1}&pageNum=1&search_keyword=${search_keyword}&search_type=${search_type}&board_tab=일정 게시판"></a>
									</c:if>
									<a class="active" href="${contextPath}/admin/board/search_keyword.do?section=${section}&pageNum=${page}&search_keyword=${search_keyword}&search_type=${search_type}&board_tab=일정 게시판">${(section-1)*10 +page }
									</a>
									<c:if test="${page ==10 }">
										<a class="arrow next" href="${contextPath}/admin/board/search_keyword.do?section=${section+1}&pageNum=1&search_keyword=${search_keyword}&search_type=${search_type}&board_tab=일정 게시판"></a>
									</c:if>
								</c:forEach>
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>

					<table class="review">
					<colgroup>
							<col class="rvNum">
							<col class="rvStar">
							<col class="rvGoods">
							<col class="rvTitle">
							<col class="rvWriter">
							<col class="rvDate">
						</colgroup>
						<tbody align="center" id="review_list">
						<c:if test="${boardType == '리뷰 게시판' || controller == 'adminNoticeBoard'}"> 
							<tr>
								<th>번호</th>
								<th>별점</th>
								<th>상품명</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th style="width: 110px;"></th>
							</tr>
							</c:if>
							<c:forEach var="reviewList" items="${reviewList.reviewList}">
								<tr>
									<td>${reviewList.num }</td>
									<td><div class="re_star" id="re_star">
									<c:if test="${reviewList.re_Star == '1'}">★☆☆☆☆</c:if>
									<c:if test="${reviewList.re_Star == '2'}">★★☆☆☆</c:if>
									<c:if test="${reviewList.re_Star == '3'}">★★★☆☆</c:if>
									<c:if test="${reviewList.re_Star == '4'}">★★★★☆</c:if>
									<c:if test="${reviewList.re_Star == '5'}">★★★★★</c:if>
									</div></td>
									<td><a class="admin_product" href="${contextPath}/goods/productdetail.do?productNum=${reviewList.productNum }">${reviewList.productName }</a></td>
									<td><a class="admin_board_title" href="${contextPath}/board/reviewArticle.do?reviewNum=${reviewList.reviewNum}">${reviewList.re_Title }</a></td>
									<td>${reviewList.memberId }</td>
									<td><fmt:formatDate value="${reviewList.re_RegDate}" /></td>
									<c:if test="${memberInfo.memberId == 'admin'}">
									<td><a href="${contextPath}/admin/board/deleteReview.do?reviewNum=${reviewList.reviewNum}&productNum=${reviewList.productNum}">
									<input type="button" class="board_delete_btn" value="삭제" onclick="return delete_review()"></a></td>
									</c:if>
								</tr>
							</c:forEach>
							<c:if test="${boardType == '리뷰 게시판' || controller == 'adminNoticeBoard'}"> 
							<tr>
								<td class="page_nation" colspan="7" style="padding-top: 20px;">
								<c:forEach var="page" begin="1" end="10" step="1">
									<c:if test="${section >1 && page==1}">
										<a class="arrow prev" href="${contextPath}/admin/board/search_keyword.do?section=${section-1}&pageNum=1&search_keyword=${search_keyword}&search_type=${search_type}&board_tab=리뷰 게시판"></a>
									</c:if>
									<a class="active" href="${contextPath}/admin/board/search_keyword.do?section=${section}&pageNum=${page}&search_keyword=${search_keyword}&search_type=${search_type}&board_tab=리뷰 게시판">${(section-1)*10 +page }
									</a>
									<c:if test="${page ==10 }">
										<a class="arrow next" href="${contextPath}/admin/board/search_keyword.do?section=${section+1}&pageNum=1&search_keyword=${search_keyword}&search_type=${search_type}&board_tab=리뷰 게시판"></a>
									</c:if>
								</c:forEach>
								</td>
							</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			


		</div>
	</div>
	<script>
		$(document).ready(function() {
			
			$("#admindata_board > table").last().hide();
			var radioContent = $("#admindata_board > table");
			$("input[type='radio']").click(function() {
				radioContent.hide();
				radioContent.eq($("input[type='radio']").index(this)).show();
			});
		});
		function dis(){
		    if(${boardType} == "리뷰 게시판"){
		    	$('#review_list').attr('style', "display:'';");
		        $('#plan_list').attr('style', "display:none;");
		    }
		}
	</script>

</body>
</html>