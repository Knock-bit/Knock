<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<div class="container">
                <a class="navbar-brand" href="${contextPath }/main.jsp"><img src="${contextPath }/resources/assets/img/knocklogo.png" alt="..." /><img src="${contextPath }/resources/assets/img/knocktext.png" alt="..." /></a>
                <button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <!-- <li class="nav-item"><a class="nav-link" href="#services">What is 놐놐</a>
                         -->
                         <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          What is 놐놐
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
                         
                        <li class="nav-item"><a class="nav-link" href="${contextPath }/campaign?type=ingList">캠페인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath }/campaign/proposalForm.jsp">캠페인 오픈하기</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">커뮤니티</a></li>
                        <c:if test="${!empty user }">
                        	<c:if test="${user.admin eq 0 }">
                        		<li class="nav-item"><a class="nav-link" href="${contextPath }/mypage/mypage.jsp">관리자</a></li>    
                        	</c:if>
                        <li class="nav-item"><a class="nav-link" href="${contextPath }/mypage/mypage.jsp">마이페이지</a></li>                        
                        </c:if>
          				 <c:if test="${empty user }">
                        <li class="nav-item"><a class="nav-link" href="${contextPath }/signin/login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${contextPath }/signin/regForm.jsp">회원가입</a></li>
                    	</c:if>
                    </ul>
                </div>
            </div>