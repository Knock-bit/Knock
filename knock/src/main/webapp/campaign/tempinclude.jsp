<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty user_idx }">
		<form method="post" action="${contextPath }/campaign?type=temp">
		<input type="number" name="user_idx">
		<input type="submit" value="임시로그인">
		</form>
	: 입력값(숫자)가 user_idx로 세션에 저장됨
	</c:if>
	<c:if test="${!empty user_idx }">
	
	user_idx: ${user_idx }<br>
		<input type="button" value="로그아웃" onclick="location.href='${contextPath}/campaign/templogout.jsp'">
		</form>
	임시로그인 해제
	</c:if>
	<hr>