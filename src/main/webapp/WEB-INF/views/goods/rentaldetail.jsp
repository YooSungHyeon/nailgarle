<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="goods" value="${goodsMap.goodsVO}" />
<c:set var="imageList" value="${goodsMap.imageList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<script type="text/javascript">

window.onload = function(){
	var today = new Date();

	var year = today.getFullYear();
	var month = ("0" + (today.getMonth() + 1)).slice(-2);
	var day = ("0" + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	document.getElementById("rental_start").setAttribute("min", dateString);
}

function fn_rental() {
	var start = document.getElementById("rental_start");
	var end = document.getElementById("rental_end");
	var date = new Date(start.value);
	date.setDate(date.getDate() + 1);
	var e_date= date.getFullYear()+'-'+(("0" + (date.getMonth() + 1)).slice(-2))+'-'+(("0" + date.getDate()).slice(-2));
	$("#rental_end").attr("disabled", false);
	end.setAttribute("min", e_date);
}

function fn_order_each_goods(productNum, productName, productPrice, productSale, fileName, productDelivery) {
	var number_qty = document.getElementById("number_qty").value;
	var start = document.getElementById("rental_start").value;
	var end = document.getElementById("rental_end").value;
	console.log(start);

	const date1 = new Date(start);
	const date2 = new Date(end);
	  
	const diffDate = date1.getTime() - date2.getTime();
	  
	const dateDays = Math.abs(diffDate / (1000 * 3600 * 24));
	
	
	if(start == ""){
		alert("대여일을 선택해주세요.");
		return false;
	}
	if(end == ""){
		alert("반납일을 선택해주세요.");
		return false;
	}
	
	var formObj = document.createElement("form");
	var i_productNum = document.createElement("input");
	var i_productName = document.createElement("input");
	var i_productPrice = document.createElement("input");
	var i_productSale = document.createElement("input");
	var i_productQuantity = document.createElement("input");
	var i_orderAmount = document.createElement("input");
	var i_fileName = document.createElement("input");
	var i_productDelivery = document.createElement("input");
	var i_rental_start = document.createElement("input");
	var i_rental_end = document.createElement("input");

	i_productNum.name = "productNum";
	i_productName.name = "productName";
	i_productPrice.name = "productPrice";
	i_productSale.name = "productSale";
	i_productQuantity.name = "productQuantity";
	i_orderAmount.name = "orderAmount";
	i_fileName.name = "fileName";
	i_productDelivery.name = "productDelivery";
	i_rental_start.name = "rentalStart";
	i_rental_end.name = "rentalEnd";

	i_productNum.value = productNum;
	i_productQuantity.value = number_qty;
	i_productName.value = productName;
	i_productPrice.value = productPrice*dateDays;
	i_productSale.value = productSale*dateDays;
	i_orderAmount.value = productPrice*dateDays;
	i_fileName.value = fileName;
	i_productDelivery.value = productDelivery;
	i_rental_start.value = start;
	i_rental_end.value = end;

	formObj.appendChild(i_productNum);
	formObj.appendChild(i_productName);
	formObj.appendChild(i_productPrice);
	formObj.appendChild(i_productSale);
	formObj.appendChild(i_productQuantity);
	formObj.appendChild(i_orderAmount);
	formObj.appendChild(i_fileName);
	formObj.appendChild(i_productDelivery);
	formObj.appendChild(i_rental_start);
	formObj.appendChild(i_rental_end);

	document.body.appendChild(formObj);
	formObj.method = "post";
	formObj.action = "${contextPath}/order/orderEachGoods.do";
	formObj.submit();
}
function add_cart(productNum) {
	var qty = document.getElementById("number_qty").value;
	var option = document.getElementById("option").value;
	var option2 = document.getElementById("option2").value;
	if(option == "notSelect"){
		alert("옵션을 선택해주세요.");
		return false;
	}
	if(option2 == "notSelect"){
		alert("옵션을 선택해주세요.");
		return false;
	}
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/addGoodsInCart.do",
		data : {
			productNum : productNum,
			cart_goods_qty : qty,
			option : option,
			option2 : option2
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
.layout{
	padding-top:40px;
	width:100%;
}

.productdetail{
margin-top:50px; width:900px;
}
.productimage{
float:left; width:40%; margin-top:25px;
}
.product{
width:40%; font-size:14px; float:right;
}
.productinfo{
float:left;
}
.productinfo2{
float:left; margin-left:20px;
}
.productinfo3{
float:left;
 width: 450px;
}
.calendar{
float:left;
}
.productbutton{
float:left;
}
.rent{
float:left; 
}
.productinfo5{
float:left; margin-top:50px; width:100%;
    font-weight: bold;
    font-size: 14px;
}
.productintro{
float:left; width:100%;
    font-weight: bold;
    font-size: 15px;
    margin-top:30px;
}
.productintro2{
float:left; width:100%;
    font-weight: bold;
    font-size: 15px;
    margin-top:30px;
}
.productintro3{
float:left; width: 15%;
border-right: 1px solid #ccc;
    background-color: #fafafa;
    color: #555;
    font-weight: bold;
    font-size: 12px;
    text-indent:15px;
}
.productintro4{
float:left; width:80%;
border-right: 1px solid #ccc;
    background-color: #fafafa;
    color: #555;
    font-weight: bold;
    font-size: 12px;
    text-indent:15px;
}
.etc2{
float:left; margin-top:30px; line-height:70px; width:100%; font-size:14px; font-weight: bold;
}
.review2{
float:left; margin-top:30px; width:100%; font-size:14px; font-weight: bold;
}
.reviewtitle{
width:100%; float:left; font-size: 14px; font-weight: bold; text-align:center; border-bottom: solid 1px black;
margin-top:5px;
}
.NO{
width:7%; float:left;
}
.Evaluation{
width:15%; float:left;
}
.reviewtitle2{
width:48%; float:left;
}
.writer{
width:15%; float:left;
}
.date{
width:15%; float:left;
}
.write{
float:right; margin-top:20px; font-size: 14px; width:100%; text-align:right;
}
.writeinfo{
float:left; margin-top:10px; width:15%; font-size:14px; font-weight: bold;
}
.writeinfo2{
float:left; margin-top:10px; width:85%; font-size:14px; font-weight: bold;
}
.writeinfo3{
float:left; margin-top:30px; font-size:14px; font-weight: bold;
text-align:left;
}
.p_title{
border-bottom: solid 1px black;
}
.image{
float:left; width:100%; 
}
.article{
float:left; margin-top:5px; font-size:14px; font-weight: bold; width:15%; height:300px;
text-align:center; border-right: solid 1px black;
}
.article2{
float:left; margin-top:5px; font-size:14px; font-weight: bold; width:80%; height:300px;
margin-left:10px;
}
.article3{
float:left; border: 1px solid black;
text-align:left;
}
.articlebutton{
width: 100%; text-align: center;display:inline-block;
}
.qnaanswer{
float:left; width:48%; text-align:left; margin-left:20px;
}
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform .reviewStar {
    display: none;
}
#myform label{
    font-size: 1em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform .reviewStar:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
h1 {
  font-size: 35px;
  text-align: center;
  padding: 4% 0px;
  letter-spacing: 1px;
}


/*div변경과 관련된 코드입니다.
색 등의 디자인은 보이기 위해서 표시해놨으니
스타일 추가 및 변경이 가능합니다.*/
.main .reviewStar {
	display: none;
}
#tab-1:checked ~ .tab label:nth-child(1),
#tab-2:checked ~ .tab label:nth-child(2),
#tab-3:checked ~ .tab label:nth-child(3),
#tab-4:checked ~ .tab label:nth-child(4) {
	background-color: rgba(0, 0, 0, 0.2);
  box-shadow: none;
}
.content > div {
	display: none;
}
#tab-1:checked ~ .content div:nth-child(1),
#tab-2:checked ~ .content div:nth-child(2),
#tab-3:checked ~ .content div:nth-child(3),
#tab-4:checked ~ .content div:nth-child(4)  {
	display: block;
}
.main {
  margin: 0 auto;
  main-width:1380px;
  max-width: 100%;
}
.tab {
  overflow: hidden;
}
.tab label {
    font-size: 18px;
    cursor: pointer;
    float: left;
    width: 25%;
    text-align: center;
    padding: 15px 0;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
.content {
  background-color: rgba(0, 0, 0, 0.2);
  min-height: 250px;
}
.content > div{
   padding: 30px;
   line-height: 1.5;
   font-size: 17px;
}
.ctb{
	background-color: black;
	color: white;
}
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: none;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}

.tab-link{
width:24.5%; text-align:center;
}

.writeinfo3 td {
	padding : 0 55px 8px;
}

.writeinfo3 #detail_title2 {
	width : 690px;
}

