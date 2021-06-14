<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function () {
		var user_idx = "${user_idx}";
		if(user_idx == ""){
			$("#participate").attr("href","campaign/index.jsp");
		}
	})

</script>
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
<style>
.camp-card{
border: 1px solid black;
	border-radius: 10px;
    box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
    display: inline-block;
	width:"800px"}
.camp-left{
float: left}
.camp-right{
float: right;
margin-right:50px}
.c-keyword{
border-radious:.25rem;
color:skyblue;
display:inline;}
.c-goal{
font-size:1rem;
margin-bottom:1rem;
}
#c-content{
width:350px;}

</style> 
</head>
<body>
 <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav>

<section class="page-section" id="services">
            <div class="container">
                <div class="text-center ">
                <br>
                    <h2 class="section-heading text-uppercase">${campaignIng.title }</h2>
                    <h3 class="section-subheading text-muted">suggested by ${campaignIng.nickname } </h3>
                </div>
                <!-- <div class="text-center"> -->
                
                
                <div class="row">
			 <fmt:formatDate var="endDate" value="${vo.end_date }" pattern ="yyyyMMdd" />
			 <div class="col-lg-12 camp-card">
			 <div class="col-lg-6 camp-left">
  <img src="${campaignIng.c_file }" class="card-img-top" alt="...">
  </div>
  
  <div class="img order-md-last" style="background-image: url(images/work-2.jpg);"></div>
  <div class="col-lg-4 camp-right">
  <center>
  <br><br>
  <br>
   <h2 class="section-heading text-uppercase">${campaignIng.title }</h2>
                    <h3 class="c-goal section-subheading text-muted">suggested by ${campaignIng.nickname } </h3>
  <h3 class="c-goal text-muted"> ${campaignIng.goal } </h3>
  <c:if test="${!empty campaignIng.keyword1}"> <div class="c-keyword"># ${campaignIng.keyword1}</div></c:if>
    <c:if test="${!empty campaignIng.keyword2}"> <div class="c-keyword"># ${campaignIng.keyword2}</div></c:if>
    <c:if test="${!empty campaignIng.keyword3}"><div class="c-keyword"> # ${campaignIng.keyword3}</div></c:if>
	<br>
    <p class="camp-emblem">
    <img src="${campaignIng.emblem }" width="200px"></p>
   <div id="c-content"> 캠페인 소개 내용. 왜 사냐건 웃지요 나를. 왜 사냐건 웃지요 나를.왜 사냐건 웃지요 나를.왜 사냐건 웃지요 나를 .왜 사냐건 웃지요 나를. 왜 사냐건 웃지요 나를.</div>
  <div class="footer">
	                 <p class="txt3"></p><div class="ingUser"><center>
	    <div class="item">
        <div>
            <textarea cols=43 >참가중인 참여자명단
                <c:if test="${!empty ing_userList}">
<c:forEach var="vo" items="${ing_userList}">
${vo }
</c:forEach>
님이 참여중
</c:if>
</textarea></div>
	                 <p class="txt3"><i class="far fa-clock"></i>${endDate - now}일 남았어요&nbsp;<span class="comments"><i class="fas fa-comments"></i>45 Comments</span></p>
	             
  </div>
  
   <button id="participate" class="btn btn-outline-dark mb-2 py-3 px-4" onclick="location.href='/signin/login.jsp'">로그인하고 캠페인 참여하기</button>
                        <button type="button" class="btn btn-dark mb-2 py-3 px-4" onclick="location.href='#'">후기보기</button>
  
  
  <div class="card-body">
    
    
  </div>
</div></div>
			 
                 </div>   
        </section>
<!-- Footer-->
        <footer class="footer py-4">
        	<%@ include file="../common/footer2.jsp" %>
           
        </footer>


</body>
</html>