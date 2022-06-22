<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("ex_postcode").value = data.zonecode;
            document.getElementById("ex_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ex_detailAddress").focus();
        }
    }).open();
}

$(document).ready(function(){

	  $("#selectEmail option").each(function(){

	    if($(this).val()=="${sellerInfo.sellerEmail2}"){

	      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 

	    }
	    
	  });

	});
	

$('#selectEmail').change(function() {
	$("#selectEmail option:selected").each(function () {
		
		if($(this).val()== '1') {  
			$("#sellerEmail2").val(''); 
			$("#sellerEmail2").attr("disabled",false); 
			} else {
				$("#sellerEmail2").val($(this).text());
				$("#sellerEmail2").attr("disabled",true);
				}
		});
	});
	
	
</script>

<style>

.layout {
	padding-top: 40px;
	width: 100%;
}

.seller_container {
	width: 1250px;
}

.seller_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.seller_container .sidebar {
	width: 250px;
	float: left;
}

.seller_container .sidebar .seller_img {
	padding-right: 20px;
}

.seller_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.seller_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.seller_container .sidebar .insellerUpdate {
	font-weight: 800;
}

.seller_container nav {
	margin-top: 32px;
}

.seller_container ul {
	padding-left: 0;
}

.seller_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.seller_container #seller_form {
	width: 700px;
	margin: 0 auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	text-align: left;
}

.seller_container #seller_form .row_group {
	display: block;
	border: 1px solid #dedede;
	border-top: 2px solid #F4A460;
	margin: 0 auto 30px;
	box-shadow: 3px 3px 3px #dedede;
}

.seller_container #seller_form .row_group .group_title {
	height: 43px;
	background: #f7f7f7;
	color: #3b3b3b;
	font-size: 13px;
	font-weight: normal;
	text-align: center;
	line-height: 43px;
}

.seller_container #seller_form h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

.seller_container #seller_form ul li {
	list-style: none;
	padding: 0px;
	font-size: 14px;
}

.seller_container #seller_form #sell_form p {
	float: right;
	margin-left: 5px;
	margin-bottom: 0px;
	color: red;
	font-weight: bold;
}

.sellers input {
	width: 289px;
	height: 35px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
}

.sellers li {
	display: inline-block;
	margin-top: 5px;
}

.sellers li.seller1 {
	width: 120px;
	margin-left: 40px;
	text-align: right;
	margin-right: 20px;
}

.sellers li.seller2 {
	width: auto;
}

.sellers li.seller2 .hp {
	width: 93px;
	height: 35px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
}
.sellers li.seller2 .hp1 {
	width: 93px;
	height: 35px;
	outline: none;
	border: 1px solid #707070;
	text-align: center;
}

.sellers li.seller2 .email_text {
	width: 132.5px;
	height: 35px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
}

.sellers li.seller2 .email_text1 {
	width: 100px;
	height: 35px;
	outline: none;
	border: 1px solid #707070;
	text-align: center;
}

.sellers li.seller2 .addr_text {
	width: 100px;
}

#seller_form .sellers .seller2 #pwcheck {
	margin-left: 5px;
}

#sell_form .sellers .seller2 .id_check {
	width: 100px;
	height: 35px;
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 14px;
	transition: 0.3s;
}

#sell_form .sellers .seller2 .id_check:hover {
	background: white;
	color: #2b2e4a;
}

#sell_form .sellers .seller2 .addr_check {
	width: 100px;
	height: 35px;
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 14px;
	transition: 0.3s;
}

#sell_form .sellers .seller2 .addr_check:hover {
	background: white;
	color: #2b2e4a;
}

#seller_form .join_btn {
	padding: 30px 0 60px;
	text-align: center;
}

#seller_form .box_btn {
	display: inline-block;
    *display: inline;
    *zoom: 1;
    overflow: hidden;
    text-align: center;
    vertical-align: top;
}

#seller_form .box_btn * {
	appearance: none;
    display: inline-block;
    min-width: 110px;
    height: 40px;
    box-sizing: border-box;
    font-family: dotum, 돋움, sans-serif;
    font-size: 12px;
    text-align: center;
    line-height: 40px;
    cursor: pointer;
    color: #fff !important;
    margin: 0px;
    padding: 0px 10px;
	border: 1px solid #2b2e4a;
    border-image: initial;
    outline: 0px;
    background: #2b2e4a;
    transition: 0.3s;
}

#seller_form .box_btn.white * {
	border: 1px solid #333;
    background: #fff;
    color: #333 !important;
    text-decoration: none;
}

#seller_form .box_btn:hover {
	min-width: 110px;
	height: 40px;
	background: #fff;
	color: #2b2e4a !important;
}

#seller_form .box_btn.white *:hover {
	min-width: 110px;
	height: 40px;
	background: #2b2e4a;
	color: #fff !important;
}


