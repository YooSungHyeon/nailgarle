<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  String Date = new java.text.SimpleDateFormat("yyyy. MM. dd").format(new java.util.Date());
  String Today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function restore_check(){
	if (confirm("복구하시겠습니까?") == true){
		alert('복구되었습니다');
	}else{
		alert('취소되었습니다');
	    return false;
	
		}
	}

function del_check(){
	if (confirm("탈퇴시키시겠습니까?") == true){
		alert('탈퇴되었습니다');
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

.admin_container .sidebar .inmember {
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

.member_container {
	text-align: center;
}

.member_container h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.member_container table {
	width: 950px;
}

/* 관리자 페이지 회원 관리 tr, th, td 태그 */
.admin_container .admindata_member th {
	background: #2b2e4a;
	color: #fff;
}

.admin_container .admindata_member td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.admin_container .admindata_member tr:nth-of-type(odd) {
	background: #eee;
}

/* 회원명 a태그 */
.admin_member {
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

/* Search */
.member_search {
	float: left;
	text-align: left;
	margin: 8px 35px;
}

.member_search .search_allday {
	margin-bottom: 6px;
}

.member_search .search_member_select {
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
						<li><a class="inmember" href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>
			<div class="member_container">
				<h4>회원조회</h4>
					<div class="member_search">
						<form action="${contextPath}/admin/member/lineupMember.do" method="post">
							<div class="search_member_select">
								<input id="member_ck" type="radio" value="일반회원" name="member" <c:if test="${memberType eq '일반회원'}">checked</c:if> checked="checked"/>일반회원
								<input id="seller_ck" type="radio" value="사업자회원" name="member" <c:if test="${memberType eq '사업자회원'}">checked</c:if> >사업자회원
								<input id="member_ck2" type="radio" value="탈퇴회원" name="member" <c:if test="${memberType eq '탈퇴회원'}">checked</c:if> >탈퇴회원
								<input id="seller_ck2" type="radio" value="탈퇴사업자" name="member" <c:if test="${memberType eq '탈퇴사업자'}">checked</c:if> >탈퇴사업자
							</div>
							<div class="search_allday">
								<input type="radio" name="등록일로 조회" checked="checked"/>등록일로 조회
									<c:set value="<%=Today%>" var="today" />
								<input id="mindate" type="date" value="${beginDate }" name="beginDate" max="${today}">~
								<input id="maxdate" type="date" value="${today }" name="endDate" max="${today}">
							</div>
							<div class="keywordform">
								<input type="radio" name="검색으로 조회" checked/>검색으로 조회
									<select id="selectBox" class="searchType" name="search_type">
										<option value="전체" selected>전체</option>
										<option value="아이디" <c:if test="${search_type eq '아이디'}">selected</c:if> >아이디</option>
										<option value="이름" <c:if test="${search_type eq '이름'}">selected</c:if> >이름</option>
										<option value="등급" <c:if test="${search_type eq '등급'}">selected</c:if> >등급</option>
									</select>
								<input class="keyword" type="text" name="search_keyword" value="${search_keyword }">
								<input class="search_btn" type="submit" value="">
							</div>
						</form>
					</div>
				<div class="admindata_member">
					<table>
						<colgroup>
							<col class="memNum">
							<col class="memId">
							<col class="memName">
							<col class="memGrade">
							<col class="memPoint">
							<col class="memDate">
							<col span="2" class="memState">
						</colgroup>
						<tbody align="center">
							<tr>
								<th>회원번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>등급</th>
								<th>포인트</th>
								<th>가입일</th>
								<th>상태</th>
								<th></th>
							</tr>
							<c:choose>
								<c:when test="${empty member_list }">
									<tr>
										<td colspan=7><strong>회원목록이 없습니다.</strong></td>
									</tr>
								</c:when>
								<c:otherwise>
							<c:forEach var="item" items="${member_list }">
							<tr>
								<td>${item.memberNum }</td>
								<c:if test="${item.grade != null}">
								<td>
								<a class="admin_member" href="${contextPath}/admin/member/admin_memberUpdate.do?memberNum=${item.memberNum }">
								${item.memberId }</a>
								</td>
								</c:if>
								<c:if test="${item.grade == null}">
								<td>
								<a class="admin_member" href="${contextPath}/admin/member/admin_sellerUpdate.do?sellerNum=${item.memberNum }">
								${item.memberId }</a>
								</td>
								</c:if>
								<td>${item.memberName }</td>
								<td>${item.grade }</td>
								<td>${item.point }P</td>
								<td>${item.joinDate }</td>
								<c:if test="${item.del_yn == 'y' && item.grade != null}">
								<td class="member_state">탈퇴</td>
								<td><a href="${contextPath}/admin/member/update_Member.do?memberNum=${item.memberNum }&del_yn=${item.del_yn}">
								<input type="button" value="복구" onclick="return restore_check()"></a></td>
								</c:if>
								
								<c:if test="${item.del_yn == 'y' && item.grade == null}">
								<td class="member_state">탈퇴</td>
								<td><a href="${contextPath}/admin/member/update_Seller.do?sellerNum=${item.memberNum }&del_yn=${item.del_yn}">
								<input type="button" value="복구" onclick="return restore_check()"></a></td>
								</c:if>
								
								<c:if test="${item.del_yn != 'y'&& item.grade != null}">
								<td class="member_state">활동중</td>
								<td><a href="${contextPath}/admin/member/update_Member.do?memberNum=${item.memberNum }&del_yn=${item.del_yn}">
								<input type="button" value="탈퇴" onclick="return del_check()"></a></td>
								</c:if>
								
								<c:if test="${item.del_yn != 'y' && item.grade == null}">
								<td class="member_state">활동중</td>
								<td><a href="${contextPath}/admin/member/update_Seller.do?sellerNum=${item.memberNum }&del_yn=${item.del_yn}">
								<input type="button" value="탈퇴" onclick="return del_check()"></a></td>
								</c:if>
							</tr>							
							</c:forEach>
							</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>				
					<table class="all_admin_member">
						<tbody align="center">
							<tr>
								<td colspan="8" class="page_nation" style="padding-top: 20px;">
									<c:if test="${list == null }">
					                	<c:forEach   var="page" begin="1" end="10" step="1" >
							         		<c:if test="${secNum >1 && page==1 }">
							          			<a class="arrow prev" href="${contextPath}/admin/member/adminMemberMain.do?secNum=${secNum-1}&pageNum=1"></a>
							         		</c:if>
							          			<a class="active" href="${contextPath}/admin/member/adminMemberMain.do?secNum=${secNum}&pageNum=${page}">${(secNum-1)*10 +page } </a>
							         		<c:if test="${page ==10 }">
							          			<a class="arrow next" href="${contextPath}/admin/member/adminMemberMain.do?secNum=${secNum+1}&pageNum=1"></a>
							        		 </c:if> 
						      			</c:forEach> 
						      		</c:if>
						      		
						      		<c:if test="${not empty list }">
						      		 	<c:forEach   var="page" begin="1" end="10" step="1" >
							         		<c:if test="${secNum >1 && page==1 }">
							          			<a class="arrow prev" href="${contextPath}/admin/member/lineupMember.do?secNum=${secNum-1}&pageNum=1&member=${member}&beginDate=${beginDate}&endDate=${endDate}&search_type=${search_type}&search_keyword=${search_keyword}"></a>
							        		</c:if>
							          			<a class="active" href="${contextPath}/admin/member/lineupMember.do?secNum=${secNum}&pageNum=${page}&member=${member}&beginDate=${beginDate}&endDate=${endDate}&search_type=${search_type}&search_keyword=${search_keyword}">${(secNum-1)*10 +page } </a>
							         		<c:if test="${page ==10 }">
							          			<a class="arrow next" href="${contextPath}/admin/member/lineupMember.do?secNum=${secNum+1}&pageNum=1&member=${member}&beginDate=${beginDate}&endDate=${endDate}&search_type=${search_type}&search_keyword=${search_keyword}"></a>
							         		</c:if> 
						      			</c:forEach> 
						      		</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#seller_ck").click(function() {
			$("#selectBox option[value='등급']").hide();
			});
		$("#seller_ck2").click(function() {
			$("#selectBox option[value='등급']").hide();
			});
		$("#member_ck").click(function() {
			$("#selectBox option[value='등급']").show();
		});
		$("#member_ck2").click(function() {
			$("#selectBox option[value='등급']").show();
		});
	});

	</script>
</body>
</html>