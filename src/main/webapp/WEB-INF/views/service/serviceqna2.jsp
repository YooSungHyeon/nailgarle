<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function product(value) {
		if (value == "상품문의") {
			document.getElementById("product_search").style.display = "";
		} else {
			document.getElementById("product_search").style.display = "none";
		}
	}

	var loopSearch = true;
	function keywordSearch() {
		var value = document.getElementById("productName").value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/service/keywordSearch.do",
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
				html += "<a href=\"javascript:select('"
						+ jsonInfo.productName[i] + "')\">"
						+ jsonInfo.productName[i] + "</a><br/>";
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

.service_container .sidebar .inQna {
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

.service_main h4 {
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.service_main table {
	margin: 0;
}

.service_main font {
	text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
}

.qnainfo {
	float: left;
	margin-top: 30px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	width: 80%;
}

.qnainfo td {
	padding: 0 30px 8px;
}

.qnainfo #detail_title {
	text-align: center;
}

.qnainfo #detail_title2 {
	width: 690px;
}

.qnainfo #detail_title2 .detail_name {
	width: 100%;
}

.qnainfo #detail_title2 .detail_text {
	width: 100%;
}

.qnainfo textarea {
	width: 100%;
	height: 300px;
	resize: none;
}

#suggest {
	display: none;
	position: absolute;
	left: 530px;
	top: 320px;
	border: 0.1px solid #87cb42;
	z-index: 3;
	font-weight: bold;
	background-color: #ffffff;
}
</style>
</head>
<body>
	<div class="layout">
		<div class="service_container">
			<h1>고객센터</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/service/service.do"><img
								class="board_img"
								src="${contextPath}/resources/image/board_service.svg" />자주 묻는
								질문</a></li>
						<li><a class="inQna"
							href="${contextPath}/service/serviceqna.do"><img
								class="board_img"
								src="${contextPath}/resources/image/board_qna.svg" />1:1 문의내역</a></li>
					</ul>
				</nav>
			</div>

			<div class="service_main">
				<h4>문의 작성</h4>
				<div class="qnainfo">
					<form action="${contextPath}/service/addQna.do" method="post"
						name="frmSearch" enctype="multipart/form-data">
						<table>
							<tr>
								<td id="detail_title">분류</td>
								<td id="detail_title2"><select id="option_select"
									name="qnaType" onChange="product(this.value);">
										<option value="상품문의">상품문의</option>
										<option value="건의사항">건의사항</option>
										<option value="기타">기타</option>
								</select></td>
							</tr>
							<tr>
								<td id="detail_title">비밀글</td>
								<td id="detail_title2"><input type="checkbox" id="check_YN"
									name="check_YN" style="width: 20px; height: 20px;"> <input
									type="hidden" id="qnaSecret" name="qnaSecret" value="N"></td>
							</tr>
							<tr>
								<td id="detail_title">제목</td>
								<td id="detail_title2"><input class="detail_name"
									type="text" name="qnaTitle" required /></td>
							</tr>
							<tbody id="product_search">
								<tr>
									<td id="detail_title">상품명</td>
									<td id="detail_title2"><input type="text" id="productName"
										name="productName" onKeyUp="keywordSearch()"
										style="width: 300px;" placeholder="상품명 입력"></td>
								</tr>
							</tbody>

							<tr>
								<td id="detail_title">내용</td>
								<td id="detail_title2"><textarea class="detail_text"
										name="qnaText"></textarea></td>
							</tr>

							<tr align="center" valign="middle">
								<td></td>
								<td colspan="5"><input type="submit" value="확인"> <input
									type="button" value="취소"
									onClick="location.href='serviceqna.do'"></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="suggest">
					<div id="suggestList"></div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		$("#check_YN").change(function() {
			if ($("#check_YN").is(":checked")) {
				$("#qnaSecret").val('Y');

			} else {

				$("#qnaSecret").val('N');
			}
		});
	</script>
</body>
</html>