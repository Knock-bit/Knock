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
        <link href="${contextPath }/mypage/end_campaign.css" rel="stylesheet" type="text/css">
     <link href="${contextPath }/mypage/campaign_ing.css" rel="stylesheet" type="text/css">
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
   <!-- Style -->
   <script>
$(function(){
   fnAjax();

});
/* function camDetails(){
   // 상세보기 페이지 이동 링크 연결하기
   location.href=${contextPath};
   
} */


</script>
<script type="text/javascript">

function fnAjax(){
   console.log("-- fnAjax() 실행");
   /* alert(user.user_idx); */
   let user_idx = ${user.user_idx};
   $.ajax("${contextPath }/userctr?type=campaigning.do",{
      type:"get",
      data:"user_idx="+user_idx,
      dataType : "json",
      success : ajaxSuccess,
      error : fnAjaxError
   
   });
}

function ajaxSuccess(data){
   
   if(data.length==0){
      $indan = $(".indan");
      $indan.empty();
      let htmlTag = ""; 
      $.each(data, function(){
         htmlTag += "<div id='notCamapaign'>현재 참가하고 있는 캠페인이 없습니다.</div>";
      });
      $indan.html(htmlTag);
      
   } else {

   console.log(data);
   $indan = $(".indan");
   $indan.empty();
   let htmlTag = ""; 
   $.each(data, function(){
      htmlTag += "<div class='topdan4'><div class='cpInfo'>";
      htmlTag += "<div class='imgarea'>";
      htmlTag += "<img src='"+this.c_file+"'></div>";
      htmlTag += "<div class='textarea'><div class='eftDiv'><div class='DivTop'>";
      htmlTag += "<li id='fli'>" + this.title +"</li>";
      htmlTag += "<li id='sli'>[카테고리]" + this.c_category_name +"</li></div>";
      htmlTag += "<div class='middleDiv'>";
      htmlTag += "<div class='ingEmblem'>";
      htmlTag += "<img src='/image/think-green.png'></div></div>";
      htmlTag += "<div class='bottomDiv'>";
      htmlTag += "<div class='etime'>마감일:"+this.end_date+"</div>"; 
      htmlTag += "</div></div>";
      htmlTag += "<input type='button' value='상세보기'";
      htmlTag += "id='cdetail' onclick='camDetails()'>";
      htmlTag += "</div></div></div>";
   });
   $indan.html(htmlTag);
   }

}

function fnAjaxError(jqXHR, textStatus, errorThrown){
   alert("Ajax 처리 실패 : \n"
         + "jqXHR.readyState : " + jqXHR.readyState + "\n"
         + "textStatus : " + textStatus + "\n"
         + "errorThrown : " + errorThrown);
}
</script>
   
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
            <a href="${contextPath }/main.jsp"><br><br> Home</a>
          </li>
          <li>
              <a href="${contextPath }/mypage/mypage2.jsp"><br><span class="fa fa-user">&nbsp; MY PAGE </span><br></a>
          </li>
          <li>
            <a href="${contextPath }/mypage/updateMypage.jsp"><br><span class="fa fa-cogs"><br><span class="fa fa-cogs">&nbsp; 내 정보 수정</span><br></a>
          </li>
          <li>
            <a href="${contextPath }/mypage/nowPoint2.jsp"><br><span class="fa fa-sticky-note">&nbsp; 포인트 현황</span><br> </a>
          </li>
          <li>
            <a href="${contextPath }/mypage/campaign_ing.jsp"><br><span class="fa fa-paper-plane">&nbsp; 진행 중인 캠페인</span> <br></a>
          </li>
          <li>
            <a href="${contextPath }/userctr?type=endCam.do&user_idx=${user.user_idx }"><br><span class="fa fa-paper-plane">&nbsp; 종료된 캠페인</span> <br></a>
          </li>
        </ul>

        <div class="footer">
           <p>
                 Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
               </p>
        </div>
       </nav>

      <div class="cpingView">
         <div class="topdan">
            <div class="indan">
      
            </div>      
         </div>
      </div>
   </div>

   <%@ include file="/common/footer2.jsp" %>


</body>
</html>