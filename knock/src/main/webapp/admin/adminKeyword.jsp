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

p.setTotalRecord(DAO.getTotalCount());
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

List<KeywordVO> list = DAO.getList(p.getBegin(), p.getEnd());
System.out.println("> 현재페이지 글목록(list) : " + list);

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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
</head>
<style>

.container-sm {
	margin-left:400px;
	margin-top: 200px;

}
</style>
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
					<td><input type="button" value="삭제하기" id="delButton"
						class="delButton" /></td>
				</tr>
				<tfoot>
					<tr>
						<td colspan="4">
							<nav aria-label="...">
								<ul class="pagination">
									<c:if test="${pvo.beginPage == 1 }">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">이전으로</a></li>
									</c:if>
									<c:if test="${pvo.beginPage != 1 }">
										<li class="page-item"><a class="page-link"
											href="${contextPath }/admin?type=adminKeyword&cPage=${pvo.beginPage - 1 }">이전으로</a>
										</li>
									</c:if>
									<!-- 블록내 표시할 페이지 태그 작성 -->
									<c:forEach var="pageNo" begin="${pvo.beginPage}"
										end="${pvo.endPage}">
										<c:choose>
											<c:when test="${pageNo == pvo.nowPage}">
												<li class="page-item active" aria-current="page"><a
													class="page-link">${pageNo }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="${contextPath }/admin?type=adminKeyword&cPage=${pageNo }">${pageNo }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- [다음으로] 사용여부 처리 -->
									<c:if test="${pvo.endPage >= pvo.totalPage }">
										<li class="page-item"><a class="page-link"
											aria-disabled="true">다음으로</a></li>

									</c:if>
									<c:if test="${pvo.endPage < pvo.totalPage }">
										<li class="page-item disabled"><a class="page-link"
											href="${contextPath }/admin?type=adminKeyword&cPage=${pvo.endPage + 1 }">다음으로</a>
										</li>
									</c:if>
								</ul>
							</nav>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>

