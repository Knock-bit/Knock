<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 구글폰트 넣어보기-->
      <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath }/mypage/nowPoint.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	var uPoint = ${user.used_point/user.total_point*100};
	var ePoint = ${100-(user.used_point/user.total_point*100)};

	$("#uPoint").css("width",uPoint+"%");
	$("#ePoint").css("width",ePoint+"%");
	
	
});

</script>
<style>
	@keyframes stack1{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:${user.used_point/user.total_point*100}%; }
	}
	@keyframes stack2{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:${100-(user.used_point/user.total_point*100)}%; }
	}
	@keyframes stack3{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:100%; }
	}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-dark" id="mainNav">
            <%@ include file="../common/topmenubar2.jsp" %>
        </nav>
<div class="fullmain">
	<!-- top menu bar -->
	<%@ include file="/common/topmenubar.jsp" %>
	<hr>
	<div class="mainMenu">
		<%@ include file="/common/mypageMenubar.jsp" %>
		<div class="pointMain">
		
			<div class="topdan">
				<div class="pointGraph">
					<p id="pointNow"> MY POINT</p>
						<div class="point_view">
							<div class="graph stack1">
								<p>사용한 포인트</p>
								<span id="uPoint" >${user.used_point}</span>
								
							</div>
							<div class="graph stack2">
								<p>남은 포인트</p>
								<span id="ePoint" >${user.total_point-user.used_point}</span>
								
							</div>
							<div class="graph stack3">
								<p>총 포인트</p>
								<span style="width: 100%">${user.total_point}</span>
								
							</div>
						</div>
				</div>
			</div>
			
				<div class="bottomdan">
				<div style="width:90%">
					<div id="emblem" class="e1">
						<img src="${contextPath }/image/think-green.png">
					</div>
					<div id="emblem" class="e2">
						<img src="${contextPath }/image/recycle.png">
					</div>
					<div id="emblem" class="e3">
						<img src="${contextPath }/image/city.png">
					</div>
					<div id="emblem" class="e4">
						<img src="${contextPath }/image/heart.png">
					</div>
					<div id="emblem" class="e5">
						<img  src="${contextPath }/image/planet-earth.png">
					</div>
				</div>
			</div>
			
		<div>
	
	
	</div>
	<%@ include file="/common/footer.jsp" %>
</div>
</div>
</div>

</body>
</html>