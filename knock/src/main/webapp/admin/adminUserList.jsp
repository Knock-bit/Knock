<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html>
<head>
	<meta charset = "UTF-8">
	<title></title>
	<!--jQuery import방식 2(CDN방식)-->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="stylemanagemembers.css">

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
		// 새로고침
		location.reload() 
 }
 

 </script>
 <title>관리자 - 회원관리</title>
</head>
<body>
	<h1>회원관리하기</h1>
	<div class="table100 ver3 m-b-110">
		
		<div class="table100-head">
			<table>
				<thead>
					<tr class="row100 head">
						<th class="cell100 column1">번호</th>
						<th class="cell100 column2">ID</th>
						<th class="cell100 column3">이름</th>
						<th class="cell100 column4">닉네임</th>
						<th class="cell100 column5">가입일</th>
						<th class="cell100 column5">최근접속일</th>
						<th class="cell100 column5">계정활성화상태</th>
						<th class="cell100 column5">활성/비활성</th>
					</tr>
				</thead>
			</table>
		</div>

		<div class="table100-body js-pscroll">
			<table>
				<thead>					<c:if test="${empty userList }">

					<tr class="row100 body">
						<td class="cell100 column1" colspan="7" align="center">가입한 회원이 없습니다.</td>
					</tr>
					</c:if>

				</thead>
				<c:if test="${!empty userList }">
					<c:forEach var="user" items="${userList }">
						<c:set var="user_idx" value="${user.user_idx }"></c:set>
						<tr>
							<td class="cell100 column1">${user.user_idx }</td>
							<td class="cell100 column1">${user.user_id }</td>
							<td class="cell100 column1">${user.name }</td>
							<td class="cell100 column1">${user.nickname }</td>
							<td class="cell100 column5"><fmt:formatDate value="${user.joindate }"
								pattern="yyyy.MM.dd" /><</td>
							<td class="cell100 column1"><fmt:formatDate value="${user.last_login_date }"
								pattern="yyyy.MM.dd" /></td>
								<c:if test="${user.knock_active eq 1}">
								<td class="cell100 column1">활성</td>
								</c:if>
								<c:if test="${user.knock_active eq 0}">
								<td class="cell100 column1">비활성</td>
								</c:if>
								<td class="cell100 column1"><input type="button" class="activeButton" value="활성/비활성"></td>

						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>