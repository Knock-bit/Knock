<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Suggest Campaign</title>
      <!-- 구글폰트 넣어보기-->
      <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
      <!-- STYLE CSS -->
      <link rel="stylesheet" href="indexstyle.css">
   </head>

   <body>

      <div class="wrapper">
         <div class="inner">
            <form id="campaignForm" method="post" action="${contextPath}/campaign?type=proposal">
               <h1 text-align="center">관리자 페이지</h1>
               <h3>관리자로 접속하셨습니다.</h3>
               <p>원하는 페이지를 선택해주세요.</p>
               
                  <i class="zmdi zmdi-arrow-right"></i>
               <button class="button" onclick="location.href='${contextPath }/admin?type=adminUserList'">>&nbsp;&nbsp;회원관리 
                <button class="button" onclick="location.href='${contextPath }/admin?type=adminUserList'">>&nbsp;&nbsp;키워드관리 
                    <button class="button" onclick="location.href='${contextPath }/admin?type=adminUserList'">>&nbsp;&nbsp;캠페인관리 
                        <button class="button" onclick="location.href='${contextPath }/admin?type=logout'">>&nbsp;&nbsp;로그아웃 

                <i class="zmdi zmdi-arrow-right"></i>
               </button>
            </form>
         </div>
      </div>
   </body> 
</html>