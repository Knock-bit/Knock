<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${contextPath }/campaign?type=nomineeList">현재 펀딩중인 캠페인</a>
<a href="${contextPath }/campaign?type=ingList">현재 진행중인 캠페인</a>
<a href="proposalForm.jsp">캠페인 제안하기</a>
</body>
</html>