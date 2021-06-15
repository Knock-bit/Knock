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
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	
   <style>
   #emble {
   width:80px;
   height:80px;
   }
   </style>
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
       
       
       
         <!-- Page Content  -->
         <div id="content" class="p-4 p-md-5">
             
            <div class="container">
            <p style="font-size:22px;">종료된 캠페인</p>
                 <p>[ Ended Campaign List ]</p>  
                  <div class="table-responsive">  
                    <table class="table">
                     <thead>
                         <tr class="title" style="background-color:gray; color:white;" >
                             <th class="no">NO</th>
                             <th class="category">CATEGORY</th>
                             <th class="ctitle">TITLE</th>
                             <th class="end_date">END_DATE</th>
                         </tr>
                     </thead>
                  <tbody>
                         <c:if test="${empty cclist }">
                             <tr>
                                 <td colspan="4">
                                     <p style="text-align:center; font-size:15px;">종료된 캠페인이 없습니다.</p>
                                 </td>
                             </tr>
                         </c:if>
                         <c:if test="${not empty cclist }">
                             <c:forEach var="user" items="${cclist }" varStatus="voNum">
                             <tr>
                                 <td>${voNum.count }</td>
                                 <td>${user.c_category_name }</td>
                                 <td>
                                     <a style="text-decoration:none; color:black;" href="${contextPath}/endCamView.jsp?campaign_idx=${user.campaign_idx }&cPage=nowpage">${user.title }</a>
                                 </td> 
                                 <td>${user.end_date }</td>
                             </tr>
                             </c:forEach>
                         </c:if>
                     </tbody>
               </table>
               </div>
            </div>      
                 
             <div class=pagingNum>
                <div class="paginging">
               
                        <ol class="paging">
	                        <c:if test="${pvo.beginPage == 1 }">
	                           <li id='disable'>이전으로</li>
	                        </c:if>
	                        <c:if test="${pvo.beginPage != 1 }">
	                           <li>
	                              <a href="${contextPath}/userctr?type=endCam.do&user_idx=${user.user_idx }&cPage=${pvo.beginPage-1 }">이전으로</a> <!-- 현재페이지에서 -1페이지 -->
	                           </li>
	                        </c:if>
	                        <%-- 블록 내 표시할 페이지 태그 작성 --%>
	                        <c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
	                           <c:choose>
	                           <c:when test="${pageNo == pvo.nowPage}">
	                              <span class="now">${pageNo }</span>
	                           </c:when>
	                           <c:otherwise>
	                              <li>
	                                 <a href="${contextPath}/userctr?type=endCam.do&user_idx=${user.user_idx }&cPage=${pageNo }">${pageNo }</a>
	                              </li>
	                           </c:otherwise>
	                           </c:choose>
	                        </c:forEach>      
	                        <%-- [다음으로] 사용여부 처리 --%>
	                        <c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disale">다음으로</li>
							</c:if>
	                        <c:if test="${pvo.endPage < pvo.totalPage }">
	                           <span><a href="${contextPath}/userctr?type=endCam.do&user_idx=${user.user_idx }&cPage=${pvo.endPage +1 }">다음으로</a></span>
	                        </c:if>
                        
                        
                        </ol>
             </div>
             </div>
         </div>

      </div>

   <%@ include file="/common/footer2.jsp" %>


</body>
</html>