.writeinfo3 #detail_title2 .detail_name {
	width : 100%;
}

.writeinfo3 #detail_title2 .detail_text {
	width : 100%;
}
.productdetail textarea{
    width: 100%;
    height:300px;
    resize: none;
}
.productintro img{
	max-width: 100%;
}
</style>
</head>
<body>
<div class="layout">
<div class="productdetail">
	<div class="productimage">
		<img src="${contextPath}/thumbnails.do?productNum=${goods.productNum}&fileName=${goods.fileName}" width="300" height="250"/><br>
		<img src="${contextPath}/thumbnails.do?productNum=${goods.productNum}&fileName=${goods.fileName}" width="55" height="50"/>
		<img src="${contextPath}/thumbnails.do?productNum=${goods.productNum}&fileName=${goods.fileName}" width="55" height="50"/>
		<img src="${contextPath}/thumbnails.do?productNum=${goods.productNum}&fileName=${goods.fileName}" width="55" height="50"/>
		<img src="${contextPath}/thumbnails.do?productNum=${goods.productNum}&fileName=${goods.fileName}" width="55" height="50"/>
		<img src="${contextPath}/thumbnails.do?productNum=${goods.productNum}&fileName=${goods.fileName}" width="55" height="50"/>
	</div>
	<div class="product">
	<div class="productinfo">
		<p>상품명</p><br>
		<p>렌탈비용</p>
		<p>할인된 렌탈비용</p>
	</div>
	<div class="productinfo2">
		<p>여행용 캐리어</p><br>
		<p>${goods.originPrice}원</p>
		<p>${goods.productPrice}원/24h</p>
	</div>
	<div class="calendar">
		<p><input type="date" style="width:250px" style="height:100px" id="rental_start" min="" onchange="fn_rental()">대여일</p>
		<p><input type="date" style="width:250px" style="height:100px" id="rental_end" min="" disabled>반납일</p>
	</div>
	<div class="productinfo3">
	<div class="productinfo3">
		<p>수량		
		<select id="number_qty">
				<c:forEach var="i" begin="1" end="20" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
		</select>개
		</p>
	</div>
	</div>
	<div class="productbutton">
	<div class="rent">
		<a href="javascript:fn_order_each_goods('${goods.productNum }','${goods.productName }','${goods.originPrice}','${goods.productPrice}','${goods.fileName}',${goods.productDelivery });"><input type="button" value="대여하기" style="font-size:20px"/></a> 
	</div>
	</div>
	</div>
	<div class="productinfo5">
		<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">상품상세정보</li>
		<li class="tab-link" data-tab="tab-2">배송/교환/반품/환불</li>
		<li class="tab-link" data-tab="tab-3">상품 구매후기</li>
		<li class="tab-link" data-tab="tab-4">상품문의</li>
	</ul>
	</div>
	<div id="tab-1" class="tab-content current">
	<div class="productintro">
		<c:forEach var="image" items="${imageList }">
			<img src="${contextPath}/download.do?productNum=${goods.productNum}&fileName=${image.fileName}">
		</c:forEach>
	</div>
	<div class="productintro2">
		<p class="p_title">상품 필수정보</p>
	</div>
	<div class="productintro3">
		<p>품명</p>
		<p>제조국(수입자)</p>
		<p>제조자(원산지)</p>
		<p>제조년월</p>
		<p>품질보증기준</p>
	</div>
	<div class="productintro4">
		<p>여행용 캐리어</p>
		<p>내일갈래</p>
		<p>중국</p>
		<p>2022-04-08</p>
		<p>국가보증</p>
	</div>	
	</div>
	<div id="tab-2" class="tab-content">
	
	<div class="etc2">
		<p class="p_title">배송정보</p>
		<img src="${contextPath}/resources/image/delivery.JPG" />
		<p class="p_title">반품/교환/환불방법</p>
		<img src="${contextPath}/resources/image/howcancle.JPG" />
	</div>	
	</div>
	
