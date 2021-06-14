<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

성공적으로 제출하였습니다. 
<ul>
	<li> <a href="campaign/index.jsp">내 제안서 확인하기</a></li>
		<br> SELECT * FROM PROPOSAL WHERE USER_IDX = {#user_idx}
	<li> <a href="campaign/index.jsp">캠페인 메인 화면</a> </li>
	
</ul>
</body>
</html>