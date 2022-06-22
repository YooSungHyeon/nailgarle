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

.service_container .sidebar .inQna {
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

.service_main h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.service_main table {
	width: 950px;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}

.service_main font {
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
}

/* 마이페이지 메인의 tr, th, td 태그 */
.service_main th {
	background: darkseagreen;
	color: #fff;
}

.service_main td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.service_main tr:nth-of-type(odd) {
	background: #eee;
}

/* 칼럼 너비 */
.service_main .scNum {
	width: 8%;
}

.service_main .scType {
	width: 15%;
}

.service_main .scName {
	
}

.service_main .scMember {
	width: 15%;
}

.service_main .scDate {
	width: 15%;
}

.service_main .scAns {
	width: 15%;
}

/* 제목 a태그 */
.service_title {
	text-decoration: none;
	font-weight: bold;
	color: #333;
}

.detail_text {
	margin-top: 15px;
	width: -webkit-fill-available;
}

.qnabutton {
	float: right;
	margin-right: 25px;
	margin-top: 20px;
	text-align: right;
}

.qna_p p {
	text-align: left;
	margin-bottom: 0px;
}

.ans_area_btn {
	float: right;
	margin: 7px;
}
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
.keywordform {
	float: left;
	margin: 10px 30px;
}

/* 검색창 인풋박스 */
.keywordform .keyword {
	border: 1px solid #dbdbdb;
	width: 185px;
	height: 26px;
}

/* 검색창 셀렉박스 */
.keywordform .search_type {
	border: 1px solid #dbdbdb;
	width: 90px;
	height: 26px;
}

/* 검색창 검색버튼 */
.keywordform .search_btn {
	background: url(${contextPath}/resources/image/search_btn.png);
	background-repeat: no-repeat;
	width: 26px;
	height: 26px;
	border: none;
}
</style>
</head>
<body>
	<div class="layout">
		<div class="service_container">
			<h1>고객센터</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/service/service.do"><img
								class="board_img"
								src="${contextPath}/resources/image/board_service.svg" />자주 묻는
								질문</a></li>
						<li><a class="inQna"
							href="${contextPath}/service/serviceqna.do"><img
								class="board_img"
								src="${contextPath}/resources/image/board_qna.svg" />1:1 문의내역</a></li>
					</ul>
				</nav>
			</div>

			<div class="service_main">
				<div class="keywordform">
					<form action="${contextPath }/service/searchQna.do" method="post">
						<select id="search_type" class="search_type" name="search_type">
							<option value="전체" <c:if test="${search_type eq '전체'}">selected</c:if>>전체</option>
							<option value="분류" <c:if test="${search_type eq '분류'}">selected</c:if>>분류</option>
							<option value="제목" <c:if test="${search_type eq '제목'}">selected</c:if>>제목</option>
							<option value="작성자" <c:if test="${search_type eq '작성자'}">selected</c:if>>작성자</option>
						</select> <input type="text" class="keyword" id="keyword" name="search_keyword"  value="${search_keyword }" />
						<input type="submit" class="search_btn" value="">
					</form>
				</div>
				<table>
					<colgroup>
						<col class="scNum">
						<col class="scType">
						<col class="scName">
						<col class="scMember">
						<col class="scDate">
						<col class="scAns">
					</colgroup>

					<tbody align="center">
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변여부</th>
						</tr>
						<c:forEach var="qnaList" items="${qnalist.qnalist }"
							varStatus="count">
							<tr>
								<td>${qnaList.num}</td>
								<td>${qnaList.qnaType}</td>
								<%-- <td><a class="service_title" style="CURSOR: hand" onclick="serviceQna(${count.index})">${qnaList.qnaTitle}</a></td> --%>
								<td>
								<c:if test="${qnaList.qnaSecret eq 'Y'}">
									<c:choose>
										<c:when test="${qnaList.memberId eq memberInfo.memberId || memberInfo.memberId eq 'admin'}">
											
												<a class="service_title" style="CURSOR: hand" onclick="serviceQna(${count.index})">${qnaList.qnaTitle}</a>
											
										</c:when>
											<c:otherwise>
												<img src="${contextPath}/resources/image/board_qna_secret.png" style="width: 15px;" alt="비밀글" /><Strong style="color: grey;"> 비밀글은 작성자와 관리자만 볼 수 있습니다.</Strong>
											</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${qnaList.qnaSecret eq 'N'}">
									<a class="service_title" style="CURSOR: hand" onclick="serviceQna(${count.index})">${qnaList.qnaTitle}</a>
								</c:if>
								<td>${qnaList.memberId}</td>
								<td><fmt:formatDate value="${qnaList.qnaRegDate }" /></td>
								<td><c:choose>
										<c:when test="${empty qnaList.qnaAns }">
											<strong>답변대기</strong>
										</c:when>
										<c:otherwise>
											<strong style="color: grey; text-decoration: line-through;">답변완료</strong>
										</c:otherwise>
									</c:choose></td>
							</tr>
							<tr id="serviceqna_${count.index}" style="display: none">
								<td class="qna_p" colspan="5"
									style="padding-bottom: 20px; padding-top: 20px;"><c:if
										test="${not empty qnaList.productName}">
										<p>상품명: ${qnaList.productName }</p>
										<br>
									</c:if>
									<p>질문: ${qnaList.qnaText }</p> <br>
									<p>답변: ${qnaList.qnaAns }</p>
									<form id="Qnacomment" name="qnaAns"
										action="${contextPath}/service/qnaAns.do" method="post">
										<div class="ans_area" id="qnacomment_${count.index}"
											style="display: none">
											<textarea class="detail_text" name="qnaAns"
												placeholder="문의 답글"></textarea>
											<input type="hidden" value="${qnaList.qnaNum}" name="qnaNum" />
											<input class="ans_area_btn" type="submit" value="확인" />
										</div>
									</form></td>
								<td><c:if
										test="${qnaList.memberId==memberInfo.memberId || memberInfo.memberId == 'admin'}">
										<c:if
											test="${empty qnaList.qnaAns || memberInfo.memberId =='admin'}">
											<a
												href="${contextPath}/service/selectQna.do?memberId=${qnaList.memberId}&qnaNum=${qnaList.qnaNum}">
												<input type="button" value="수정" id="button" />
											</a>
										</c:if>
										<a
											href="${contextPath}/service/deleteQna.do?memberId=${qnaList.memberId}&qnaNum=${qnaList.qnaNum}">
											<input type="button" value="삭제" id="button" />
										</a>
									</c:if> <c:if
										test="${isLogOn==true and memberInfo.memberId =='admin' }">
										<a style="CURSOR: hand" onclick="qnaComment(${count.index})">
											<input type="button" value="답글" id="button" />
										</a>
									</c:if></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan=6>
								<c:if test="${empty qnalist.qnalist }">
									<p style="text-align:center"><strong>검색하신 결과가 없습니다.</strong></p>
								</c:if>
							</td>
						</tr>
					</tbody>
				</table>
				<table style="border:none;">
					<tr style="background-color:white; text-align:center; ">
						<c:if test="${not empty list }">
						<td colspan="6" class="page_nation"><c:forEach var="page"
									begin="1" end="10" step="1">
									<c:if test="${section >1 && page==1 }">
										<a class="arrow prev" href="${contextPath}/service/serviceqna.do?section=${section-1}&pageNum=${(section-1)*10-9}"></a>
									</c:if>
										<a class="active" href="${contextPath}/service/serviceqna.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }</a>
									<c:if test="${page ==10 }">
										<a class="arrow next" href="${contextPath}/service/serviceqna.do?section=${section+1}&pageNum=${section*10+1}"></a>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
							<c:if test="${empty list }">
							<td colspan="6" class="page_nation"><c:forEach var="page"
									begin="1" end="10" step="1">
									<c:if test="${section >1 && page==1 }">
										<a class="arrow prev" href="${contextPath}/service/searchQna.do?section=${section-1}&pageNum=${(section-1)*10-9}&search_keyword=${search_keyword}&search_type=${search_type}"></a>
									</c:if>
										<a class="active" href="${contextPath}/service/searchQna.do?section=${section}&pageNum=${page}&search_keyword=${search_keyword}&search_type=${search_type}">${(section-1)*10 +page }</a>
									<c:if test="${page ==10 }">
										<a class="arrow next" href="${contextPath}/service/searchQna.do?section=${section+1}&pageNum=${section*10+1}&search_keyword=${search_keyword}&search_type=${search_type}"></a>
									</c:if>
								</c:forEach>
							</td>
							</c:if>
		      		</tr>
	      		
				
				</table>
				<c:if test="${isLogOn==true and not empty memberInfo }">
					<p class="qnabutton">
						<a href="${contextPath}/service/serviceqna2.do"> <input
							type="button" value="1:1문의하기" /></a>
					</p>
				</c:if>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function serviceQna(data) {
		var svc = document.getElementById('serviceqna_'+data);
		if(svc.style.display=='none') {
			svc.style.display='';
			} else {
				svc.style.display='none';
				}
	}
	function qnaComment(data){
		var qnc = document.getElementById('qnacomment_'+data);
		if(qnc.style.display=='none') {
			qnc.style.display='';
			} else {
				qnc.style.display='none';
			}
	}
</script>
</body>
</html>