<div id="tab-3" class="tab-content">
<div id="reviewarticle" >
	<div class="review2">
		<p class="p_title">상품평</p>
	</div>
	<div class="writeinfo">
		<p>honggil****</p>
		<p>*****</p>
		<p class="p_title">상품명</p>
	</div>
	<div class="writeinfo2">
		<p><br></p>
		<p>2022-04-08</p>
		<p class="p_title">여행용 캐리어</p>
	</div>
	<div class="image">
		<img src="${contextPath}/resources/image/item1.JPG" width="130" height="130"/>
		<img src="${contextPath}/resources/image/item1.JPG" width="130" height="130"/>
		<img src="${contextPath}/resources/image/item1.JPG" width="130" height="130"/>
		<img src="${contextPath}/resources/image/item1.JPG" width="130" height="130"/>
		<img src="${contextPath}/resources/image/item1.JPG" width="130" height="130"/>
		<img src="${contextPath}/resources/image/item1.JPG" width="130" height="130"/>
	</div>
	<div class="article">내용</div>
	<div class="article2">글 내용</div>
	<div class="write">
		<a href="#">수정</a> 
		<a>&nbsp;&nbsp;</a>
		<a href="#">삭제</a>
	</div></div>
	<div  id="write_review">
	<span class="write" onclick="review_fnc()">글쓰기</span>	
	</div>
	<div id="story" style="display: none">

	<div class="writeinfo3">
		<form class="mb-3" id="myform" action="#" method="post" name="myform" enctype="multipart/form-data">
						<table>
							<tr>
								<td id="detail_title">제목</td>
								<td id="detail_title2">
									<input class="detail_name" type="text" />
								</td>        
							</tr>
							
							<tr>
								<td id="detail_title">공개여부</td>
								<td id="detail_title2"><input type="radio" name="open" checked/>공개
									<input type="radio" name="open"/>비공개
								</td>
							</tr>
							
							<tr>
								<td id="detail_title">별점</td>
								<td id="detail_title2">
									<fieldset>
										<input class="reviewStar" type="radio" name="reviewStar" value="5" id="rate1">
										<label for="rate1">★</label>
										<input class="reviewStar" type="radio" name="reviewStar" value="4" id="rate2">
										<label for="rate2">★</label>
										<input class="reviewStar" type="radio" name="reviewStar" value="3" id="rate3">
										<label for="rate3">★</label>
										<input class="reviewStar" type="radio" name="reviewStar" value="2" id="rate4">
										<label for="rate4">★</label>
										<input class="reviewStar" type="radio" name="reviewStar" value="1" id="rate5">
										<label for="rate5">★</label>
									</fieldset>
								</td>
							</tr>
							
							<tr>
								<td id="detail_title">작성자</td>
								<td id="detail_title2">'readOnly'</td>
							</tr>
							
							<tr>
								<td id="detail_title">비밀번호</td>
								<td id="detail_title2">'readOnly'</td>
							</tr>
							
							<tr>
								<td id="detail_title">파일 첨부</td>
								<td id="detail_title2"><input type="button"  value="파일 추가" onClick="fn_addFile()"/>
								<span id="input_file"></span>
								</td>    
							</tr>							
						
							<tr>
								<td id="detail_title">내용</td>
					            <td id="detail_title2">
					            	<textarea class="detail_text" name="detail_text" ></textarea>   
					            </td>        
					        </tr>    
							
					        <tr align="center" valign="middle">
								<td colspan="5">
									<input type="submit" value="확인" >
									<input type="button" value="취소" onclick="review_cancle()" >           
					            </td>
					        </tr>
					    </table>
					</form>
	</div></div>
	
	</div>
	
