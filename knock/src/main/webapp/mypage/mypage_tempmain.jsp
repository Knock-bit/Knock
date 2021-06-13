<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지임시메인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function moveMypage(frm){
	frm.action="${contextPath }/userctr?type=moveMypage.do"
	frm.submit();
}


</script>
</head>
<body>
	<form method="post">
		<input type="hidden" name="user_idx" value="1">
		<input type="submit" value="마이페이지" onclick="moveMypage(this.form)">
	</form>
</body>
</html>
