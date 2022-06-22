<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function textCheck() {
	var text = document.getElementById("main_search").value;
    if (text.length < 2) {
        alert("검색어는 두글자 이상 입력하십시오.");
        return false;
    }
    return true;
}

function selectMenu(obj) {
	var test =obj.id; 
	var tag = document.getElementById(test).getElementsByTagName('ul')[0];
	console.log(tag);
	if(tag.style.display=='none'){
		tag.style.display='block';		
	}else{
		tag.style.display='none';		
	}
}
</script>
<style>
#menu {
	font:bold 24px "malgun gothic";
	width:400px;
	height:50px;
	color:black;
	line-height: 50px; 
	margin:0 auto;
}
#menu ul{
	padding: 0;
}
#menu > ul > li {
	position:relative;
	list-style: none;
	background: #ccc;
    margin-bottom: 1px;
    color: white;
    cursor: pointer;
  -ms-user-select: none; 
  -moz-user-select: -moz-none;
  -khtml-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
#menu > ul > li > ul {
	display:none;
	font-size:12px;
}
#menu > ul > li > ul > li{
	background: skyblue;
	padding-left: 10px;
}	
#menu > ul > li > ul > li > a{
	color: white;
}	
</style>
</head>
<body>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">사이트맵</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="off-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
          <li class="side_nav_login">
          	<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo }">
					<p>${memberInfo.memberName }님<br> 환영합니다.</p>
            	</c:when>
            	<c:otherwise>            	
            		<a href="${contextPath}/member/login.do">로그인</a>
            	</c:otherwise>
            </c:choose>
          </li>
          <li>
          	<div id="menu">          	
          	<ul>
          		<li id="productMenu" onclick="selectMenu(this)">&nbsp;&nbsp;상품
          			<ul style="display: none;">
          				<li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=1">여행가방 하드/소프트</a></li>
          				<li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=2">배낭/보조가방</a></li>
          				<li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=3">수납백/편의용품</a></li>
          				<li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=4">어댑터/전자</a></li>
          				<li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=5">캠핑용품</a></li>
          				<li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=6">렌탈</a></li>
          			</ul>
          		</li>
          		<c:if test="${isLogOn==true and not empty memberInfo }">
	          		<li id="mypageMenu" onclick="selectMenu(this)">&nbsp;&nbsp;마이페이지
	          			<ul style="display: none;">
	          				<li><a href="${contextPath}/mypage/mypagePoint.do">포인트/쿠폰/적립금</a></li>
	          				<li><a href="${contextPath}/mypage/mypageOrderList.do">주문/배송조회</a></li>
	          				<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=update">나의정보수정</a></li>
	          				<li><a href="${contextPath}/mypage/mypagePwCheck.do?my=delete">회원탈퇴</a></li>
	          			</ul>
	          		</li>          		
          		</c:if>	
          		<li id="boardMenu" onclick="selectMenu(this)">&nbsp;&nbsp;게시판
          			<ul style="display: none;">
          				<li><a href="${contextPath}/board/planboard.do">일정 게시판</a></li>
          				<li><a href="${contextPath}/board/reviewboard.do">리뷰 게시판</a></li>
          			</ul>
          		</li>          			
          		<li id="serviceMenu" onclick="selectMenu(this)">&nbsp;&nbsp;고객센터
          			<ul style="display: none;">
          				<li><a href="${contextPath}/service/service.do">자주 묻는 질문</a></li>
          				<li><a href="${contextPath}/service/serviceqna.do">1:1 문의</a></li>
          			</ul>
          		</li>
          	</ul> 
          	</div> 
          </li>
        </ul>
      </div>
    </div>
    
<div id="header_wrap">
	<div class="header">
		<div class="shopinfo logo_wrap"><a href="${contextPath}/main/main.do">
			<img alt="#" src="${contextPath}/resources/image/main_logo.png">
		</a></div>
		<div class="search">
			<form name="frmSearch" action="${contextPath}/goods/searchGoods.do" onsubmit="return textCheck()">
				<input id="main_search" class="main_search_input" name="searchWord" type="text"/>
				<input type="image" class="main_search_btn" src="${contextPath}/resources/image/search.png" alt="검색"/>
			</form>
		</div>					
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo }">
					<p><a class="headmenu" href="${contextPath}/member/logout.do">로그아웃</a></p>
				</c:when>
				<c:when test="${isLogOn==true and not empty sellerInfo }">
					<p><a class="headmenu" href="${contextPath}/seller/logout.do">로그아웃</a></p>
					<p><a class="headmenu" href="${contextPath}/seller/goods/sellerGoodsMain.do">판매자</a></p>
				</c:when>				
				<c:otherwise>
					<p><a class="headmenu" href="${contextPath}/member/login.do">로그인</a></p>
					<p><a class="headmenu" href="${contextPath}/member/memberSelect.do">회원가입</a></p>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${isLogOn==true and memberInfo.memberId=='admin' }">					
					<p><a class="headmenu" href="${contextPath}/admin/sales/adminMain.do">관리자</a></p>
					<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
				</c:when>		
				<c:when test="${isLogOn==true and memberInfo.memberId!='admin' and not empty memberInfo}">					
					<p><a class="headmenu" href="${contextPath}/mypage/mypageMain.do">마이페이지</a></p>	
					<p><a class="headmenu" href="${contextPath}/cart/myCartList.do">장바구니</a></p>
					<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
					<p data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"><a class="headmenu">사이트맵</a></p>
				</c:when>			
				<c:when test="${isLogOn==true and not empty sellerInfo }">					
				</c:when>			
				<c:otherwise>	
					<p><a class="headmenu" href="${contextPath}/cart/myCartList.do">장바구니</a></p>
					<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
					<p data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"><a class="headmenu">사이트맵</a></p>
				</c:otherwise>
			</c:choose>			
			
