<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="today" class="java.util.Date" scope="request"/>
<fmt:formatDate var="now" value="${today }" pattern ="yyyyMMdd" />
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
 <link href="${contextPath }/resources/css/styles.css" rel="stylesheet" />
<%-- <fmt:parseNumber var="now" value="${now.time / (1000*60*60*24)}" integerOnly ="true" /> --%>
  <head>
  	<title>Carousel 06</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="css/style.css">
  </head>
  <body>
		
		<section class="ftco-section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						

    <div class="item">
        <div class="work-wrap d-md-flex">
            <textarea >참가중인참여자명단
                <c:if test="${!empty ing_userList}">
<c:forEach var="vo" items="${ing_userList}">
${vo }
</c:forEach>
님이 참여중
</c:if>
</textarea>
            <!--캠페인 이미지 삽입하는 divclass-->
            
            <div class="img order-md-last" style="background-image: url(images/work-2.jpg);"></div>
            <div class="text text-left text-lg-right p-4 px-xl-5 d-flex align-items-center"></div>
                <div class="py-md-5">
                    <h2 class="mb-4">${campaignIng.title }</h2>
                    <p class="h6">suggested by ${campaignIng.nickname }</p>

                    <p class="h5 mb-4">${campaignIng.goal }캠페인골</p>
                    <p class=h7>키워드1</p>
                            <p class=h7>키워드2</p>
                            <p class=h7>키워드3</p>
                            <br>
                    <!--emblem-->
                    <img src="em.PNG" class="emblem"> 
                    <p class="h5 mb-4">ㅇㅇ일남았어요<br>
                    <!--<fmt:formatDate var="endDate" value="${vo.end_date }" pattern ="yyyyMMdd" />--></p>
                    <div class="row justify-content-end">
                        <div class="col-xl-8 ">
                            <p>캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.캠페인내용입니다.</p>
                            
                        </div>
                   
                    </div>
                    <p>
                        <button type="submit" class="btn btn-outline-dark mb-2 py-3 px-4">로그인하고 캠페인 참여하기</button>
                        <button type="button" class="btn btn-dark mb-2 py-3 px-4">후기보기</button>
                        
                        <!--여기 이 a 태그 어디다 넣을지 몰라서 아직 button에 삽입 못했음
                        <a id="participate" href="${contextPath }/campaign?type=participate&idx=${campaignIng.campaign_idx }"> </a> -->
                    </p>
                </div>
            </div>
        </div>
    </div>
    
</div>
</div>
</div>
</div>
</section>

  </body>
</html>
	
	
	  <!-- Footer-->
        <footer class="footer py-4">
        	<%@ include file="../common/footer2.jsp" %>
           
        </footer>
	
	
</body>
</html>