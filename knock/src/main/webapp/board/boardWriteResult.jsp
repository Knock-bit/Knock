<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
게시글 등록완료..
<ul>
	<li><a href="${contextPath }/board/boardList2.jsp">자유게시판 목록</a></li>
	<li><a href="${contextPath }/board/boardList1.jsp">인증게시판 목록</a></li>
	<li><a href="${contextPath }/board/index.jsp">캠페인 메인</a></li>
</ul>
</body>
</html>