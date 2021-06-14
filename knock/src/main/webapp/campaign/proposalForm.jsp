<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.knock.model.vo.KeywordVO" %>
<%@ page import="com.knock.model.dao.KeywordDAO" %>

<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goBack(){
			window.history.back();
	}
</script>
</head>
<body>	
	<%@ include file="tempinclude.jsp" %>
	<form id="campaignForm" method="post" action="${contextPath}/campaign?type=proposal">
		<table>
			<thead>
				<tr>
					<td> 캠페인 이름 </td> 
					<td> <input type="text" name="p_title" placeholder="캠페인 이름을 입력하세요 "></td>
				</tr>
			<tbody>
				<tr>
					<td> 캠페인 취지 </td> 
					<td> <input type="text" name="goal" placeholder="캠페인 취지를 입력하세요 "></td>
				</tr>
				<tr>
					<td> 목표 포인트 </td>
				
					<td> <input type="number" name="goal_point" min="2500"></td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="p_content" cols=50 rows=20></textarea>
				</tr>
				<tr>
					<td> 키워드 : 최대 세 개까지 입력하실 수 있어요. </td>
					
					<td>
					<input type="text" name="p_keyword">
					<input type="text" name="p_keyword">
					<input type="text" name="p_keyword">
					</td>
				</tr>
				<tr>
					<td> 파일첨부 </td>
					<td>어렵다</td>
				</tr>
				
			</tbody>
		
		</table>
	
	<input type="hidden" name="user_idx" value="${user_idx }">
	<input type="submit" value="제안하기">
	<input type="button" value="취소하기" onClick="location.href='main.jsp'">
	
	</form>
	<footer class="footer py-4">
        	<%@ include file="../common/footer2.jsp" %>
           
        </footer>
</body>
</html>