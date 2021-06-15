<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<% /*
	if (session.getAttribute("user_idx") == null) {
		session.setAttribute("msg", "게시물 작성은<br>로그인이 필요합니다.");
		response.sendRedirect("login.jsp"); //로그인페이지 입력
		return;
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script src="https://code.jquery.com/jquer-3.6.0.js"></script>
</head>
<body>
	<div id="board">
		<h1>게시글 등록</h1>
			<form method="post" action="board/boardWriteResult.jsp">
				<table>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="user_id" maxlength="20">${board.user_id}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" maxlength="50">${board.subject}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="b_content" maxlength="3000" style="height:350px">${board.b_content}</textarea></td>
					</tr>
					<tr>
						<th>파일첨부</th>
						<td><input name="b_file" type="file" placeholder="파일첨부">${board.b_file}</td>
					</tr>
				</table>
				<br>
				<button type="submit" class="button" id="btn">등록</button>
				<input type="button" value="목록으로" onclick="location.href='board/index.jsp'">
			</form>
	</div>
</body>
</html>