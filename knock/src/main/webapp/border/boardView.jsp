<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<div id="board">
		<h1>게시글 상세보기</h1>
		<table>
			<tr>
				<th>제목</th>
				<td>${board.subject }</td>
				<th>작성자</th>
				<td>${board.user_idx }</td>
			</tr>
			<tr>
				<th>사진</th>
				<td colspan="3">${board.b_file }</td>
				<th>내용</th>
				<td colspan="3"><pre>${board.b_content }</pre></td>		
			</tr>
		</table>
		<table>
			<tr>
				<td>사진</td>
				<td><input id="writer" placeholder="작성자" ></td>
				<td><textarea cols="30"
					placeholder="댓글 내용을 입력하세요." id="content"></textarea></td>
				<td>
					<button id="btnSave" type="button">등록</button>
				</td>
			</tr>
		</table>
		<!-- 로그인 아이디와 작성자 아이디 일치하면 활성화 아니면 비활성화 처리 -->
		<input type="button" value="수정" onclick="location.href='boardUpdate.jsp'">
		<div id="commentsList">
		</div>
		<br><br>
		<input type="button" value="닫기" onclick="location.href='boardList.jsp'">
	</div>
</body>
</html>