</style>
</head>
<body>
<div class="layout">
		<!-- body부분 삽입-->
		<div class="seller_container">
			<h1>사업자 정보수정</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/seller/goods/sellerGoodsMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_product.svg" />물품 관리</a></li>
						<li><a href="${contextPath}/seller/order/sellerOrderMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_order.svg" />주문/배송 관리</a></li>
						<li><a href="${contextPath}/seller/rental/sellerRentalMain.do"><img class="seller_img" src="${contextPath}/resources/image/seller_rental.svg" />렌탈 관리</a></li>
						<li><a class="insellerUpdate" href="${contextPath}/seller/sellerPwCheck.do?seller=update"><img class="seller_img" src="${contextPath}/resources/image/seller_info.svg" />사업자 정보수정</a></li>
						<li><a href="${contextPath}/seller/sellerPwCheck.do?seller=delete"><img class="seller_img" src="${contextPath}/resources/image/seller_unsubscribe.svg" />사업자 탈퇴</a></li>
					</ul>
				</nav>
			</div>
		<div id="seller_form">
			<form action="${contextPath}/seller/modifySellerInfo.do" method="post">
				<div class="row_group">
				<h4 class="group_title">
					<b>사업자 정보 수정 </b><font style="color:red;"> * </font><span> 는 필수 변경사항입니다.</span>
				</h4>
				<ul id="sell_form" style="padding-left: 0px;">
		
					<li>
						<ul class="sellers">
							<li class="seller1">아이디</li>
							<li class="seller2"><input style="background-color: #e2e2e2;" type="text" name="sellerId" id="sellerId" value="${sellerInfo.sellerId }" disabled/></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">비밀번호<p>*</p></li>
							<li class="seller2"><input id="pw1" type="password" name="sellerPw" required></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="pwcheck">새로운 비밀번호를 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">비밀번호 확인<p>*</p></li>
							<li class="seller2"><input id="pw2" onchange="check_pw()" type="password" required><span id="pwcheck"></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="pwcheck2">비밀번호를 다시 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">기업이름</li>
							<li class="seller2"><input type="text" name="sellerName" value="${sellerInfo.sellerName }" required></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">전화번호</li>
							<li class="seller2">
								<select class="hp1" name="sellerHp1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select>
								<input class="hp" type="text" id="hp2" name="sellerHp2" value="${sellerInfo.sellerHp2 }" onchange="check_hp2()">
								<input class="hp" type="text" id="hp3" name="sellerHp3" value="${sellerInfo.sellerHp3 }" onchange="check_hp3()">
							</li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="hpcheck">전화번호는 숫자만 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">사업자번호</li>
							<li class="seller2"><input type="text" name="businessNum" value="${sellerInfo.businessNum }" required></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="businessNum_check">사업자 번호는 숫자만 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">이메일</li>
							<li class="seller2">
								<input class="email_text" type="text" name="sellerEmail1" id="sellerEmail1" value="${sellerInfo.sellerEmail1 }"> @
								<input class="email_text" type="text" name="sellerEmail2" id="sellerEmail2" value="${sellerInfo.sellerEmail2 }" disabled >
									<select class="email_text1" name="sellerEmail2" id="selectEmail">
										<option value="1">직접입력</option>
										<option value="naver.com" selected>naver.com</option> 
										<option value="hanmail.net">hanmail.net</option> 
										<option value="hotmail.com">hotmail.com</option> 
										<option value="nate.com">nate.com</option> 
										<option value="yahoo.co.kr">yahoo.co.kr</option> 
										<option value="empas.com">empas.com</option> 
										<option value="dreamwiz.com">dreamwiz.com</option> 
										<option value="freechal.com">freechal.com</option> 
										<option value="lycos.co.kr">lycos.co.kr</option> 
										<option value="korea.com">korea.com</option> 
										<option value="gmail.com">gmail.com</option> 
										<option value="hanmir.com">hanmir.com</option> 
										<option value="paran.com">paran.com</option> 
									</select>
							</li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="emailcheck">아이디/비밀번호 찾기시 사용할 이메일 입니다.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">우편번호</li>
							<li class="seller2"><input class="addr_text" type="text" id="ex_postcode" name="sellerZipcode" value="${sellerInfo.sellerZipcode }"></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">주소</li>
							<li class="seller2"><input type="text" id="ex_address" name="sellerAddr1" value="${sellerInfo.sellerAddr1 }"></li>
							<li class="seller2" style="margin-left: 0px;"><button type="button" class="addr_check" onclick="execDaumPostcode()">우편번호</button></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">상세주소</li>
							<li class="seller2"><input type="text" id="ex_detailAddress" name="sellerAddr2" value="${sellerInfo.sellerAddr2 }"></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
				</ul>
					</div>
					
					<div class="join_btn">
						<span class="box_btn">
							<input type="submit" class="box_btn" value="수정">
						</span>
						<span class="box_btn white">
							<input type="button" value="취소" onClick="location.href='${contextPath}/seller/goods/sellerGoodsMain.do'">
						</span>
					</div>
				</form>
		</div>
	</div>
</div>
</body>
</html>