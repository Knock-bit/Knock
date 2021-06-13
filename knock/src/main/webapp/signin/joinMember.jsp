<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.knock.model.vo.MemberVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
String result=(String)request.getAttribute("result");
int num = Integer.parseInt(result);
 
String str = "";
if (num == 1) {
%>
	alert("회원가입을 축하드립니다.");
	window.location.href="main.jsp";
<% 
} else {%>
	alert("오류발생!!!!!!!!");
<%
}

%>
 