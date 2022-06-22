<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddb9fdc368e57860edb508e2c16104cb"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

function check_date(){
	
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	
	var date1 = $("#Pl_Date1").val();
	var date2 = $("#Pl_Date2").val();
	
	if(date1.value==''){
		alert('출발 날짜를 선택해주세요.');
		$("#Pl_Date1").focus();
		return false;
	} else if (date2.value==''){
		alert('도착 날짜를 선택해주세요.');
		$("#Pl_Date2").focus();
		return false;
	} else if (regex.test(date1) == false) {
		alert('출발 날짜를 선택해주세요.');
		$("#Pl_Date1").focus();
		return false;
	} else if (regex.test(date2) == false) {
		alert('도착 날짜를 선택해주세요.');
		$("#Pl_Date2").focus();
		return false;
	}
	
	
}

</script>
<style>
.layout{
	padding-top:40px;
	width:100%;
}
.map_container{
	width:1200px;
	height: 600px;
}
.map_container #map{
	width:600px;
	height:600px;
	float:left;
    border: 1px solid rgb(51, 102, 153);
}
.map_container .diary{
	width:600px;
	height:600px;
	float:left;
	padding: 50px;
    border: 1px solid rgb(51, 102, 153);
}
.map_container .diary .type_box table{
	margin: 1px;
}
.type_box textarea{
height:200px;
resize:none;
}
</style>
</head>
<body>

<div class="layout">
<!-- body부분 삽입-->
	<div class="map_container">
		<div id="map"></div>
		<div class="diary">
			<form action="${contextPath}/board/updatePlan.do" method="post" onSubmit="return check_date()">
			<input type="hidden" name="planNum" value="${Plan.planNum}">
			<h6>제목</h6>
			<p><input type="text" name="Pl_Title" value="${Plan.pl_Title}" required></p>
			<h6>여행 날짜</h6>
			<span>
			<input type="date" value="${Plan.pl_Date1}" id="Pl_Date1" name="Pl_Date1"> ~ 
			<input type="date" value="${Plan.pl_Date2}" id="Pl_Date2" name="Pl_Date2">
			</span>
			<br><br>
			<h4>일정 작성</h4>
			<div class="type_box">
				<table>
					<tbody>
						<tr>
							<td style="color: white; background:gray;">장소</td>
							<td><input type="text" style=width:400px name="Pl_Place" value="${Plan.pl_Place}" required></td>
						</tr>
						<tr>
							<td style="color: white; background:gray;">설명</td>
							<td><textarea style=width:400px name="Pl_Text">${Plan.pl_Text}</textarea></td>
						</tr>
					</tbody>
				</table>				
			</div>
			<input type="submit" value="일정 수정">
			<a href="${contextPath}/board/planboard.do"><input type="button" value="취소"></a>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddb9fdc368e57860edb508e2c16104cb"></script>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options);
</script>
</body>
</html>