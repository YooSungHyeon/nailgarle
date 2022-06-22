<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ddb9fdc368e57860edb508e2c16104cb"></script>
<title>Insert title here</title>
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
			<h6>제목</h6>
			<p><input type="text" value="${Plan.pl_Title }" disabled></p>
			<h6>여행 날짜</h6>
			<fmt:parseDate value="${Plan.pl_Date1}" pattern="yyyy-MM-dd" var="pl_Date1" type="both" />
			<fmt:parseDate value="${Plan.pl_Date2}" pattern="yyyy-MM-dd" var="pl_Date2" type="both" />
			<span><fmt:formatDate pattern="yyyy-MM-dd" value="${pl_Date1}"/> ~</span>
			<span> <fmt:formatDate pattern="yyyy-MM-dd" value="${pl_Date2}"/></span>
			<br><br>
			<h4>일정 작성</h4>	
			<div class="type_box">
				<table>
						<tr>
							<td style="color: white; background:gray;">장소</td>
							<td><input type="text" style=width:400px name="Pl_Place" value="${Plan.pl_Place }" disabled></td>
						</tr>
						<tr>
							<td style="color: white; background:gray;">설명</td>
							<td><textarea style=width:400px name="Pl_Text" disabled>${Plan.pl_Text}</textarea></td>
						</tr>
				</table>				
			</div>
			<c:if test="${Plan.memberId==memberInfo.memberId || memberInfo.memberId == 'admin'}">
			<a href="${contextPath}/board/modifyPlan.do?planNum=${Plan.planNum}"><input type="button" value="수정"></a>
			<a href="${contextPath}/board/deletePlan.do?planNum=${Plan.planNum}"><input type="button" value="삭제"></a>
			</c:if>
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