<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

// 아이디 찾기
// 인증 버튼 숨김
$(document).ready(function() {
	$("#id_emailChk2").hide();
})

// 이메일 인증
var code = "";

function fn_id_email_send() {
	
var emC = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var memberName = $("#id_memberName").val();
	var memberEmail = $("#id_memberEmail").val();
	
	if (memberName == '') {
		alert("이름을 입력해주세요!");
		$("#id_memberName").focus(); 
		return;
	} else if (memberEmail == '') {
		alert("이메일을 입력해주세요!");
		$("#id_memberEmail").focus(); 
		return;
	} else if (emC.test(memberEmail) == false) {
		alert("이메일 양식을 확인해주세요!");
		$("#id_memberEmail").focus(); 
		return;
	}
	
	$.ajax({
		type : "post",
		async: false,
		url : "${contextPath}/member/idFind.do",
		datatype : "text",
		data : {
			memberName : memberName,
			memberEmail : memberEmail
		},
		success : function(data, textStatus) {
			if (data == 'true') {
				alert("일치하는 회원이 있습니다. \n잠시후 이메일을 발송합니다. ");
				$.ajax({
					type : "GET",
					url : "${contextPath}/member/mailCheck?memberEmail="
							+ memberEmail,
					cache : false,
					success : function(data) {
						if (data == "error") {
							alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
							$("#id_memberEmail").attr("autofocus", true);
							$(".id_successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
							$(".id_successEmailChk").css("color", "red");
						} else {
							alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
							$("#id_emailChk").attr("disabled", true);
							$("#id_emailChk").css("background-color", "#DCDCDC");
							$("#id_emailChk").css("pointer-events", "none");
							$("#id_emailChk2").css("display", "inline-block");
							// $("#id_memberEmail").attr("disabled", true);
							$("#id_memberEmail2").attr("disabled", false);
							$(".id_successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
							$(".id_successEmailChk").css("color", "green");
							code = data;
						}
					}			
				})
			} else {
				alert("일치하는 회원이 없습니다.");
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다.");
		},
		complete : function(data, textStatus) {
		}
	});
}

function fn_id_email_check() { 

	if($("#id_memberEmail2").val() == code) { 
		$(".id_successEmailChk").text("인증번호가 일치합니다."); 
		$(".id_successEmailChk").css("color","blue"); 
		$("#id_emailCheckNum").val("true"); 
		$("#id_memberEmail2").attr("disabled",true); 
		// $("#id_memberEmail").attr("disabled",true); 
		$("#id_emailChk2").attr("disabled", true);
		$("#id_emailChk2").css("background-color", "#DCDCDC");
		$("#id_emailChk2").css("pointer-events", "none");
	} else { 
		$(".id_successEmailChk").text("인증번호가 일치하지 않습니다."); 
		$(".id_successEmailChk").css("color","red"); 
		$("#id_emailCheckNum").val("false"); 
		$("#id_memberEmail2").focus(); 
	} 
}

function id_submit_check() {
	
	if($("#id_memberEmail2").val() == "") { 
		alert("이메일 인증 후 이용해주세요.");
		$("#id_memberEmail2").focus();
		return false;
	} else if($("#id_memberEmail2").val() != code) {
		alert("인증번호 확인 후 이용해주세요.");
		$("#id_memberEmail2").focus();
		return false;
	}
}

// 비밀번호 찾기
// 인증 버튼 숨김
$(document).ready(function() {
	$("#pw_emailChk2").hide();
})

// 이메일 인증
var code = "";

function fn_pw_email_send() {
	
	var emC = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var memberId = $("#pw_memberId").val();
	var memberName = $("#pw_memberName").val();
	var memberEmail = $("#pw_memberEmail").val();
	
	if (memberId == '') {
		alert("아이디를 입력해주세요!");
		$("#pw_memberId").focus(); 
		return;
	} else if (memberName == '') {
		alert("이름을 입력해주세요!");
		$("#pw_memberName").focus(); 
		return;
	} else if (memberEmail == '') {
		alert("이메일을 입력해주세요!");
		$("#pw_memberEmail").focus(); 
		return;
	} else if (emC.test(memberEmail) == false) {
		alert("이메일 양식을 확인해주세요!");
		$("#pw_memberEmail").focus(); 
		return;
	}
	
	$.ajax({
		type : "post",
		async: false,
		url : "${contextPath}/member/pwFind.do",
		datatype : "text",
		data : {
			memberId : memberId,
			memberName : memberName,
			memberEmail : memberEmail
		},
		success : function(data, textStatus) {
			if (data == 'true') {
				alert("일치하는 회원이 있습니다. \n잠시후 이메일을 발송합니다. ");
				$.ajax({
					type : "GET",
					url : "${contextPath}/member/mailCheck?memberEmail="
							+ memberEmail,
					cache : false,
					success : function(data) {
						if (data == "error") {
							alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
							$("#pw_memberEmail").attr("autofocus", true);
							$(".pw_successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
							$(".pw_successEmailChk").css("color", "red");
						} else {
							alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
							$("#pw_emailChk").attr("disabled", true);
							$("#pw_emailChk").css("background-color", "#DCDCDC");
							$("#pw_emailChk").css("pointer-events", "none");
							$("#pw_emailChk2").css("display", "inline-block");
							$("#pw_memberEmail").attr("disabled", true);
							$("#pw_memberEmail2").attr("disabled", false);
							$(".pw_successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
							$(".pw_successEmailChk").css("color", "green");
							code = data;
						}
					}			
				})
			} else {
				alert("일치하는 회원이 없습니다.");
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다.");
		},
		complete : function(data, textStatus) {
		}
	});
}

function fn_pw_email_check() { 

	if($("#pw_memberEmail2").val() == code) { 
		$(".pw_successEmailChk").text("인증번호가 일치합니다."); 
		$(".pw_successEmailChk").css("color","blue"); 
		$("#pw_emailCheckNum").val("true"); 
		$("#pw_memberEmail2").attr("disabled",true); 
		$("#pw_memberEmail").attr("disabled",true); 
		$("#pw_emailChk2").attr("disabled", true);
		$("#pw_emailChk2").css("background-color", "#DCDCDC");
		$("#pw_emailChk2").css("pointer-events", "none");
	} else { 
		$(".pw_successEmailChk").text("인증번호가 일치하지 않습니다."); 
		$(".pw_successEmailChk").css("color","red"); 
		$("#pw_emailCheckNum").val("false"); 
		$("#pw_memberEmail2").focus(); 
	} 
}

function pw_submit_check() {
	
	if($("#pw_memberEmail2").val() == "") { 
		alert("이메일 인증 후 이용해주세요.");
		$("#pw_memberEmail2").focus();
		return false;
	} else if($("#pw_memberEmail2").val() != code) {
		alert("인증번호 확인 후 이용해주세요.");
		$("#pw_memberEmail2").focus();
		return false;
	}
}

</script>

<style>
.layout {
	padding-top: 40px;
	width: 100%;
}

.left-box {
	float: left;
	width: 45%;
	height: auto;
}

.right-box {
	float: right;
	width: 45%;
	height: auto;
}

.box {
	float: left;
	text-align: left;
	font-size: 18px;
}

.find {
	text-align: center;
}

#find_all {
	width: 1000px;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 25px;
	text-align: center;
}

#find_all h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

.find_body input {
	width: 203px;
	height: 42px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
	transition: 0.3s;
	margin: 2px 7px;
	font-size: 12px;
}

.submit_btn {
	background-color: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	padding: auto;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	height: 35px;
	width: 280px;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 3px;
	transition: 0.3s;
	float: center;
}

.submit_btn:hover {
	background: white;
	color: #2b2e4a;
}

.find_body .email_check {
	height: 40px;
	width: 110px;
	margin-left: 1px;
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 11px;
	transition: 0.3s;
}

.find_body .email_check:hover {
	background: white;
	color: #2b2e4a;
}

</style>
</head>
<body>
	<div class="layout">
		<div id="find_all">
			<h3>아이디/비밀번호찾기</h3>
			<br> <br>
			<div class='left-box'>
				<div class='find'>아이디 찾기</div>
				<br>
				<div class='box'>
					<form action="${contextPath}/member/findId.do" method="get" onsubmit="return id_submit_check();">
						<table>
							<tbody class="find_body">
								<tr>
									<td>이름</td>
									<td><input type="text" id="id_memberName" name="memberName" placeholder="이름" required></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" id="id_memberEmail" name="memberEmail"  placeholder="example@example.com" required></td>
									<td><input type="button" id="id_emailChk" class="email_check" value="인증번호 전송" onclick="fn_id_email_send()"></td>
								</tr>
								<tr>
									<td>인증번호</td>
									<td><input type="text" id="id_memberEmail2" name="memberEmail2" placeholder="인증번호 입력" disabled required></td>
									<td id="id_emailChk3"><input type="button" id="id_emailChk2" class="email_check" value="인증번호 확인" onclick="fn_id_email_check()"></td>
									<td><input type="hidden" id="id_emailCheckNum"></td>
								</tr>
								<tr>
								<td></td>
								<td colspan="2"><span style="font-size:8pt; color:red; margin:5px;" class="point id_successEmailChk">가입시 입력한 이메일 입력후 인증번호 전송을 해주십시오.</span></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="submit_btn" value="아이디 찾기">
					</form>
				</div>
			</div>
			<div class='right-box'>
				<div class='find'>비밀번호 찾기</div>
				<br>
				<div class='box'>
					<form action="${contextPath}/member/findPw.do" method="post" onsubmit="return pw_submit_check();">
						<table>
							<tbody class="find_body">
								<tr>
									<td>아이디</td>
									<td><input type="text" id="pw_memberId" name="memberId" placeholder="아이디" required></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" id="pw_memberName" name="memberName" placeholder="이름" required></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" id="pw_memberEmail" name="memberEmail"  placeholder="example@example.com" required></td>
									<td><input type="button" id="pw_emailChk" class="email_check" value="인증번호 전송" onclick="fn_pw_email_send()"></td>
								</tr>
								<tr>
									<td>인증번호</td>
									<td><input type="text" id="pw_memberEmail2" name="memberEmail2" placeholder="인증번호 입력" disabled required></td>
									<td id="pw_emailChk3"><input type="button" id="pw_emailChk2" class="email_check" value="인증번호 확인" onclick="fn_pw_email_check()"></td>
									<td><input type="hidden" id="pw_emailCheckNum"></td>
								</tr>
								<tr>
								<td></td>
								<td colspan="2"><span style="font-size:8pt; color:red; margin:5px;" class="point pw_successEmailChk">가입시 입력한 이메일 입력후 인증번호 전송을 해주십시오.</span></td>
								</tr>
							</tbody>
						</table>
						<input type="submit" class="submit_btn" value="비밀번호 찾기">
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>