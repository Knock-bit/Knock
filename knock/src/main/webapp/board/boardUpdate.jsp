<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script>
	function delete_go(frm) {
		frm.action("${contextPath}/board?type=boardDelete");
		frm.submit();
	}
</script>
</head>
<body>
	<div id="board">
		<h1>게시글 수정</h1>
		<form method="post" action="index.jsp">
			<input type="hidden" name="command" value="boardUpdate">
			<input type="hidden" name="board_idx" value="${board.board_idx }">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" size="12" name="name" value="${board.user_idx }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="12" name="pass"> *게시물 수정 삭제시 필요합니다.</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="12" name="subject" value="${board.subject }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="70" rows="15" name="content">${board.b_content }"</textarea></td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" placeholder="파일첨부"></td>
				</tr>
			</table>
			<input type="submit" value="수정완료">
			<input type="reset" value="초기화">
			<input type="button" value="삭제" onclick="delete_go(this.form)">
			<input type="button" value="목록" onclick="location.href='index.jsp'">
		</form>
	</div>
</body>
</html>