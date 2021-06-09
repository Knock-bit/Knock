<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<td> <input type="text" name="goal_point" placeholder="목표 포인트를 입력하세요 "></td>
				</tr>
				<tr>
					<td colspan="2">
					<textarea name="p_content" cols=50 rows=20></textarea>
				</tr>
			</tbody>
		
		</table>
	
	<input type="hidden" name="user_idx" value="1"><!-- 임시로 1로 해둠 -->
	<input type="submit" value="제안하기"> <input type="button" value="취소하기" onClick="location.href='main.jsp'">
	
	</form>
</body>
</html>