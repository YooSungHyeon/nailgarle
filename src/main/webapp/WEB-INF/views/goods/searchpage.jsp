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

</script>
<style>
.layout {
	padding-top: 40px;
	width: 100%;
}

.product_top_topic_container {
	
}

.product_top_topic_container h2 {
	padding: 80px 0 50px;
	text-align: center;
}

.sort_container {
	width: 1100px;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}

.sort_container p {
	display: inline-block;
	margin: 0;
}

.product_list_container {
	width: 1100px;
}

.list_container {
	width: 1100px;
	padding: 0;
}

.list_container .li_container {
	display: inline-block;
	width: 24.5%;
	height: 380px;
	padding: 10px;
}

.list_container .li_container img {
	width: 250px;
	height: 250px
}

.list_container .list_box {
	width: 250px;
	height: 250px;
	position: relative;
}

.list_container .pop_wish {
	display: none;
	position: absolute;
	bottom: 0;
	left: 0;
	z-index: 10;
	width: 100%;
	border: 0;
	background: rgba(0, 0, 0, 0.5);
	list-style: none;
	text-decoration: none;
	color: white;
}

.list_container .pop_wish a {
	text-decoration: none;
	color: white;
	text-align: center;
	font-size: 20px;
}

.list_container .pop_wish_sold_out {
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
    border: 0;
    padding: 0;
    list-style: none;    
}
.list_container .pop_wish_sold_out img{
	opacity: 0.8;
}

.list_container .list_box:hover>.pop_wish {
	display: block;
}

.list_container .list_info p {
	margin: 0;
	padding: 0;
}
.box_search {
    padding-top: 28px;
    border: 1px solid #d9d9d9;
    text-align: center;
    width: 1300px;
    margin-bottom: 30px;
}
.box_search .search_frm {
	width: 450px;
    height: 65px;
    margin: 0 auto;
    text-align: left;
}
.box_search .search_frm .box_input {
    float: left;
    border: 3px solid #231f20;
}
.box_search .search_frm .box_input .input {
    float: left;
    width: 400px;
    height: 34px;
    padding: 0 10px;
    border: none;
    line-height: 34px;
}
.box_search .search_frm .box_input .search_btn {
    float: left;
}
.result_cate {
    overflow: hidden;
    padding: 0 25px;
    border-top: 1px solid #ececec;
    background: #f9f9f9;
}
.result_cate .kind {
    float: left;
    line-height: 38px;
}
.result_cate .list {
    width: 85%;
    margin-left: 15%;
    text-align: left;
}
.result_cate .list li {
    overflow: hidden;
    text-overflow: ellipsis;
    float: left;
    width: 20%;
    height: 40px;
    white-space: nowrap;
    line-height: 38px;
}
.result_cate .list li a{
	text-decoration: none;
	color: #777;
    font-size: 14px;
}
.result_cate .list li span {
    color: #aaa;
    font-size: 14px;
}

</style>
</head>
<body>
	<div class="layout">
		<div class="product_top_topic_container">
			<div>
				<h2>검색결과</h2>
			</div>
			<div class="slider_container">
				<div class="box_search">
					<form method="get" action="${contextPath}/goods/searchGoods.do" onsubmit="return textCheck()"  style="margin: 0px">
						<div class="search_frm">
							<div class="box_input">
								<input id="main_search" type="text" name="searchWord" value="${searchWord}" class="input">
								<input type="image"	src="${contextPath}/resources/image/findSearch.png" alt="검색" class="search_btn">
							</div>
						</div>
					</form>
					<div class="result_cate result_cate_basic">
						<strong class="kind">카테고리</strong>
						<ul class="list">
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}" class="selected">ALL</a> <span>(${goodsCount[0].allCategory})</span></li>
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}&p_mainNum=1">여행가방 하드/소프트</a> <span>(${goodsCount[0].carrier})</span></li>
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}&p_mainNum=2">배낭/보조가방</a> <span>(${goodsCount[0].backPack})</span></li>
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}&p_mainNum=3">수납백/편의용품</a> <span>(${goodsCount[0].subBackPack})</span></li>
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}&p_mainNum=4">어댑터/전자</a> <span>(${goodsCount[0].adepter})</span></li>
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}&p_mainNum=5">캠핑 용품</a> <span>(${goodsCount[0].camp})</span></li>
							<li><a href="${contextPath}/goods/searchGoods.do?searchWord=${searchWord}&p_mainNum=6">중고</a> <span>(${goodsCount[0].used})</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="product_list_container">
			<ul class="list_container">
			<c:forEach var="item" items="${goodsList }">
				<li class="li_container">
					<div class="list_box">					
						<a href="${contextPath}/goods/productdetail.do?productNum=${item.productNum}">
							<img alt="#" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">
						</a>
						<c:choose>
						<c:when test="${item.productsStock == 0}">
							<ul class="pop_wish_sold_out">
								<li>
									<img alt="#" src="${contextPath}/resources/image/soldOut.png">
								</li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="pop_wish">
								<li>
									<a href="javascript:add_cart('${item.productNum }','${item.productOption }')">장바구니에 담아가기</a>
								</li>
							</ul>								
						</c:otherwise>
						</c:choose>				
					</div>
					<div class="list_info">
						<p>상품명 : ${item.productName}</p>
						<p>가격 : ${item.originPrice}</p>
						<p>할인가 : ${item.productPrice}</p>						
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>

</body>
</html>