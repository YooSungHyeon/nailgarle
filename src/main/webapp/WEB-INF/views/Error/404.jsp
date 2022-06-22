<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="true"%>
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
	width:900px;
	text-align: center;
}
h1{
	margin-top: 200px;
    margin-bottom: 200px;
	text-align: center;
}
input {
	display: inline-block;
}
</style>
</head>
<body>
<div class="layout">
<h1>Error 404 페이지를 찾을 수 없습니다.</h1>
<input type="button" value="메인페이지로" onclick="location.href='${contextPath}/main/main.do'">
</div>
</body>
</html>