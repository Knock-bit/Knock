<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
 $(() =>{
	 $(".activeButton").click(getActive);
 });
 
 function getActive(){  
		// 새로고침
		window.location.reload() 
	 var str = "";
	 var tdArr = new Array();
	 var checkBtn = $(this);
	 
	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	 var tr = checkBtn.parent().parent();
	 var td = tr.children();
	 
	/*  console.log("클릭한 Row의 모든 데이터 : " + tr.text()) */ 
	 var user_idx = td.eq(0).text();
	 var user_id = td.eq(1).text();
	 var active = {"user_idx" : user_idx, "user_id" : user_id};
	 /* 일단 쿼리스트링 사용해서 해결이다 씨바러 ㄴ아ㅣㅓ리ㅏㄴ얼 */
		$.ajax("${contextPath}/admin?type=active&idx="+user_idx,{
			type: "post",
			data: user_idx // 현재 상태 전송
		})

 }
 

 </script>
<title>관리자 - 회원관리</title>
</head>
<body>
	<div id="container">
		<table class="table" id="activeTable">
			<thead>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>닉네임</td>
					<td>가입일</td>
					<td>최근접속일</td>
					<td>계정활성화상태</td>
					<td>활성/비활성</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty userList }">
					<tr>
						<td colspan="5" align="center"><b>가입한 회원이 없습니다.</b></td>
					</tr>
				</c:if>
				<c:if test="${!empty userList }">
					<c:forEach var="user" items="${userList }">
						<c:set var="user_idx" value="${user.user_idx }"></c:set>
						<p>${user.knock_active }
						<tr>
							<td>${user.user_idx }</td>
							<td>${user.user_id }</td>
							<td>${user.name }</td>
							<td>${user.nickname }</td>
							<td><fmt:formatDate value="${user.joindate }"
									pattern="yyyy.MM.dd" /></td>
							<td><fmt:formatDate value="${user.last_login_date }"
									pattern="yyyy.MM.dd" /></td>
							<c:if test="${user.knock_active eq 1}">
								<td>활성</td>
							</c:if>
							<c:if test="${user.knock_active eq 0}">
								<td>비활성</td>
							</c:if>
							<td><input type="button" class="activeButton" value="활성/비활성" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>