<%@page import="com.knock.model.vo.KeywordVO"%>
<%@page import="com.knock.common.DAO"%>
<%@page import="com.knock.common.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- 페이징처리 자바코드 -->
<%
Paging p = new Paging();

// 1. 전체 게시글 수량

// setTotalRegord : 전체 게시글 수 
p.setTotalRecord(DAO.getTotalCount());
// 나와야할 페이지 수 , 전체게시글  / numPerPage
// 나머지 존재시 +1 
p.setTotalPage();
System.out.println(p.getTotalPage());

// 2. 현재 페이지 구하기
String cPage = request.getParameter("cPage");
if (cPage != null) {
	p.setNowPage(Integer.parseInt(cPage));
}

// 3. 현재 페이지에 표시한 게시글 시작번호(begin), 끝번호(end) 구하기
p.setEnd(p.getNowPage() * p.getNumPerPage()); // 현재페이지번호 * 페이지당 게시글 수
p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

if (p.getEnd() > p.getTotalRecord()) {
	p.setEnd(p.getTotalRecord());
}

// 4. 페이지 블록 계산하기
// 페이지의 시작, 끝페이지 구하기 
int nowPage = p.getNowPage();
int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
p.setBeginPage(beginPage);
p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

// 4-1. 끝 페이지(endPage)가 전체페이지 수 (totalPage)보다 크면
// 끝 페이지를 전체페이지 수로 변경
if (p.getEndPage() > p.getTotalPage()) {
	p.setEndPage(p.getTotalPage());
}
// 현재 페이지 기준으로 DB데이터 가져오기
// 시작번호(begin) 끝번호(end) 사용 
List<KeywordVO> list = DAO.getList(p.getBegin(), p.getEnd());

// scope에 데이터 등록
pageContext.setAttribute("list", list);
pageContext.setAttribute("pvo", p);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<%@ include file="admininclude.jsp"%>
<script src="js/adminDelButton.js"></script>
<script src="js/adminAddButton.js"></script>
<style>
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
</style>
</head>
<body>
	<div class="container-sm">
		<form id="keywordForm" method="post">
			<table class="table" id="activeTable">
				<c:if test="${empty list }">
					<tr>
						<td>등록된 키워드가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<thead>
						<tr>
							<td>키워드 이름</td>
							<td>키워드 선택</td>
						</tr>
					</thead>
					<tbody id="tableList">
						<c:forEach var="keyword" items="${list }">
							<tr>
								<td>${keyword.k_content }</td>
								<td><input type="checkbox" name="keyname" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				<tr>
					<td><input type="text" name="keyadd" id="keyadd" /></td>
					<td><input type="button" value="추가하기" id="addButton" /></td>
					<!-- <td><input type="button" value="삭제하기" id="delButton" class="delButton" onclick="keywordDel1()"/></td> -->
					<td><input type="button" value="삭제하기" id="delButton"
						class="delButton" /></td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="4">
							<ol class="paging">
								<c:if test="${pvo.beginPage == 1 }">
									<li class='disable'>이전으로</li>
								</c:if>
								<c:if test="${pvo.beginPage != 1 }">
									<li><a
										href="admin?type=adminKeyword&cPage=${pvo.beginPage - 1 }">이전으로</a>
									</li>
								</c:if>
								<!-- 블록내 표시할 페이지 태그 작성 -->
								<c:forEach var="pageNo" begin="${pvo.beginPage}"
									end="${pvo.endPage}">
									<c:choose>
										<c:when test="${pageNo == pvo.nowPage}">
											<li class="now">${pageNo }</li>
										</c:when>
										<c:otherwise>
											<li><a href="admin?type=adminKeyword&cPage=${pageNo }">${pageNo }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- [다음으로] 사용여부 처리 -->
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">다음으로</li>
								</c:if>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li><a
										href="admin?type=adminKeyword&cPage=${pvo.endPage + 1 }">다음으로</a></li>
								</c:if>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>

