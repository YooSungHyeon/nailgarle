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

var cnt=0;
var max_cnt=5;
function fn_addFile(){
	  if(cnt < 5){
		  $("#d_file").append("<br>"+"<input  type='file' name='review_image"+cnt+"' id='review_image' />");
		  cnt++;
	  }else if(cnt >= max_cnt){
		  alert("이미지는 최대 5장 까지 첨부 가능합니다.");
	  }
	
	
}

function fn_add_new_goods(obj){
	 fileName = $('#review_image').val();
	 if(!fileName){
		 alert("사진을 첨부해주세요.");
		 return false;
	 }
	 
}


var loopSearch = true;
function keywordSearch() {
	var value = document.getElementById("productName").value;
	$.ajax({
		type : "get",
		async : true, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/board/keywordSearch.do",
		data : {
			productName : value
		},
		success : function(data, textStatus) {
			var jsonInfo = JSON.parse(data);
			displayResult(jsonInfo);
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다." + data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");

		}
	}); //end ajax	
}

function displayResult(jsonInfo) {
	var count = jsonInfo.productName.length;
	if (count > 0) {
		var html = '';
		for ( var i in jsonInfo.productName) {
			html += "<a href=\"javascript:select('" + jsonInfo.productName[i]
					+ "')\">" + jsonInfo.productName[i] + "</a><br/>";
		}
		var listView = document.getElementById("suggestList");
		listView.innerHTML = html;
		show('suggest');
	} else {
		hide('suggest');
	}
}

function select(selectedproductName) {
	document.getElementById("productName").value = selectedproductName;
	loopSearch = false;
	hide('suggest');
}

function show(elementId) {
	var element = document.getElementById(elementId);
	if (element) {
		element.style.display = 'block';
	}
}

function hide(elementId) {
	var element = document.getElementById(elementId);
	if (element) {
		element.style.display = 'none';
	}
}

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

.service_container .sidebar .inboardReview {
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

.reviewwriteinfo table {
	width: 950px;
}

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform input[type=radio]{
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
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.reviewwriteinfo{
float:left; margin-top:30px; font-size:14px; font-weight: bold;
text-align:left; width:80%;
}
.reviewwriteinfo td {
	padding : 0 25px 8px;
}
.reviewwriteinfo #detail_title {
	width : 140px;
}

.reviewwriteinfo #detail_title2 {
	width : 690px;
}

.reviewwriteinfo #detail_title2 .detail_name {
	width : 55%;
}

.reviewwriteinfo #detail_title2 .detail_text {
	width : 75%;
}
.reviewwriteinfo textarea{
    width: 100%;
    height:300px;
    resize: none;
  
}
.layout a{
text-decoration:none;
color:black;
}

#suggest{
display:none; position: absolute; left: 530px; top:320px; border: 0.1px  solid #87cb42; z-index:3;font-weight: bold;background-color:#ffffff; 	
	
}
<!-- CSS부분 삽입-->

</style>
</head>
<body>
<div class="layout">
	<div class="service_container">
		<h1>리뷰 게시판</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/board/planboard.do"><img class="board_img" src="${contextPath}/resources/image/board_plan.svg"/>일정 게시판</a></li>
						<li><a class="inboardReview" href="${contextPath}/board/reviewboard.do"><img class="board_img" src="${contextPath}/resources/image/board_review.svg"/>리뷰 게시판</a></li>
					</ul>
				</nav>
			</div>
	<div class="reviewwriteinfo">
		<form class="mb-3" id="myform" action="${contextPath}/board/addReview.do" method="post" onsubmit="return fn_add_new_goods()" name="myform" enctype="multipart/form-data">
						<table>
						
							<tr>
								<td id="detail_title">제목</td>
								<td id="detail_title2">
									<input class="detail_name" name="re_Title" type="text" required/>
								</td>        
							</tr>
							
							<tr>
								<td id="detail_title">별점</td>
								<td id="detail_title2">
									<fieldset>
										<input class="reviewStar" type="radio" name="re_Star" value="5" id="rate1">
										<label for="rate1">★</label>
										<input class="reviewStar" type="radio" name="re_Star" value="4" id="rate2">
										<label for="rate2">★</label>
										<input class="reviewStar" type="radio" name="re_Star" value="3" id="rate3">
										<label for="rate3">★</label>
										<input class="reviewStar" type="radio" name="re_Star" value="2" id="rate4">
										<label for="rate4">★</label>
										<input class="reviewStar" type="radio" name="re_Star" value="1" id="rate5" checked>
										<label for="rate5">★</label>
									</fieldset>
								</td>
							</tr>
							
							<tr>
								<td id="detail_title">상품명</td>
								<td id="detail_title2">
								<input type="text" id="productName" name="productName" onkeyUp="keywordSearch()" placeholder="상품명 입력" required></td>
							</tr>
							
							<tr>
								<td id="detail_title">파일 첨부</td>
								<td id="detail_title2"><input type="button" name="re_fileName"  value="파일 추가" onClick="fn_addFile()" />
								<span id="d_file"></span>
								</td>
							</tr>							
						
							<tr>
								<td id="detail_title">내용</td>
					            <td id="detail_title2">
					            	<textarea class="detail_text" name="re_Text" ></textarea>   
					            </td>        
					        </tr>    
							
					        <tr align="center" valign="middle">
								<td colspan="5">
									<input type="hidden" value="리뷰게시판" name="boardType" />
									<input type="submit" value="확인" >
									<a href="${contextPath}/board/reviewboard.do"><input type="button" value="취소" ></a>           
					            </td>
					        </tr>
					    </table>
					</form>
	</div>
	<div id="suggest">
		<div id="suggestList"></div>
	</div>
</div>
</div>
</body>
</html>