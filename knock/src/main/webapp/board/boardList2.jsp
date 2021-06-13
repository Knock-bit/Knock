<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글리스트</title>
</head>
<body>
	<div id="board2">
		<h1>자유게시판</h1>
			<table class="list">
				<caption>공지사항</caption>
				<thead>
					<tr>
						<th>번호</th>
						<th>말머리</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<c:forEach var="board2" items="${boardList }">
				<tbody>
					<tr class="record">
						<td>${board.board_idx }</td>
						<td>${board.subject_idx }</td>
						<td>
							<a href="${board.board_idx }">
							${board.subject }</a>
						</td>
						<td>관리자</td>
						<td>${board.writeDate }</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
			<br><br>
			<table class="list">
				<thead>
					<tr>
						<th>번호</th>
						<th>말머리</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:forEach var="board2" items="${boardList }">
				<tbody>
					<tr class="record">
						<td>${board.board_idx }</td>
						<td>${board.subject_idx }</td>
						<td>
							<a href="${board.board_idx }">
							${board.subject }</a>
						</td>
						<td>${board.user_idx }</td>
						<td><fmt:formatDate value="${board.writeDate }"/></td>
						<td>${board.hit }</td>
					</tr>
				</tbody>
				</c:forEach>
				</tbody>
			</table>
			<br>
			<a href="write.jsp">글쓰기</a><a href="myWrite.jsp">내가쓴글</a>
			<input type="text" placeholder="검색내용"><input type="submit" value="검색" onClick="location.href='search.jsp'">
		</div>
</body>
</html>