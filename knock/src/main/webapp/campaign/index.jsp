<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<%@ include file="tempinclude.jsp" %>
	
<hr>
<a href="${contextPath }/campaign?type=nominee">현재 펀딩중인 캠페인</a><br>
<a href="${contextPath }/campaign?type=ingList">현재 진행중인 캠페인</a><br>
<a href="${contextPath }/campaign/proposalForm.jsp">캠페인 제안하기</a>
</body>
</html>


<hr>
to do List<br>
<ul>
<li>
비로그인 시, 캠페인 제안하기 누르면 로그인으로 이동</li>
<li> 포인트값 글쓰기 창과 연결 </li>
<li> 캠페인 종료 시 포인트분배...
<ol>
<li>SYSDATE> END_DATE면 캠페인 종료</li>
<li>campaing_ing status 0으로 변경</li>
<li>basepoint + estimate point 더하고 분배</li>
<li></li>
</ol></li>
</ul>
