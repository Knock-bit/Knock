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
      </head>


      <body>
        펀딩중인 캠페인<hr>
        <c:if test="${!empty nomineeList }">
          <c:forEach var="vo" items="${nomineeList}">
            <div class="nominee">
              <div>캠페인 이름 : ${vo.title }<br>주최자 : ${vo.user_idx }이거 닉네임으로 변환</div>
              <div>캠페인 소개. ${vo.c_content } 캠페인 목표 : ${vo.goal }<br>
              <input type="number" name="spent_point" placeholder="포인트입력">
              <input type="submit" value="펀딩참여"></div>
              <fmt:formatDate var="endDate" value="${vo.end_time }" pattern="yyyyMMdd" />
              <img class="thumb"
                src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1174&q=80">
              
              <div></div>
              <div></div>
              <div>${endDate - now}일 이후 종료! <br>campaign_nom_user명 참여중</div>
            
            <div>캠페인 목표&키워드<br>${vo.goal} + 키워드...</div>
            <div>참여중인 회원 목록 - campaign_nom_user 불러오기</div>
          </c:forEach>
        </c:if>
      </body>


      </html>