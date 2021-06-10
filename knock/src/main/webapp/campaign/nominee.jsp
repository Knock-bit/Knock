<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath }" />
      <!DOCTYPE html>
      <html>

      <head>
        <style>
          .nominee {
            display: inline-block
          }

          .thumb {
            width: 200px;
          }
        </style>
       
        <meta charset="UTF-8">
        <title>펀딩중인 캠페인</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
        	$(function (){
            var exceed = parseInt("${nominee.goal_point}" - "${nominee.collected_point}");
            console.log("exceed : " + exceed);
            
            if (exceed <= 0) {
              $("#fundingForm").html("목표 달성으로 펀딩이 조기마감되었습니다")
            }
            
        	})
        	
        	
        </script>
      </head>
      
      <!-- <script>
      	var user_idx= "${user_idx}";
      	function participate(form) {
      		if(user_idx =="") {
      			alert("로그인페이지로 이동");
      		} else if {
      			form.submit();
      		}
      		
      	}
      </script> -->

      <body>
      <%@ include file="tempinclude.jsp" %>
        펀딩중인 캠페인<hr>
        <c:if test="${!empty nominee }">
            <div class="nominee">
              <div>캠페인 이름 : ${nominee.title }<br>주최자 : ${nominee.nickname }</div>
              <div>캠페인 소개. ${nominee.c_content } 캠페인 목표 : ${nominee.goal }<br>
              <div id="fundingForm">
              	  <c:if test="${empty check }">
              	  	  <!-- <form method="post"> -->
              	  	 <form method="post" action="${contextPath}/campaign?type=participate">
		              <!-- <input type="number" name="spent_point" placeholder="포인트입력"> -->
		              <input type="hidden" name="nominee_idx" value="${nominee.nominee_idx }">
		              <input type="submit" value="300포인트로 펀딩참여">
		              <!-- <input type="submit" onclick="participate(this.form)">펀딩참여</button> -->
		              </form>
              	  </c:if>
              	  <c:if test="${!empty check }">
              	  	  펀딩해주셔서 감사합니다.
              	  </c:if>
	              </div>
              </div>
              <fmt:formatDate var="endDate" value="${nominee.end_time }" pattern="yyyyMMdd" />
              <img class="thumb"
                src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1174&q=80">
              
              <div></div>
              <div></div>
              <div>${endDate - now}일 이후 종료! 
              <c:if test="${nominee.goal_point le nominee.collected_point }">
              		목표포인트 달성
              </c:if>
              <c:if test="${nominee.goal_point gt nominee.collected_point }">
              	목표포인트 ${nominee.goal_point } 모인 포인트 ${nominee.collected_point }              
              </c:if>
              <br>${nomUserList.size() }명 참여중</div>
            
            <div>캠페인 목표&키워드<br>${nominee.goal} + 키워드...</div>
            <div>참여중인 회원 목록 - 
            <c:forEach var="vo" items="${nomUserList}">
				${vo }
			</c:forEach>
				님이 참여중
        </c:if>
        <c:if test="${empty nominee }">
        	현재 펀딩중인 캠페인이 없습니다.
        </c:if>
      </body>
      
      </html>