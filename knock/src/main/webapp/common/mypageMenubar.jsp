<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${contextPath }/mypage/mypageMenubar.css" rel="stylesheet" />
<script>
$(function(){
	 $("#mypBtn").click(function(){
		 location.href="${contextPath }/mypage/mypage.jsp";
	 })
	
});


	function updateMyInfo(frm){
		frm.action = "${contextPath }/userctr?type=updateMyInfoBtn.do";
		frm.submit();
		
	}


</script>

</head>
<body>
<div class="menubar">
            <div class="mypage">
                <input type="button" id="mypBtn" value="MY PAGE" >
            </div>
            <div class="myList">
                <div class="updateInfo"> 
                    <form method="post">
                        <input type="hidden" name="user_idx" value="${user.user_idx}">
                        <input class ="infoUpdateBtn" type="button" value="내정보 수정" onclick="updateMyInfo(this.form)">
                    </form>
                </div>
                <div class="myPoint">
                    <form method="post">
                        <input class ="nowPointBtn" type="button" value="포인트 현황" onclick="location.href='${contextPath }/mypage/nowPoint.jsp'">
                    </form>
                </div>
                <div class="campaignBtn">
                    <div class="campaign">캠페인
                        <ui class="campaign-content">
                            <li><a href="${contextPath }/mypage/campaign_ing.jsp">참여중인 캠페인</a></li>
                            <li><a href="${contextPath }/userctr?type=endCam.do&user_idx=${user.user_idx }">종료된 캠페인</a></li>
                           
                        </ui>
                    </div>
                </div>
            </div>

        </div>
</body>
</html>