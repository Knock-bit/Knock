<%@page import="com.knock.model.vo.CommentsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.knock.model.vo.BoardVO"%>
<%@page import="com.knock.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");
	
	BoardVO bvo = BoardDAO.selectOne(b_idx);
	System.out.println("> bvo : " + bvo);
	
	List<CommentsVO> commentsList = BoardDAO.getCommentsList(b_idx);
	pageContext.setAttribute("c_list", commentsList);
	session.setAttribute("bvo", bvo);
	session.setAttribute("cPage", cPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script>
	function modify_go(frm) {
		frm.action = "boardUpdate.jsp";
		frm.submit();
	}
	function list_go(frm) {
		frm.action = "index.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<div id="board">
		<form method="post">
			<table>
			<caption>게시글 상세보기</caption>
				<tbody>
				<tr>
					<th>제목</th>
					<td>${bvo.subject}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${bvo.user_idx}</td>
				</tr>
				<tr>
					<th>사진</th>
					<td colspan="3">${bvo.b_file}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${bvo.b_content }</td>
				</tr>
				<tr>
					<c:if test="${not empty bvo.file_name }">
						<a href="download.jsp?f_name=${bvo.file_name }">${bvo.ori_name }</a>
					</c:if>
				</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<input type="button" value="수정" onclick="modify_go(this.form)">
							<input type="button" value="목록" onclick="list_go(this.form)">
							<input type="hidden" name="cPage" value="${cPage }">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
		<!-- 로그인 아이디와 작성자 아이디 일치하면 활성화 아니면 비활성화 처리 -->
		<form action="comments.jsp" method="post">
			<p>이름 : <input type="text" name="user_id"></p>
		<p>내용 : <textarea name="com_content" rows="3" cols="50"></textarea></p>
		<input type="submit" value="댓글저장">
		<input type="hidden" name="b_idx" value="${bvo.b_idx}">
		</form>
	
		<hr>
		댓...글
		<hr>
		
		<c:forEach var="comm" items="${c_list}">
		<div class="comment">
			<form action="commentsDel.jsp" method="post">
				<p>이름: ${comm.user_name} %nbsp;%nbsp; 작성일 : ${comm.writeDate}</p>
				<p>내용: ${comm.com_content}</p>
				<input type="submit" value="댓글삭제">
				<input type="hidden" name="comments_idx" value="${comm.comments_idx}">
			</form>
		</div>
		<hr>
		</c:forEach>
		<br><br>
		<input type="button" value="닫기" onclick="location.href='index.jsp'">
	</div>
</body>
</html>