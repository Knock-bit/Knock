
	 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date" scope="request"/>
<fmt:formatDate var="now" value="${today }" pattern ="yyyyMMdd" />
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<%-- <fmt:parseNumber var="now" value="${now.time / (1000*60*60*24)}" integerOnly ="true" /> --%>
<!DOCTYPE html>
<html>
<head>
<style>
.campaign {
	display: inline-block}
.thumb {
	width: 200px;
}
</style>
<meta charset="UTF-8">
<title>진행중인 캠페인 목록</title>
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
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
         
</head>
<body>
 <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav>
<section class="page-section" id="services">
            <div class="container">
                <div class="text-center ">
                    <h2 class="section-heading text-uppercase">진행중인 캠페인</h2>
                    <h3 class="section-subheading text-muted">Join Campaign and Get Point!</h3>
                </div>
                <!-- <div class="text-center"> -->
                
                
                <div class="row">
            <c:if test="${!empty campaignIngList }">
			 <c:forEach var="vo" items="${campaignIngList}">
			 <fmt:formatDate var="endDate" value="${vo.end_date }" pattern ="yyyyMMdd" />
			 <div class="col-sm-12 col-lg-4">
			 <div class="card h-100">
  <img src="${vo.c_file }" class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text"><h2><a href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">${vo.title }</a></h2></p>
    <p class="text-muted"> ${vo.c_content } &nbsp;&nbsp;# </p>
    <div class="footer">
	                 <p><a class="waves-effect waves-light btn" href="#">Read More</a><a id="heart"><span class="like"><i class="fab fa-gratipay"></i>Like</span></a></p>
	                 <p class="txt3"><i class="far fa-clock"></i>${endDate - now}일 남았어요<span class="comments"><i class="fas fa-comments"></i>45 Comments</span></p>
	             </div>
  </div>
</div></div>
			 
			 </c:forEach>
			 </c:if>
			 
		<%-- 	 <div class=" col-md-4 tyle="width: 30rem;"">
			 <div class="container">
				 <div class=" col-md-4 card" style="width: 30rem;">
	                        <img class="card-img-top" src="${vo.c_file }" width= 250px>
	                        <!-- <span class="fa-stack fa-4x">
	                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
	                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
	                        </span> -->
	                        <h4 class="my-3"> ${vo.title }</h4>
	                        <p class="text-muted"> ${vo.c_content }</p>
	             <div class="footer">
	                 <p><a class="waves-effect waves-light btn" href="#">Read More</a><a id="heart"><span class="like"><i class="fab fa-gratipay"></i>Like</span></a></p>
	                 <p class="txt3"><i class="far fa-clock"></i>${endDate - now}일 남았어요<<span class="comments"><i class="fas fa-comments"></i>45 Comments</span></p>
	             </div>
	         </div>
	         </div></div> --%>=
         </div>
			 
		<%-- 	 
			 <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3"> ${vo.title }</h4>
                        <img src="${vo.c_file }" width="250px">
                        <p class="text-muted"> ${vo.c_content }</p>
                    </div>
			 </c:forEach>
			 </c:if> --%>
                    
                 </div></div>   
            </div>
        </section>
	<%@ include file="tempinclude.jsp" %>
	<c:if test="${!empty campaignIngList }">
	 <c:forEach var="vo" items="${campaignIngList}" varStatus="status">
	 
		 <fmt:formatDate var="endDate" value="${vo.end_date }" pattern ="yyyyMMdd" />
		 <div class="campaign">
		 	<img class="thumb" src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1174&q=80">
		 	<h2><a href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">${vo.title } </a></h2>
		 	<div>${vo.c_content }</div>
		 	<div>${endDate - now}일 남았어요<br> 종료일:${endDate }</div>
		  	${vo.keyword1 }
		 	${vo.keyword2 }
		 	${vo.keyword3 }
	 </div>
	 </c:forEach>
	</c:if>
	<c:if test ="${empty campaignIngList }">
		진행중인 캠페인이 없습니다.
	</c:if>
</body>
</html>