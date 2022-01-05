<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<fmt:formatDate var="now" value="${today }" pattern ="yyyyMMdd" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩중인 캠페인</title>
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


.progress {
    width: 150px;
    height: 150px !important;
    float: left;
    line-height: 150px;
    background: none;
    margin: 20px;
    box-shadow: none;
    position: relative
}

.progress:after {
    content: "";
    width: 100%;
    height: 100%;
    border-radius: 50%;
    border: 12px solid #fff;
    position: absolute;
    top: 0;
    left: 0
}

.progress>span {
    width: 50%;
    height: 100%;
    overflow: hidden;
    position: absolute;
    top: 0;
    z-index: 1
}

.progress .progress-left {
    left: 0
}

.progress .progress-bar {
    width: 100%;
    height: 100%;
    background: none;
    border-width: 12px;
    border-style: solid;
    position: absolute;
    top: 0
}

.progress .progress-left .progress-bar {
    left: 100%;
    border-top-right-radius: 80px;
    border-bottom-right-radius: 80px;
    border-left: 0;
    -webkit-transform-origin: center left;
    transform-origin: center left
}

.progress .progress-right {
    right: 0
}

.progress .progress-right .progress-bar {
    left: -100%;
    border-top-left-radius: 80px;
    border-bottom-left-radius: 80px;
    border-right: 0;
    -webkit-transform-origin: center right;
    transform-origin: center right;
    animation: loading-1 1.8s linear forwards
}

.progress .progress-value {
    width: 90%;
    height: 90%;
    border-radius: 50%;
    background: #000;
    font-size: 24px;
    color: #fff;
    line-height: 135px;
    text-align: center;
    position: absolute;
    top: 5%;
    left: 5%
}

.progress.blue .progress-bar {
    border-color: #049dff
}

.progress.blue .progress-left .progress-bar {
    animation: loading-2 1.5s linear forwards 1.8s
}

.progress.yellow .progress-bar {
    border-color: #fdba04
}

.progress.yellow .progress-right .progress-bar {
    animation: loading-3 1.8s linear forwards
}

.progress.yellow .progress-left .progress-bar {
    animation: none
}

@keyframes loading-1 {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg)
    }

    100% {
        -webkit-transform: rotate(180deg);
        transform: rotate(180deg)
    }
}

@keyframes loading-2 {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg)
    }

</style> 

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
        	$(function (){
            var exceed = parseInt("${nominee.goal_point}" - "${nominee.collected_point}");
            console.log("exceed : " + exceed);
            
            if (exceed <= 0) {
              $("#fundingForm").html("목표 달성으로 펀딩이 조기마감되었습니다")
            }
            
            // login 안된 상태면, 펀딩 참여 누를 시 로그인 화면으로 돌아갑니다.
            // index.jsp를 로그인 주소로 바궈주세요.
            var user_idx= "${user_idx}";
            console.log(user_idx);
            if(user_idx == ""){
            $("#fundingBtn").attr("action", "sign/login.jsp");
               	
            }
            
            
        	})
        	
        	</script>
</head>
<body>
 <nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav>

<section class="page-section" id="services">
            <div class="container">
                <div class="text-center ">
                <br>
                    <h2 class="section-heading text-uppercase">${nominee.title }</h2>
                </div>
                <!-- <div class="text-center"> -->
                
                
                <div class="row">
			 <fmt:formatDate var="endDate" value="${nominee.end_time }" pattern ="yyyyMMdd" />
			 <c:if test="${!empty nominee }">
			 <div class="col-lg-12 camp-card">
			 <div class="col-lg-6 camp-left">
  <img src="${nominee.c_file }" class="card-img-top" alt="...">
  </div>
  
  <div class="img order-md-last" style="background-image: url(images/work-2.jpg);"></div>
  <div class="col-lg-4 camp-right">
  <center>
  <br><br>
  <br>
   <h2 class="section-heading text-uppercase">${nominee.title }</h2>
                    <h3 class="c-goal section-subheading text-muted">suggested by ${nominee.nickname } </h3>
  <h3 class="c-goal text-muted"> ${nominee.goal } </h3>
 
    <p class="camp-emblem">
    <img src="${campaignIng.emblem }" width="200px"></p>
   <div id="c-content"> 캠페인 소개 내용. 왜 사냐건 웃지요 나를. 왜 사냐건 웃지요 나를.왜 사냐건 웃지요 나를.왜 사냐건 웃지요 나를 .왜 사냐건 웃지요 나를. 왜 사냐건 웃지요 나를.</div>
  <div class="footer">
	                 <p class="txt3"></p>
	                 
	                 <div>
	                 <c:if test="${nominee.goal_point le nominee.collected_point }">
              		목표포인트 달성
              </c:if>
              <c:if test="${nominee.goal_point gt nominee.collected_point }">
              	목표포인트 ${nominee.goal_point } 모인 포인트 ${nominee.collected_point }              
              </c:if>
              <br>${nomUserList.size() }명 참여중</div>
</div>

</textarea></div> <fmt:formatDate var="endDate" value="${nominee.end_time }" pattern="yyyyMMdd" />
	                 <p class="txt3"><i class="far fa-clock"></i>${endDate - now}일 남았어요&nbsp;<span class="comments"><i class="fas fa-comments"></i>45 Comments</span></p>
	             <div>${endDate - now}일 이후 종료! 

  </div>
  <c:if test="${empty check }">
   <form method="post" id="fundingBtn" action="${contextPath}/campaign?type=funding">
   <input type="hidden" name="campaign_idx" value="${nominee.campaign_idx }">
   <button type="submit" class="btn btn-outline-dark mb-2 py-3 px-4" >250포인트로 펀딩 참여하기</button>
                      </form>
                      </c:if>
                      <c:if test="${!empty check }">
              	  	  펀딩해주셔서 감사합니다.
              	  </c:if>
                      
  </c:if>
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