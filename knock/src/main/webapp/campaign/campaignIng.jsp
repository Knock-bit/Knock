
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
.camp-card {
margin-bottom:50px;}
.c-keyword{
	border-radius:10px;
	background-color:#DFFDFC;
	padding-left:.5rem;
	padding-right:.5rem;
	display:inline-block;
	color:#2C9AF4;
}
label {
    display: inline-block;
}
label img {
    pointer-events: none;
}


</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
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
<p><p>
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
			 <div class="col-sm-12 col-lg-4 camp-card">
			 <div class="card h-100">
  <label for="camp"><img src="${vo.c_file }" class="card-img-top" alt="..."></label>
  <div class="card-body">
    <p class="card-text"><h2><a id="camp" href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">${vo.title }</a></h2></p>
    <label for="camp"><p class="text-muted"> ${vo.c_content } </label>&nbsp;
    
    
    <c:if test="${!empty vo.keyword1}"> <div class="c-keyword"> ${vo.keyword1}</div></c:if>
    <c:if test="${!empty vo.keyword2}"> <div class="c-keyword"> ${vo.keyword2}</div></c:if>
    <c:if test="${!empty vo.keyword3}"><div class="c-keyword">  ${vo.keyword3}</div></c:if>
    <div class="footer">
	                     <p><a class="waves-effect waves-light btn" href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">Read More</a></p>
	                 <p class="txt3"><i class="far fa-clock">${endDate - now}일 남았어요</i></p>
	             </div>
  </div>
</div></div>
			 
			 </c:forEach>
			 </c:if>
			 <c:if test ="${empty campaignIngList }">
		진행중인 캠페인이 없습니다.
	</c:if>
		
                    
                 </div></div>   
        </section>
	
	
	<section class="page-section" id="services">
            <div class="container">
                <div class="text-center ">
                    <h2 class="section-heading text-uppercase">완료된 캠페인</h2>
                    <h3 class="section-subheading text-muted">subtitle</h3>
                </div>
                <!-- <div class="text-center"> -->
                
                
                <div class="row">
            <c:if test="${!empty campaignedList }">
			 <c:forEach var="vo" items="${campaignedList}">
			 <fmt:formatDate var="endDate" value="${vo.end_date }" pattern ="yyyyMMdd" />
			 <div class="col-sm-12 col-lg-4 camp-card">
			 <div class="card h-100">
  <label for="camp"><img src="${vo.c_file }" class="card-img-top" alt="..."></label>
  <div class="card-body">
    <p class="card-text"><h2><a id="camp" href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">${vo.title }</a></h2></p>
    <label for="camp"><p class="text-muted"> ${vo.c_content } </label>&nbsp;&nbsp;
    
    
    <c:if test="${!empty vo.keyword1}"> <div class="c-keyword"> ${vo.keyword1}</div></c:if>
    <c:if test="${!empty vo.keyword2}"> <div class="c-keyword"> ${vo.keyword2}</div></c:if>
    <c:if test="${!empty vo.keyword3}"><div class="c-keyword">  ${vo.keyword3}</div></c:if>
    <div class="footer">
	                 <p><a class="waves-effect waves-light btn" href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">Read More</a></p>
	                
	             </div>
  </div>
</div></div>
			 
			 </c:forEach>
			 </c:if>
			 <c:if test ="${empty campaignedList }">
		완료된 캠페인이 없습니다.
	</c:if>
		
                    
                 </div></div>   
            
        </section>
	
	
	
	
	
	
	
	  <!-- Footer-->
        <footer class="footer py-4">
        	<%@ include file="../common/footer2.jsp" %>
           
        </footer>
	
	
</body>
</html>