<%@page import="com.knock.model.vo.SubtitleVO"%>
<%@page import="com.knock.model.dao.BoardDAO"%>
<%@page import="com.knock.model.common.BoardPaging"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
BoardPaging p = new BoardPaging();

p.setTotalRecord(BoardDAO.getTotalCount1());
p.setTotalPage();
System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
System.out.println("> 전체 페이지 수 : " + p.getTotalPage());

String cPage = request.getParameter("cPage");
if (cPage != null) {
	p.setNowPage(Integer.parseInt(cPage));
}

p.setEnd(p.getNowPage() * p.getNumPerPage());
p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

if (p.getEnd() > p.getTotalRecord()) {
	p.setEnd(p.getTotalRecord());
}
System.out.println(">>현재페이지 : " + p.getNowPage());
System.out.println(">>시작번호(begin) : " + p.getBegin());
System.out.println(">>끝번호(end) : " + p.getEnd());

int nowPage = p.getNowPage();
int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
p.setBeginPage(beginPage);
p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

if (p.getEndPage() > p.getTotalPage()) {
	p.setEndPage(p.getTotalPage());
}
System.out.println(">>시작페이지(beginPage) : " + p.getBeginPage());
System.out.println(">>끝페이지(endPage) : " + p.getEndPage());

List<SubtitleVO> list = BoardDAO.getList1(p.getBegin(), p.getEnd());
System.out.println("> 현재페이지 글목록(list) : " + list);

pageContext.setAttribute("list", list);
pageContext.setAttribute("pvo", p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증게시판</title>
<style>
#bbs table {
	width: 580px;
	margin-left: 10px;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th, #bbs table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}

#bbs .align-left {
	text-align: left;
}

.title {
	background-color: lightsteelblue;
}

.no {
	width: 10%;
}

.writer {
	width: 15%;
}

.regdate {
	width: 20%;
}

.hit {
	width: 15%;
}

/***** 페이지 표시 부분 스타일(시작) ****/
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging .disable {
	border: 1px solid silver;
	padding: 3px 7px;
	color: silver;
}

.paging .now {
	border: 1px solid #ff4aa5;
	padding: 3px 7px;
	background-color: #ff4aa5;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}
/***** 페이지 표시 부분 스타일(끝) ****/
</style>
</head>
<body>
	<div class="board">
		<div class="row">
			<table style="text-align: center;">
				<thead>
					<tr class="title">
						<th class="no">번호</th>
						<th class="head">말머리</th>
						<th class="subject">글제목</th>
						<th class="writer">작성자</th>
						<th class="writeDate">작성일</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty list }">
						<tr>
							<td colspan="5">
								<h3>현재 등록된 게시글이 없습니다.</h3>
							</td>
						</tr>
					</c:if>
					<c:if test="${not empty list }">
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.board_idx }</td>
								<td>${vo.s_name }</td>
								<td><a
									href="${contextPath }/board?type=boardView&board_idx=${vo.board_idx }">${vo.subject }</a>
								</td>
								<td>${vo.user_idx }</td>
								<td>${vo.writeDate }</td>
								<td>${vo.hit }</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<ol class="paging">
								<c:if test="${pvo.beginPage == 1 }">
									<li class='disable'>이전</li>
								</c:if>
								<c:if test="${pvo.beginPage != 1 }">
									<li><a
										href="board?type=boardList1&cPage=${pvo.beginPage - 1 }">이전</a>
									</li>
								</c:if>
								<c:forEach var="pageNo" begin="${pvo.beginPage}"
									end="${pvo.endPage}">
									<c:choose>
										<c:when test="${pageNo == pvo.nowPage}">
											<li class="now">${pageNo }</li>
										</c:when>
										<c:otherwise>
											<li><a
												href="${contextPath }/board?type=boardList1&cPage=${pageNo }">${pageNo }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">다음</li>
								</c:if>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li><a
										href="${contextPath }/board?type=boardList1&cPage=${pvo.endPage + 1 }">다음</a></li>
								</c:if>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
			<div>
				<a href="${contextPath }/board?type=boardWrite">글쓰기</a><a
					href="myWrite.jsp">내가쓴글</a> <input type="text" placeholder="글제목 검색">
				<input type="submit" value="검색" onClick="location.href='search.jsp'">
			</div>
		</div>
	</div>
</body>
</html>