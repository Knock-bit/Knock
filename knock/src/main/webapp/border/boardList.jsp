<%@page import="com.knock.model.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.knock.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<div class="container">
		<div class="row">
		<p>공지사항</p>	
			<table style="text-align: center;">
				<thead>
					<tr>
						<th>번호</th>
						<th>말머리</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>공지사항</td>
						<td>
							<a href="#">제목1</a>
						</td>
						<td>관리자</td>
						<td>2021-06-10</td>
					</tr>
				</tbody>
			</table>
			<table style="text-align: center;">
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
				<tbody>
					<tr>
						<td>${vo.board_idx }</td>
						<td>잡담</td>
						<td>
							<a href="boardView.jsp?board_idx=${vo.board_idx }">제목1</a>	
						</td>
						<td>${user_idx }</td>
						<td>${vo.writeDate.substring(0,10) }</td>
						<td>${vo.hit }</td>
					</tr>
				</tbody>
				<!--
				<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
						<c:if test="${pvo.beginPage == 1 }">
							<li class='disable'>이전</li>
						</c:if>
						<c:if test="${pvo.beginPage != 1 }">
							<li>
								<a href="board.jsp?cPage=${pvo.beginPage - 1 }">이전</a>
							</li>
						</c:if>
						<c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
							<c:choose>
							<c:when test="${pageNo == pvo.nowPage}">
								<li class="now">${pageNo }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="board.jsp?cPage=${pageNo }">${pageNo }</a>
								</li>
							</c:otherwise>
							</c:choose>
						</c:forEach>		
						<c:if test="${pvo.endPage >= pvo.totalPage }">
							<li class="disable">다음</li>
						</c:if>
						<c:if test="${pvo.endPage < pvo.totalPage }">
							<li><a href="board.jsp?cPage=${pvo.endPage + 1 }">다음</a></li>
						</c:if>
						</ol>
					</td>
				</tr>
				</tfoot> -->
			</table>
			<div>
				<a href="boardWrite.jsp">글쓰기</a><a href="myWrite.jsp">내가쓴글</a>
				<input type="text" placeholder="글제목 검색">
				<input type="submit" value="검색" onClick="location.href='search.jsp'">
			</div>
		</div>
	</div>
</body>
</html>