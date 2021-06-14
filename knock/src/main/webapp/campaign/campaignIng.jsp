
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
}
</style>
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
  <img src="${vo.c_file }" class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text"><h2><a href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">${vo.title }</a></h2></p>
    <p class="text-muted"> ${vo.c_content } &nbsp;&nbsp;# ${vo.keyword1} # ${vo.keyword2}  # ${vo.keyword3}</p>
    <div class="footer">
	                 <p><a class="waves-effect waves-light btn" href="#">Read More</a><a id="heart"><span class="like"><i class="fab fa-gratipay"></i>Like</span></a></p>
	                 <p class="txt3"><i class="far fa-clock"></i>${endDate - now}일 남았어요<span class="comments"><i class="fas fa-comments"></i>45 Comments</span></p>
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
  <img src="${vo.c_file }" class="card-img-top" alt="...">
  <div class="card-body">
    <p class="card-text"><h2><a href="${contextPath }/campaign?type=ingOne&idx=${vo.campaign_idx }">${vo.title }</a></h2></p>
    <p class="text-muted"> ${vo.c_content } &nbsp;&nbsp;
    
    
    <c:if test="${!empty vo.keyword1}"> # ${vo.keyword1}</c:if>
    <c:if test="${!empty vo.keyword2}"> # ${vo.keyword2}</c:if>
    <c:if test="${!empty vo.keyword3}"> # ${vo.keyword3}</c:if>
    <div class="footer">
	                 <p><a class="waves-effect waves-light btn" href="#">Read More</a><a id="heart"><span class="like"><i class="fab fa-gratipay"></i>Like</span></a></p>
	                 <p class="txt3"><i class="far fa-clock"></i></p>
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