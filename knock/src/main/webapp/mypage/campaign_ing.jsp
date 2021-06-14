<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 진행중인 캠페인</title>
<link href="${contextPath }/mypage/campaign_ing.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
      htmlTag += "<img src='#'></div>";
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

<style>


</style>
</head>
<body>
<div class="fullmain">
   <!-- top menu bar -->
   <%@ include file="/common/topmenubar.jsp" %>
   <hr>
   <div class="mainMenu">
      <%@ include file="/common/mypageMenubar.jsp" %>
      <div class="cpingView">
         <div class="topdan">
            <div class="indan">
      
            </div>      
         </div>
      </div>
   </div>
   <%@ include file="/common/footer.jsp" %>
</div>

</body>
</html>