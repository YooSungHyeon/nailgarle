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
			<form action="${contextPath}/member/sellerForm.do" method="get" id="form1">
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
			판매자에 대한 이용약관 내용
		</div>

	<p>
		<label>
			<input type="checkbox" name="c2" id="c2"> 
			개인정보 수집 및 이용에 대한 안내(필수)
		</label>
	</p>
		<div class="terms_content">
			판매자 개인정보 수집 및 이용에 대한 안내 내용
		</div>
	<p>
		<label>
			<input type="checkbox" name="c3" id="c3"> 
			프로모션 정보 수신 동의(선택)
		</label>
	</p>
		<div class="terms_content">
			판매자 프로모션 정보 수신 동의 내용
		</div>
		<p></p>


		<div class="agree_allButton">
			<input class="sub_button" type="submit" value="동의하기">
			<input class="reset_button" type="reset" value="취소하기">
		</div>

</form>
		<div class="agree_new">개인/일반 회원이라면? <a href="${contextPath}/member/memberAgree.do">개인/일반 회원가입</a></div>
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