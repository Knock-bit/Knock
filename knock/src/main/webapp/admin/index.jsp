<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<h1>관리자 메인페이지</h1>
	<a href="${contextPath }/admin?type=adminUserList">회원관리</a>
	<a href="${contextPath }/admin?type=adminKeyword">키워드관리</a>

</body>
</html>