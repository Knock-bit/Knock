<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>knockKnock - 캠페인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="${contextPath }/resources/js/scripts.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav>
<body>
	
<hr>
<a href="${contextPath }/campaign?type=nominee">현재 펀딩중인 캠페인</a><br>
<a href="${contextPath }/campaign?type=ingList">현재 진행중인 캠페인</a><br>
<a href="${contextPath }/campaign/proposalForm.jsp">캠페인 제안하기</a>
</body>
</html>


<hr>
to do List!<br>
<ul>
<li>
비로그인 시, 캠페인 제안하기 누르면 로그인으로 이동</li>
<li> 포인트값 글쓰기 창과 연결 </li>

</ol></li><li>paging</li>
</ul>
