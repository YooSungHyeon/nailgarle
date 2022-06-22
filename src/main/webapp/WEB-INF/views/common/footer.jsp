<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="footer">
		<div class="shopinfo wrap_inner">
			<div class="ft_logo"><img src="${contextPath}/resources/image/main_logo.png" alt="#"></div>
			<div class="info_wrap">
				<ul class="menu">
					<li><a href="#" target="_blank">회사소개</a></li>
					<li><a href="#">이용약관</a></li>
					<li class="privacy"><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">이메일무단수집거부</a></li>
				</ul>
				<address class="info">
					회사명 : (주) 내일갈래<span>|</span>
					대표자 : 유성현<span>|</span>
					사업자등록번호 : 123-45-67890 <a href="#">사업자등록확인</a><span>|</span>
					통신판매업자신고번호 : 2022-대전서구-0000호<span>|</span>
					TEL : 1599-1234<br>
					FAX : 070-1234-5678<span>|</span>
					사업장주소 : 충청남도&nbsp;대전광역시&nbsp;서구&nbsp;갈마동&nbsp;325,&nbsp;3층&nbsp;그린컴퓨터아트학원&nbsp;(갈마동,&nbsp;그린컴퓨터&nbsp;아트학원)<br>
					개인정보보호책임자 : 유성현<span>|</span>
					이메일 : <a class="mail" href="mailto:nailgare@java.com">nailgare@java.com</a><br>
					<p class="pg">고객님은 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한 Js사의 구매안전서비스를 이용하실 수 있습니다. <a href="#">서비스가입사실확인&gt;</a></p>
				</address>
			</div>
			<p class="copyright">ⓒ (주) 내일갈래. ALL RIGHTS RESERVED.</p>
		</div>
</div>

</body>
</html>