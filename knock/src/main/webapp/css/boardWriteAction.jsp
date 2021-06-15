<%@page import="com.knock.model.vo.BoardVO"%>
<%@page import="com.knock.model.dao.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!--
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='boardWirte.jsp'");
			script.println("</script>");
			}
	%>
 -->
</body>
</html>
