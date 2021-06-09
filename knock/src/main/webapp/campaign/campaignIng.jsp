<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date" scope="request"/>
<fmt:formatDate var="now" value="${today }" pattern ="yyyyMMdd" />
<%-- <fmt:parseNumber var="now" value="${now.time / (1000*60*60*24)}" integerOnly ="true" /> --%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style>
.campaign {
	display: inline-block}
.thumb {
	width: 200px;
}
</style>
<meta charset="UTF-8">
<title>참여중인 캠페인 목록</title>
</head>
<body>
	<c:if test="${!empty campaignIngList }">
	 <c:forEach var="vo" items="${campaignIngList}">
<%-- 		<fmt:parseDate var="endDate" value="${vo.end_date}" pattern="yyyyMMdd"/> --%>
		<%-- <fmt:formatDate var="endDate" value="${endDate} "/> --%>
		 <fmt:formatDate var="endDate" value="${vo.end_date }" pattern ="yyyyMMdd" />
		 <div class="campaign">
		 	<img class="thumb" src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1174&q=80">
		 	<h2><a href="${contextPath }/campaign?action=one&idx=${vo.campaign_idx }">${vo.title } </a></h2>
		 	<div>${vo.c_content }</div>
		 	<div>${endDate - now}일 남았어요<br>종료일:${endDate }</div>
		 	
		 	
	 </div>
	 </c:forEach>
	</c:if>
</body>
</html>