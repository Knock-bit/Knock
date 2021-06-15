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
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
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
        <link href="${contextPath }/mypage/updateMypage.css" rel="stylesheet" type="text/css">
  

   <!-- Style -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
   <script>
   $(function(){
      // 비밀번호 보기
      $("#showPwd").click(function(){
         
         var p1 = $("#pwd1");
         var p2 = $("#pwd2");

         var pwdType = p1.attr('type');
         
         if(pwdType == 'password'){
            
            p1.attr('type','text');
            p2.attr('type','text');
            $(this).val('비밀번호 숨기기');
            
         } else {
            p1.attr('type','password');
            p2.attr('type','password');
            $(this).val('비밀번호 보기');
         }
         
      });
      
      
      // 비밀번호 일치여부 확인
      $("#pwd1").keyup(function(){
         $(".successPwd").html("");

         var pv1 = $("#pwd1").val();
         var pv2 = $("#pwd2").val();
         console.log(pv1);
         console.log(pv2);
      });
      
      $("#pwd2").keyup(function(){
         if($("#pwd1").val()!=$("#pwd2").val()){
            $(".successPwd").html("비밀번호불일치<br><br>");
            $(".successPwd").css("color","red");
         } else {
            $(".successPwd").html("비밀번호일치<br><br>");
            $(".successPwd").css("color","blue");
            $(".upBtn").attr("disabled",false);
            $(".insertPw").css("display","none");
         }
      });
      
      
   });


       function readURL(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }
       
       
       function submitInfo(frm){
          frm.action="${contextPath }/userctr?type=updateMyInfo.do";
          frm.submit();
       }

       function deleteUser(frm){
           frm.action="${contextPath }/userctr?type=deleteUserBtn.do";
           frm.submit();
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
      <div class="updateMyInfoMain">
         <div class="dan1">
         
         </div>
         <div class="dan2">
                <div class="update_form">
                    <form method="post" enctype="multipart/form-data">
                        <div class="infoZone">
                            <div id="tId">
                                <p >아이디</p>
                                <input type="hidden" name="user_id" value="${user.user_id}">
                                <input type="text" name="user_id" value="${user.user_id}" disabled="disabled" ><br><br>
                            </div>
                            <div id="tPwd">
                                <p>비밀번호</p>
                                <input type="password" name="pwd" id="pwd1" placeholder="비밀번호를 입력해주세요"><br>
                                <input type="password" name="ckpwd" id="pwd2" placeholder="비밀번호를 다시 입력해주세요">
                                
                                <div class="pwdbtnss">
                                   <label class="successPwd"></label>
                                    <input id="showPwd" type="button" value="비밀번호 보기" >
                                </div>
                            </div>
                            <div>
                                <p>이름</p>
                                <input type="text" name="name" value="${user.name}" disabled="disabled"><br>

                                <p>이메일</p>
                                <input type="text" name="email" value="${user.email }"><br>

                                <p>생년월일</p>
                                <fmt:formatDate var="myBirth" value="${user.birth}" pattern="yyyy.MM.dd"/>
                                <input type="text" name="birth" value="${myBirth}" disabled="disabled"><br>

                                <p>성별</p>
                                   <c:if test="${user.gender==0 }">
                                    <c:set var="gender" value="Man"> </c:set>
                                 </c:if>
                                 <c:if test="${user.gender==1 }">
                                    <c:set var="gender" value="Woman"> </c:set>
                                 </c:if>
                                   <input type="text" name="gender" value="${gender}" disabled="disabled">
                            </div>
                            <br><br>
                            <div class="infoSubmit">
                                <input type="button" class="upBtn" value="정보 수정하기" onclick="submitInfo(this.form)" disabled>
                               <p class="insertPw" style="font-size:11px; width:100%; text-align:center;">비밀번호를 입력해주세요</p>
                            </div>
                        </div>
                        <div class="photoZone">
                            <div class="myphoto">
                                
                                <img id="preview" src="../resources/honggildong.png" width=180 height=200>

                                <label id="photoUplodeBtn" for="input-file">사진 업로드</label>
                                <input type="file" style="display:none;" name="imageFileName" onchange="readURL(this);" >

                                <input type="file" name="imageFileName" onchange="readURL(this);" >

                            </div>
                            <div id="delBtn" >
                               <input type="button" value="회원탈퇴" onclick="deleteUser(this.form)">
                            </div>

                        </div>
                        


                    </form>
                </div>
         
         
         </div>
         
      
      
      
      
      
      
      </div>

   </div>
   <%@ include file="/common/footer2.jsp" %>


</body>
</html>