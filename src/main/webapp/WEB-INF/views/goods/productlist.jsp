<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script type="text/javascript">
function add_cart(productNum, option) {
	if(option!="n"){
		alert("옵션항목이 있습니다. 옵션을 선택해주세요.");
		location.href = "${contextPath}/goods/productdetail.do?productNum="+productNum;
		return false;
	}
	
	if(${p_mainNum}=="6"){
		alert("렌탈기간을 정해주세요");
		location.href = "${contextPath}/goods/productdetail.do?productNum="+productNum;
		return false;
	}
	
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addGoodsInCart.do",
		data : {
			productNum : productNum,
			cart_goods_qty : 1
		},
		success : function(data, textStatus) {
			if (data.trim() == 'add_success') {
				if (confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
	                // 확인 버튼 클릭 시 동작
	                location.href='${contextPath}/cart/myCartList.do';
	            } else {
	                // 취소 버튼 클릭 시 동작
	            }
			} else if (data.trim() == 'already_existed') {
				alert("이미 카트에 등록된 상품입니다.");
			} else if (data.trim() == 'not_login'){
				alert("로그인 후 사용가능합니다."); // 로그인 유효성검사
			}

		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다." + data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
		}
	}); //end ajax	
}
</script>
<style>
.layout {
	padding-top: 40px;
	width: 100%;
}
.slick-slide {
	height:auto;
}

.product_top_topic_container{
	background: #f0f0f0;
}
.product_top_topic_container h6{
	text-align: center;
    margin-left: -500px;
}

.slider_container {
  font-family:Arial;
  width:800px;
  display:block;
  margin:0 auto;
}


.slider_container a{
	text-decoration: none;;
}
.slider_container img {
  display:inline-block;
    margin: 10px;
    position: relative;
    text-align: center;
    width:150px;
    height: 150px;
	border-radius: 10%;
}
.slider_container .p_content{
  display:inline-block;
}
.sort_container{
	width: 1100px;
	border: solid black;
	border-width: 0px 0px 1px 0px;
}
.sort_container p{
	display: inline-block;
	margin: 0;
}
.sort_container #sort_type{
	float: right;
}
.product_list_container{
	width: 1100px;
}
.list_container{
	width: 1100px;
	padding: 0;
}
.list_container .li_container{
	display:inline-block;
	width: 24.5%;
	height: 380px;
	padding: 10px;
}
.list_container .li_container img{
	width: 250px;
    height: 250px
}
.list_container .list_box{
	width:250px;
	height: 250px;
	position: relative;
}
.list_container .pop_wish {
    display: none;
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    border: 0;
    background: rgba(0,0,0,0.5);
    list-style: none;
    text-decoration: none;
    color:white;
}
.list_container .pop_wish a{
    text-decoration: none;
    color:white;
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

.list_container .list_box:hover > .pop_wish{
	display: block;
}
.list_container .list_info p{
	margin: 0;
	padding: 0;
}

.pageInfo{
	list-style: none;
	margin: 50px 0 0 100px;
	text-align: center;
}
.pageInfo li{
	display:inline;   
	color: #9e9e9e;
    vertical-align: middle;
}
.pageInfo li a{
	display: inline-block;
    width: 35px;
    height: 35px;
    border: 1px solid #ececec;
    background: #fff;
    color: #a5a5a5;
    font-size: 13px;
    line-height: 37px;
    text-decoration: none;
}

<!--
CSS부분
 
삽입위에다삽입--
>
</style>
</head>
<body>
	<div class="layout">
		<div class="product_top_topic_container">
			<div>
				<h6>Home > ${goodsMap.allItem[0].mainCategoryName }
				<c:if test="${p_subNum!='not_select'}">
					- ${goodsMap.allItem[0].subCategoryName }
                </c:if>
				 </h6>
			</div>
			<div class="slider_container">
				<div class="slider slider-for">				
					<c:forEach var="item" items="${goodsMap.bestItem }">
						<div>
							<a href="${contextPath}/goods/productdetail.do?productNum=${item.productNum}">
								<img alt="#" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">
							</a>
							<div class="p_content">	<br><br>					
								<span>상품명 : ${item.productName}</span><br>
								<span>원가 : ${item.originPrice}</span><br>
								<span>할인가 : ${item.productPrice}</span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="slider slider-nav">					
					<c:forEach var="item" items="${goodsMap.bestItem }">
					<div>
						<img alt="#" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="product_sort_container">
			<div class="sort_container">
				<p>총 ${allAmount}개의 상품이 있습니다.</p>
				<select id="sort_type" onchange="selectSort()">
					<option value="new" ${selectSort == 'new' ? 'selected="selected"' : '' }>최신순</option>
					<option value="star" ${selectSort == 'star' ? 'selected="selected"' : '' }>인기순</option>
					<option value="high" ${selectSort == 'high' ? 'selected="selected"' : '' }>높은 가격 순</option>
					<option value="low" ${selectSort == 'low' ? 'selected="selected"' : '' }>낮은 가격 순</option>
				</select>
			</div>
		</div>
		<div class="product_list_container">
			<ul class="list_container">
			<c:forEach var="item" items="${goodsMap.allItem }">
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
			<ul id="pageInfo" class="pageInfo">
				<!-- 이전페이지 버튼 -->					
					<c:set var="endPage" value="${lastPage-(section-1)*10}" />
			    <c:if test="${lastPage-(section-1)*10>=10}">
					<c:set var="endPage" value="10" />
                </c:if>
			    <c:if test="${section>1}">
                    <li class="pageInfo_btn previous"><a href=""><</a></li>
                </c:if>
              	<c:forEach var="num" begin="${(section-1)*10+1}" end="${(section-1)*10+endPage}">
	                    <li class="pageInfo_btn"><a href="javascript:selectPage('${num }','${section }')">${num}</a></li>
	            </c:forEach>
	            <!-- 다음페이지 버튼 -->
                <c:if test="${lastPage-(section-1)*10>10}">
                    <li class="pageInfo_btn next"><a href="">></a></li>
                </c:if> 
			</ul>
	</div>
<script type="text/javascript">
$('.slider-for').slick({
	   slidesToShow: 1,
	   slidesToScroll: 1,
	   arrows: false,
	   fade: true,
	   autoplay: true,
	   autoplaySpeed: 3500,
	   asNavFor: '.slider-nav'
	 });
	 $('.slider-nav').slick({
	   slidesToShow: 3,
	   slidesToScroll: 1,
	   asNavFor: '.slider-for',
	   dots: true,  
	   autoplay: true,
	   autoplaySpeed: 3500,
	   focusOnSelect: true
	 });

	 $('a[data-slide]').click(function(e) {
	   e.preventDefault();
	   var slideno = $(this).data('slide');
	   $('.slider-nav').slick('slickGoTo', slideno - 1);
	 });
	 
	 function selectSort(){
		 var sort = document.getElementById("sort_type").value;
		 location.href='${contextPath}/goods/GoodsList.do?p_mainNum=${p_mainNum}&p_subNum=${p_subNum}&selectSort='+sort;
	}
	 function selectPage(num, section){
		 location.href='${contextPath}/goods/GoodsList.do?p_mainNum=${p_mainNum}&p_subNum=${p_subNum}&section='+section+"&pageNum="+num;
	}
</script>
</body>
</html>