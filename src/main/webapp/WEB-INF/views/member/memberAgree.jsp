<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layout{
	padding-top:40px;
	width:100%;
}

#agree {
	height: auto;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	text-align: left;
	box-sizing: border-box;
}

#agree h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#agree .contents {
	width: 700px;
	padding: 50px;
	background-color: #ffffff;
	border: 1px solid #dadada;
	border-radius: 5px;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
}

.contents label {
	margin: 10px 0 0 0;
	font-weight: 700;
}

.terms_content {
	height: 88px;
	overflow: auto;
	margin-top: 8px;
	padding: 12px;
	border: 1px solid #dadada;
	background: #fff;
	font-size: 12px;
}

#agree .sub_button {
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 12px;
	transition: 0.3s;
	text-decoration-line: none;
}

#agree .sub_button:hover {
	background: white;
	color: #2b2e4a;
}

#agree .reset_button {
	padding: 5px 15px;
	background: #DCDCDC;
	border: 1px solid #DCDCDC;
	color: white;
	font-size: 12px;
	transition: 0.3s;
	text-decoration-line: none;	
}

#agree .reset_button:hover {
	border: none;
	border: 1px solid #2b2e4a;
	color: #2b2e4a;
	background: white;
}

#agree .agree_allButton {
	float: right;
}

#agree .agree_new {
	margin: 80px 0 0 0;
	text-align: center;
}

@media ( max-width : 768px) {
	.wrap {
		min-width: 280px;
		padding: 20px;
	}
	#form__wrap {
		max-width: 460px;
		width: auto;
	}
}


</style>
</head>
<body>
<div class="layout">

<div id="agree">
		<h3>회원가입 약관동의</h3>
		<br> <br>
		<div class="contents">
			<form action="${contextPath}/member/memberForm.do" method="get" id="form1">
	<p>
		<label>
			<input type="checkbox" name="all" id="all">
			내일갈래? 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.
		</label>
	</p>

	<p>
		<label>
			<input type="checkbox" name="c1" id="c1"> 
			내일갈래? 이용약관 동의(필수)
		</label>
	</p>
		<div class="terms_content">
			여러분을 환영합니다. 내일갈래? 서비스 및 제품(이하
			‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 내일갈래? 서비스의 이용과 관련하여 내일갈래? 서비스를
			제공하는 내일갈래? 주식회사(이하 ‘내일갈래?’)와 이를 이용하는 내일갈래? 서비스 회원(이하 ‘회원’) 또는
			비회원과의 관계를 설명하며, 아울러 여러분의 내일갈래? 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고
			있습니다. 내일갈래? 서비스를 이용하시거나 내일갈래? 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영
			정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.
		</div>

	<p>
		<label>
			<input type="checkbox" name="c2" id="c2"> 
			개인정보 수집 및 이용에 대한 안내(필수)
		</label>
	</p>
		<div class="terms_content">
			개인정보보호법에 따라 내일갈래? 에 회원가입 신청하시는 분께
			수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시
			불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는 개인정보 이용자는
			회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.
			이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우,
			네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
		</div>
	<p>
		<label>
			<input type="checkbox" name="c3" id="c3"> 
			프로모션 정보 수신 동의(선택)
		</label>
	</p>
		<div class="terms_content">
			내일갈래? 에서 제공하는 이벤트/혜택 등 다양한 정보를
			휴대전화(내일갈래? 앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나
			내일갈래? 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수
			있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
		</div>
		<p></p>


		<div class="agree_allButton">
			<input class="sub_button" type="submit" value="동의하기">
			<input class="reset_button" type="reset" value="취소하기">
		</div>

</form>
		<div class="agree_new">판매자/사업자 회원이라면? <a href="${contextPath}/member/sellerAgree.do">판매자/사업자 회원가입</a></div>
</div>
</div>
</div>

<script>
	var doc = document; 
	var form1 = doc.getElementById('form1'); 
	var inputs = form1.getElementsByTagName('INPUT'); 
	var form1_data = {
		"c1": false, 
		"c2": false, 
		"c3": false
	}; 

	var c1 = doc.getElementById('c1'); 
	var c2 = doc.getElementById('c2'); 
	var c3 = doc.getElementById('c3'); 

	function checkboxListener() {
		form1_data[this.name] = this.checked; 

		if(this.checked) {
			// submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분. 
			this.parentNode.style.color = "#000"; 
		}
	}


		c1.onclick = c2.onclick = c3.onclick = checkboxListener; 

		var all = doc.getElementById('all'); 

		all.onclick = function() {
			if (this.checked) {
				setCheckbox(form1_data, true); 
			} else {
				setCheckbox(form1_data, false); 
			}
		}; 


		function setCheckbox(obj, state) {
			for (var x in obj) {
				obj[x] = state; 

				for(var i = 0; i < inputs.length; i++) {
					if(inputs[i].type == "checkbox") {
						inputs[i].checked = state; 
					}
				}

			}
		}


	/*all.onclick = function() {
		if (this.checked) {
			for (var x in form1_data) {
				form1_data[x] = true; 
				for(var i = 0; i < inputs.length; i++) {
					if(inputs[i].type == "checkbox") {
						inputs[i].checked = true; 
					}
				}
			}
		} else {
			for (var x in form1_data) {
				form1_data[x] = false; 
				for(var i = 0; i < inputs.length; i++) {
					if(inputs[i].type == "checkbox") {
						inputs[i].checked = false; 
					}
				}
			}
		}
	}; */


	form1.onsubmit = function(e) {
		e.preventDefault(); // 서브밋 될때 화면이 깜빡이지 않게 방지

		if ( !form1_data['c1'] ) {
			alert('내일갈래? 이용약관 동의를 하지 않았습니다'); 
			c1.parentNode.style.color = 'red'; 
			return false; 
		}

		if ( !form1_data['c2'] ) {
			alert('개인정보 수집 및 이용에 대한 안내를 선택하지 않았습니다.');
			c2.parentNode.style.color = 'red';
			return false; 
		}

		this.submit(); 
	}; 
</script>

</body>
</html>