<div id="tab-4" class="tab-content">
<div id="qnaarticle">
	<div class="reviewtitle">
		<div class="NO">번호</div>
		<div class="reviewtitle2">제목</div>
		<div class="Evaluation">작성자</div>
		<div class="writer">작성일</div>
		<div class="date">답변여부</div>
	</div>	
	<div class="reviewtitle" >
		<div class="NO">1</div>
		<div class="reviewtitle2"><a style="CURSOR: hand" 	onclick="if(reviewtitle.style.display=='none') {reviewtitle.style.display='';} else {reviewtitle.style.display='none';}">캐리어 크기 문의 드립니다.</a></div>
		<div class="Evaluation">honggil****</div>
		<div class="writer">2022-04-08</div>
		<div class="date">답변완료</div>
	</div>
	<div class="reviewtitle" id="reviewtitle" style="display: none">
		<div class="NO"><p></p></div>
		<div class="qnaanswer">
			<p>질문: </p>
			<p>캐리어 크기가 어떻게 되나요?</p><br>
			<p>답변: </p>
			<p>안녕하세요 고객님. 내일갈래입니다.안녕하세요 고객님. 내일갈래입니다.안녕하세요 고객님. 내일갈래입니다.안녕하세요 고객님. 내일갈래입니다.안녕하세요 고객님. 내일갈래입니다.안녕하세요 고객님. 내일갈래입니다.</p>
		</div>
		<div class="Evaluation"><p></p></div>
		<div class="writer"><p></p></div>
		<div class="date"><p></p></div>
	</div></div>
	<div id="write_box" class="write"><a style="CURSOR: hand" 	onclick="qna_fnc()">문의하기</a></div>
		<div id="writeqna" style="display: none">

	<div class="writeinfo3">
		<form id="qnaform" action="#" method="post" name="qnaform" enctype="multipart/form-data">
						<table>
							<tr>
								<td id="detail_title">제목</td>
								<td id="detail_title2">
									<input class="detail_name" type="text" />
								</td>        
							</tr>
							
							<tr>
								<td id="detail_title">공개여부</td>
								<td id="detail_title2"><input type="radio" name="open" checked/>공개
									<input type="radio" name="open"/>비공개
								</td>
							</tr>
							
							<tr>
								<td id="detail_title">작성자</td>
								<td id="detail_title2">'readOnly'</td>
							</tr>
							
							<tr>
								<td id="detail_title">비밀번호</td>
								<td id="detail_title2">'readOnly'</td>
							</tr>
							
							<tr>
								<td id="detail_title">파일 첨부</td>
								<td id="detail_title2"><input type="button"  value="파일 추가" onClick="fn_addFile2()"/>
									<span id="input_file2"></span>
								</td>    
							</tr>							
						
							<tr>
								<td id="detail_title">내용</td>
					            <td id="detail_title2">
					            	<textarea class="detail_text" name="detail_text" ></textarea>   
					            </td>        
					        </tr>    
							
					        <tr align="center" valign="middle">
								<td colspan="5">
									<input type="submit" value="문의하기" >
									<input type="button" value="취소" onclick="qna_cancle()" >           
					            </td>
					        </tr>
					    </table>
					</form>
	</div>
	</div>
