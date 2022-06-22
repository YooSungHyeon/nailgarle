<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

<style>
.layout{
	padding-top:40px;
	width:100%;
}
.carousel {
    width: 1920px;
}

#carouselExampleIndicators img{
	width:1920px;
	height:500px;
}

#main_container{
	width:1550px;
}

.BestItemTitle{
	margin-top:50px;
	text-align: center;
    font-family: poppins;
}


.BestItemList{	
	text-align: center;
}

.BestItem{	
	text-align: center;
	width:250px;
	height:300px;
	display: inline-block;
}

.BestItem img{	
	width:200px;
	height:200px;
	border-radius: 50%;
}

.BestItem span{	
    font-size: 16px;
	font-weight:700;
}

.NewItemTitle{
	text-align: center;
    font-family: poppins;
}


.NewItemList{	
	text-align: center;
}

.NewItem{	
	text-align: center;
	width:250px;
	height:300px;
	display: inline-block;
}

.NewItem img{	
	width:200px;
	height:200px;
	border-radius: 50%;
}

.NewItem span{	
    font-size: 16px;
	font-weight:700;
}

.MDPickTitle{
	text-align: center;
    font-family: poppins;
}


.MDPickList{	
	text-align: center;
}

.MDPick{	
	text-align: center;
	width:250px;
	height:300px;
	display: inline-block;
}

.MDPick img{	
	width:200px;
	height:200px;
	border-radius: 50%;
}

.MDPick span{	
    font-size: 16px;
	font-weight:700;
}
<!-- CSS부분 삽입-->

</style>
</head>
<body>   
<div class="layout">
<!-- body부분 삽입--><div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active"><a href="${contextPath}/main/main.do">
	      <img src="${contextPath}/resources/image/slide.png" alt="..."></a>
	    </div>
	    <div class="carousel-item"><a href="${contextPath}/main/main.do">
	      <img src="${contextPath}/resources/image/slide2.png" alt="..."></a>
	    </div>
	    <div class="carousel-item"><a href="${contextPath}/main/main.do">
	      <img src="${contextPath}/resources/image/slide3.png" alt="..."></a>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	<div id="main_container">
		<div class="BestItemTitle">
			<h3>BEST ITEM</h3>
		</div>
		<div class="BestItemList slider slider-nav">		
			<c:forEach var="item" items="${goodsMap.bestItem }">
			<div class="BestItem">
				<a href="${contextPath}/goods/productdetail.do?productNum=${item.productNum}">
					<img alt="BestItem" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">
				</a><br>
				<span>${item.productName}</span>
			</div>
			</c:forEach>
		</div>
		<div class="NewItemTitle">
			<h3>NEW ITEM</h3>
		</div>
		<div class="NewItemList slider slider-nav">
			<c:forEach var="item" items="${goodsMap.NewItem }">
			<div class="NewItem">
				<a href="${contextPath}/goods/productdetail.do?productNum=${item.productNum}">
					<img alt="BestItem" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">
				</a><br>
				<span>${item.productName}</span>
			</div>
			</c:forEach>
		</div>
		<div class="MDPickTitle">
			<h3>MD PICK</h3>
		</div>
		<div class="MDPickList slider slider-nav">
			<c:forEach var="item" items="${goodsMap.MDPick }">
			<div class="MDPick">
				<a href="${contextPath}/goods/productdetail.do?productNum=${item.productNum}">
					<img alt="BestItem" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}">
				</a><br>
				<span>${item.productName}</span>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<script type="text/javascript">
	 $('.slider-nav').slick({
	   slidesToShow: 4,
	   slidesToScroll: 1, 
	   autoplay: true,
	   autoplaySpeed: 3500,
	   focusOnSelect: true
	 });

	 $('a[data-slide]').click(function(e) {
	   e.preventDefault();
	   var slideno = $(this).data('slide');
	   $('.slider-nav').slick('slickGoTo', slideno - 1);
	 });
</script>
</body>
</html>