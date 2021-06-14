<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date" scope="request"/>
<fmt:formatDate var="now" value="${today }" pattern ="yyyyMMdd" />
<%@page import="java.util.List"%>
<%@page import="com.knock.model.vo.CampaignIngVO"%>
<%@ page import="com.knock.model.dao.CampaignIngDAO" %>

<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>knockKnock</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="${contextPath }/resources/js/scripts.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
  
   
   <!-- Style -->
   
   
   <!--  -->
   </head>
    <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav> 
        <!-- nav -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="style.css" rel="stylesheet" type="text/css">
  
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<p><p><p><p><p><p><p><p>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="#"><br><br> Home</a>
          </li>
          <li>
              <a href="#"><br><span class="fa fa-user">&nbsp; MY PAGE </span><br></a>
          </li>
          <li>
            <a href="#"><br><span class="fa fa-cogs">&nbsp; 내 정보 수정</span><br></a>
          </li>
          <li>
            <a href="#"><br><span class="fa fa-sticky-note">&nbsp; 포인트 현황</span><br> </a>
          </li>
          <li>
            <a href="#"><br><span class="fa fa-paper-plane">&nbsp; 캠페인</span> <br></a>
          </li>
        </ul>

        <div class="footer">
        	<p>
					  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
					</p>
        </div>
    	</nav>
    	
    	
    	
    	  <!-- Page Content  -->
         <div id="content" class="p-4 p-md-5">
    	ddddddddd
    	ddddd
    	</div>
    	<%-- 
		<div class="pointMain">
		
			<div class="topdan">
				<div class="pointGraph">
					<p id="pointNow"> MY POINT</p>
						<div class="point_view">
							<div class="graph stack1">
								<p>사용한 포인트</p>
								<span id="uPoint" >${user.used_point}</span>
								
							</div>
							<div class="graph stack2">
								<p>남은 포인트</p>
								<span id="ePoint" >${user.total_point-user.used_point}</span>
								
							</div>
							<div class="graph stack3">
								<p>총 포인트</p>
								<span style="width: 100%">${user.total_point}</span>
								
							</div>
						</div>
				</div>
			</div>
			
				<div class="bottomdan">
				<div style="width:90%">
					<div id="emblem" class="e1">
						<img src="${contextPath }/image/think-green.png">
					</div>
					<div id="emblem" class="e2">
						<img src="${contextPath }/image/recycle.png">
					</div>
					<div id="emblem" class="e3">
						<img src="${contextPath }/image/city.png">
					</div>
					<div id="emblem" class="e4">
						<img src="${contextPath }/image/heart.png">
					</div>
					<div id="emblem" class="e5">
						<img  src="${contextPath }/image/planet-earth.png">
					</div>
				</div>
			</div>
			
		<div>
	
	
	</div> --%>
	<%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>