</div>
</div>
<!-- body부분 삽입-->
</div>
<script>
var cnt=0;
function fn_addFile(){
	  if(cnt == 0){
		  $("#input_file").append("<br>"+"<input type='file' name='main_image' id='in_main_image' />");	  
	  }else{
		  $("#input_file").append("<br>"+"<input type='file' name='detail_image"+cnt+"' />");
	  }
	
	cnt++;
}

var cnt=0;
function fn_addFile2(){
	  if(cnt == 0){
		  $("#input_file2").append("<br>"+"<input type='file' name='main_image' id='in_main_image' />");	  
	  }else{
		  $("#input_file2").append("<br>"+"<input type='file' name='detail_image"+cnt+"' />");
	  }
	
	cnt++;
}

function review_fnc(){
	story.style.display=''; 
	reviewarticle.style.display='none';
	write_review.style.display='none';
}
function review_cancle() {
	story.style.display='none';
	reviewarticle.style.display='';
	write_review.style.display='';
}
function qna_fnc(){
	writeqna.style.display='';
	qnaarticle.style.display='none';
	write_box.style.display="none";
}
function qna_cancle() {
	writeqna.style.display='none';
	qnaarticle.style.display='';	
	write_box.style.display="";
}

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		review_cancle();
		qna_cancle();
	})

})
</script>


</body>
</html>