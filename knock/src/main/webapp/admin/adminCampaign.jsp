<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="admininclude.jsp"%>
</head>
<body>
	<div class="main">
		<div class="container">
			<form method="post" action="${contextPath }/admin?type=campaignOk"
				class="regCampaign" enctype="multipart/form-data">
				<div class="form-group-1">
					<label for="Campaign-title" class="form-label">캠페인 제목</label> <br>
					<input class="form-control form-control-sm" type="text"
						name="title" placeholder="캠페인 제목 입력" /> <br> <br> <label
						for="Campaign-content" class="form-label">캠페인 내용</label>
					<textarea class="form-control" id="c_content" name="content"
						rows="3"></textarea>

					<br> <label for="Campaign-goal" class="form-label">캠페인
						목표</label>
					<textarea class="form-control" id="goal" name="goal" rows="2"></textarea>

					<br> <label for="End-date" class="form-label">종료 날짜</label> <input
						type="date" id="start" name="trip-start" value="2021-06-15"
						min="2021-01-01" max="2040-12-31"> <br> <select
						name="category">
						<c:forEach var="item" items="${list }">
							<option value="${item.c_category }" name="category">
								${item.c_category_name }</option>
						</c:forEach>
					</select> <br> <br> file: <input type="file" name="file">
					<br> <input type="submit" value="전송">
				</div>
			</form>
		</div>
	</div>

</body>
</html>