<%--  		<p><a class="headmenu" href="${contextPath}/member/login.do">로그아웃</a></p>
		<p><a class="headmenu" href="${contextPath}/main/cart.do">장바구니</a></p>
		<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
		<p data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"><a class="headmenu">사이트맵</a></p>
		<p><a class="headmenu" href="${contextPath}/seller/goods/sellerGoodsMain.do">판매자</a></p> --%>

<%--  		<p><a class="headmenu" href="${contextPath}/member/login.do">로그아웃</a></p>
		<p><a class="headmenu" href="${contextPath}/main/cart.do">장바구니</a></p>
		<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
		<p data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"><a class="headmenu">사이트맵</a></p>

 --%>

<%-- 		<p><a class="headmenu" href="${contextPath}/member/login.do">로그아웃</a></p>
		<p><a class="headmenu" href="${contextPath}/mypage/mypageMain.do">마이페이지</a></p>
		<p><a class="headmenu" href="${contextPath}/main/cart.do">장바구니</a></p>
		<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
		<p data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"><a class="headmenu">사이트맵</a></p>
	 --%>
	 <%-- 
		<p><a class="headmenu" href="${contextPath}/member/login.do">로그인</a></p>
		<p><a class="headmenu" href="${contextPath}/member/memberSelect.do">회원가입</a></p>
		<p><a class="headmenu" href="${contextPath}/main/cart.do">장바구니</a></p>
		<p><a class="headmenu" href="${contextPath}/service/service.do">고객센터</a></p>
		<p data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar"><a class="headmenu">사이트맵</a></p>
	 --%></div>
</div>
<nav id="primary_nav_wrap">
<ul>
  <li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=1">여행가방 하드/소프트</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=1&p_subNum=1">기내가방</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=1&p_subNum=8">중형가방</a>  
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=1&p_subNum=9">대형가방</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=1&p_subNum=10">여행가방세트</a>  
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=1&p_subNum=11">유아 / 아동 여행가방</a>      		
      	</li>
      	<li class="nav_li_img"> 
      		<a href="${contextPath}/goods/productdetail.do?productNum=1"> 
				<img alt="#" src="${contextPath}/thumbnails.do?productNum=1&fileName=item1.JPG">
			</a> 
      		<a href="${contextPath}/goods/productdetail.do?productNum=12"> 
				<img alt="#" src="${contextPath}/thumbnails.do?productNum=12&fileName=item2.JPG">
			</a> 
      		<a href="${contextPath}/goods/productdetail.do?productNum=13"> 
				<img alt="#" src="${contextPath}/thumbnails.do?productNum=13&fileName=item3.JPG">
			</a>     	
		</li>
      </ul>   
  </li>
  <li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=2">배낭/보조가방</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=2">여행배낭</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=12">도난방지가방</a> 
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=13">백팩 / 보조배낭</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=14">보스턴백 / 더플백</a> 
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=15">여행보조가방</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=16">접이식가방 / 폴딩백</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=2&p_subNum=17">침낭/타올/멀티스카프</a>      		
      	</li>
      	<li class="nav_li_img">      	
      		<a href="${contextPath}/goods/productdetail.do?productNum=47"> 
				<img alt="#" src="${contextPath}/thumbnails.do?productNum=47&fileName=item47.JPG">
			</a> 
      		<a href="${contextPath}/goods/productdetail.do?productNum=48"> 
				<img alt="#" src="${contextPath}/thumbnails.do?productNum=48&fileName=item48.JPG">
			</a> 
      		<a href="${contextPath}/goods/productdetail.do?productNum=49"> 
				<img alt="#" src="${contextPath}/thumbnails.do?productNum=49&fileName=item49.JPG">
			</a> 
     	</li>
      </ul>  
  </li>
  <li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=3">수납백/편의용품</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=3">여행파우치세트</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=18">의류 / 속옷 파우치</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=19">다용도 여행파우치</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=20">목베개/안대/슬리퍼</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=21">압축팩 / 지퍼백</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=22">편의용품 / 우의</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=3&p_subNum=23">디지털 / 가전</a>      		
      	</li>
      </ul> 
  </li>
  <li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=4">어댑터/전자</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=4&p_subNum=4">멀티어댑터</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=4&p_subNum=24">국가별어댑터</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=4&p_subNum=25">여행별 전자제품</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=4&p_subNum=26">후레쉬 / 북라이트</a>  		
      	</li>
      </ul> 
  </li>
  <li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=5">캠핑 용품</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=5&p_subNum=5">캠핑용품</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=5&p_subNum=27">등산용품</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=5&p_subNum=28">여행신발</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=5&p_subNum=29">슬리퍼</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=5&p_subNum=30">물놀이용품</a>
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=5&p_subNum=31">기타</a>      		
      	</li>
      </ul> 
  </li>  
  <li><a href="${contextPath}/goods/GoodsList.do?p_mainNum=6&p_subNum=6">렌탈</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/goods/GoodsList.do?p_mainNum=6&p_subNum=6">렌탈</a>     		
      	</li>
      </ul> 
  </li>
  <li><a href="${contextPath}/board/planboard.do">게시판</a>
      <ul>
      	<li class="nav_li">
      		<a href="${contextPath}/board/planboard.do">일정 게시판</a>
      		<a href="${contextPath}/board/reviewboard.do">리뷰 게시판</a>      		
      	</li>
      </ul>  
  </li>
</ul>
</nav>

</body>
</html>